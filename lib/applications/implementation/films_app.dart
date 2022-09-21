import 'package:cinegraw_app/models/movieDB/credits.dart';
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

  Future<String> getDirector(int filmId) async {
    List<Crew> crew = await movieDBApiRepository.getCrew(filmId);
    String director = "";
    for (var crewmate in crew) {
      if (crewmate.job == "Director") {
        director = crewmate.name.toString();
      }
    }
    return director;
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
}
