import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:cinegraw_app/repositories/firebase_auth_repository.dart';
import 'package:cinegraw_app/repositories/firebase_firestore.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

class FilmsApp {
  final MovieDBApiRepository _movieDBApiRepository = MovieDBApiRepository();
  final FireBaseFireStoreRepository _fireBaseFireStoreRepository =
      FireBaseFireStoreRepository();
  final FirebaseAuthRepository _firebaseAuthRepository =
      FirebaseAuthRepository();

  FilmsApp();

  Future<List<Genre>> getGenres() async {
    return await _movieDBApiRepository.getGenres();
  }

  Future<List<FilmMovieDB>> getCarroselFilms(String category) async {
    Map<String, Function> searchRepositoryMethods = {
      "Populares": _movieDBApiRepository.getPopularFilms,
      "Lançamentos": _movieDBApiRepository.getNowPlaying,
      "Em breve": _movieDBApiRepository.getUpComing,
      "Melhores filmes": _movieDBApiRepository.getTopRated
    };

    return await Function.apply(searchRepositoryMethods[category]!, null);
  }

  Future<List<FilmMovieDB>> searchFilms(
      String name, String releaseYear, String genreId, String page) async {
    if (name != "") {
      var films =
          await _movieDBApiRepository.searchFilmByName(releaseYear, name, page);
      if (genreId != "") {
        films = films
            .where((film) => film.genresIds.contains(int.parse(genreId)))
            .toList();
      }
      return films;
    }

    return await _movieDBApiRepository.searchFilmByFilters(
        releaseYear, genreId, page);
  }

  Image getCardImage(String imgPath) {
    var img = _movieDBApiRepository.getCardImage(imgPath);
    return img;
  }

  Image getCoverImage(String imgPath) {
    var img = _movieDBApiRepository.getCoverImage(imgPath);
    return img;
  }

  Future<List<Review>> getFilmReviews(int filmId) async {
    return await _fireBaseFireStoreRepository.getReviewsByFilm(filmId);
  }

  void reviewFilm(int filmId, String review, double nota, String? reviewId) {
    DateTime dataReview = DateTime.now();
    var user = _firebaseAuthRepository.getUser();

    if (user == null) {
      print("usuario nao esta logado"); // TODO: Tratar usuario nao logado
      return;
    }

    reviewId ??= UniqueKey().toString(); // TODO: alterar para GUID
    print(reviewId);

    _fireBaseFireStoreRepository.reviewFilm(
        filmId, review, nota, dataReview, user.uid, reviewId);
  }
}
