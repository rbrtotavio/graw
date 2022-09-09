import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

class FilmsApp {
  final MovieDBApiRepository _movieDBApiRepository = MovieDBApiRepository();

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
    String name,
    String releaseYear,
    String genreId,
    String page,
  ) async {
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

  Image getCardImage(imgPath) {
    var img = _movieDBApiRepository.getCardImage(imgPath);
    return img;
  }

  Image getCoverImage(imgPath) {
    var img = _movieDBApiRepository.getCoverImage(imgPath);
    return img;
  }
}
