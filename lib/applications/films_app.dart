import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

class FilmsApp {
  final MovieDBApiRepository _movieDBApiRepository = MovieDBApiRepository();

  FilmsApp();

  Future<List<FilmMovieDB>> getPopularFilms() async {
    return await _movieDBApiRepository.getPopularFilms();
  }

  Future<List<FilmMovieDB>> getNowPlaying() async {
    return await _movieDBApiRepository.getNowPlaying();
  }

  Future<List<FilmMovieDB>> getUpComing() async {
    return await _movieDBApiRepository.getUpComing();
  }

  Future<List<FilmMovieDB>> getTopRated() async {
    return await _movieDBApiRepository.getTopRated();
  }

  Future<List<Genre>> getGenres() async {
    return await _movieDBApiRepository.getGenres();
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

  Image renderImage(imgPath) {
    // TODO: ajustar retorno da image, caso erro
    return _movieDBApiRepository.getImage(imgPath);
  }
}
