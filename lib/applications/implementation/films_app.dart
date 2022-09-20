import 'package:cinegraw_app/applications/interface/base_app.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:cinegraw_app/models/result.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FilmsApp extends BaseApp {
  FilmsApp();

  Future<List<Genre>> getGenres() async {
    return await movieDBApiRepository.getGenres();
  }

  Future<List<FilmMovieDB>> getCarroselFilms(String category) async {
    Map<String, Function> searchRepositoryMethods = {
      "Populares": movieDBApiRepository.getPopularFilms,
      "Lançamentos": movieDBApiRepository.getNowPlaying,
      "Em breve": movieDBApiRepository.getUpComing,
      "Melhores filmes": movieDBApiRepository.getTopRated
    };

    return await Function.apply(searchRepositoryMethods[category]!, null);
  }

  Future<List<FilmMovieDB>> searchFilms(
      String name, String releaseYear, String genreId, String page) async {
    if (name != "") {
      var films =
          await movieDBApiRepository.searchFilmByName(releaseYear, name, page);
      if (genreId != "") {
        films = films
            .where((film) => film.genresIds.contains(int.parse(genreId)))
            .toList();
      }
      return films;
    }

    return await movieDBApiRepository.searchFilmByFilters(
        releaseYear, genreId, page);
  }

  Image getCardImage(String imgPath) {
    var img = movieDBApiRepository.getCardImage(imgPath);
    return img;
  }

  Image getCoverImage(String imgPath) {
    var img = movieDBApiRepository.getCoverImage(imgPath);
    return img;
  }

  Future<List<Review>> getFilmReviews(int filmId) async {
    return await firestoreReviewRepository.getReviewsByFilm(filmId);
  }

  Future<List<Review>> getUserReviews(String userId) async {
    return await firestoreReviewRepository.getReviewsByUser(userId);
  }

  Future<Result> reviewFilm(
      int filmId, String review, double nota, String? reviewId) async {
    var user = firebaseAuthRepository.getUser();
    if (user == null) {
      return Result.Error("É necessario estar logado para realizar essa ação");
    }

    DateTime dataReview = DateTime.now();
    reviewId ??= const Uuid().v4();
    var resultado = await firestoreReviewRepository.reviewFilm(
        filmId, review, nota, dataReview, user.uid, reviewId);

    if (resultado.isNotEmpty) {
      return Result.Error(resultado);
    }
    return Result.Success("");
  }

  Future<Result> deleteReview(String reviewId) async {
    var user = firebaseAuthRepository.getUser();
    if (user == null) {
      return Result.Error("É necessario estar logado para realizar essa ação");
    }

    var resultado = await firestoreReviewRepository.deleteReview(reviewId);

    if (resultado.isNotEmpty) {
      return Result.Error(resultado);
    }
    return Result.Success("");
  }
}
