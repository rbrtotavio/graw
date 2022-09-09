import 'dart:convert';
import 'package:cinegraw_app/env/env.dart';
import 'package:cinegraw_app/models/movieDB/configuration_movieDB.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDBApiRepository {
  final String _language = "pt-BR";
  String _apiUrl = "https://api.themoviedb.org/3";
  String _imgUrl = "https://image.tmdb.org/t/p/";
  List<String> _cardSizes = <String>["original"];
  List<String> _coverSizes = <String>["original"];
  ConfigurationMovieDB? configurationMovieDB;

  // Sigleton
  static final MovieDBApiRepository _movieDBApiRepository =
      MovieDBApiRepository._internal();
  factory MovieDBApiRepository() {
    _movieDBApiRepository.getConfiguration();
    return _movieDBApiRepository;
  }
  MovieDBApiRepository._internal();

  void getConfiguration() async {
    if (configurationMovieDB == null) {
      Uri api = Uri.parse("$_apiUrl/configuration?api_key=${Env.moviedb_key}");
      final response = await http.get(api);

      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        configurationMovieDB = ConfigurationMovieDB.fromJson(result["images"]);
        _imgUrl = configurationMovieDB!.secureUrlImage;
        _cardSizes = configurationMovieDB!.cardSize;
        _coverSizes = configurationMovieDB!.coverSize.reversed.toList();
      }
    }
  }

  Future<List<FilmMovieDB>> getPopularFilms() async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    Uri api = Uri.parse(
        "$_apiUrl/movie/popular?api_key=${Env.moviedb_key}&language=$_language");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      for (Map<String, dynamic> film in result["results"]) {
        var filmapi = FilmMovieDB.fromJson(film);
        filmsApi.add(filmapi);
      }
    }
    // TODO: TRATAR CASO STATUSCODE != 200
    return filmsApi;
  }

  Future<List<FilmMovieDB>> getNowPlaying() async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    Uri api = Uri.parse(
        "$_apiUrl/movie/now_playing?api_key=${Env.moviedb_key}&language=$_language");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      for (Map<String, dynamic> film in result["results"]) {
        var filmapi = FilmMovieDB.fromJson(film);
        filmsApi.add(filmapi);
      }
    }

    return filmsApi;
  }

  Future<List<FilmMovieDB>> getUpComing() async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    Uri api = Uri.parse(
        "$_apiUrl/movie/upcoming?api_key=${Env.moviedb_key}&language=$_language");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      for (Map<String, dynamic> film in result["results"]) {
        var filmapi = FilmMovieDB.fromJson(film);
        filmsApi.add(filmapi);
      }
    }

    return filmsApi;
  }

  Future<List<FilmMovieDB>> getTopRated() async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    Uri api = Uri.parse(
        "$_apiUrl/movie/top_rated?api_key=${Env.moviedb_key}&language=$_language");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      for (Map<String, dynamic> film in result["results"]) {
        var filmapi = FilmMovieDB.fromJson(film);
        filmsApi.add(filmapi);
      }
    }

    return filmsApi;
  }

  Future<List<Genre>> getGenres() async {
    List<Genre> genresApi = <Genre>[];

    Uri api = Uri.parse(
        "$_apiUrl/genre/movie/list?api_key=${Env.moviedb_key}&language=$_language");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      for (Map<String, dynamic> genre in result["genres"]) {
        var genreApi = Genre.fromJson(genre);
        genresApi.add(genreApi);
      }
    }
    // TODO: TRATAR CASO STATUSCODE != 200
    return genresApi;
  }

  Future<List<FilmMovieDB>> searchFilmByFilters(
    String releaseYear,
    String genreId,
    String page,
  ) async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    Uri api = Uri.parse(
        "$_apiUrl/discover/movie?api_key=${Env.moviedb_key}&sort_by=popularity.desc&primary_release_year=$releaseYear&with_genres=$genreId&language=$_language&page=$page");
    final response = await http.get(api);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      for (Map<String, dynamic> film in result["results"]) {
        var filmapi = FilmMovieDB.fromJson(film);
        filmsApi.add(filmapi);
      }
    }
    // TODO: TRATAR CASO STATUSCODE != 200
    return filmsApi;
  }

  Future<List<FilmMovieDB>> searchFilmByName(
    String releaseYear,
    String name,
    String page,
  ) async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    Uri api = Uri.parse(
        "$_apiUrl/search/movie?api_key=${Env.moviedb_key}&sort_by=popularity.desc&primary_release_year=$releaseYear&query=$name&language=$_language&page=$page");
    final response = await http.get(api);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      for (Map<String, dynamic> film in result["results"]) {
        var filmapi = FilmMovieDB.fromJson(film);
        filmsApi.add(filmapi);
      }
    }
    // TODO: TRATAR CASO STATUSCODE != 200
    return filmsApi;
  }

  Image getCardImage(String imgPath) {
    bool error = false;
    // TODO: criar cardholder
    Image img = Image.network("${_imgUrl}original$imgPath");

    for (var size in _cardSizes) {
      var imgTemp = Image.network(
        "${_imgUrl}${size}$imgPath",
        errorBuilder: (context, error, stackTrace) {
          error = true;
          return SizedBox();
        },
      );

      if (!error == true) {
        img = imgTemp;
        break;
      }
    }

    return img;
  }

  Image getCoverImage(String imgPath) {
    bool error = false;
    // TODO: criar coverholder
    Image img = Image.network("${_imgUrl}original$imgPath");

    for (var size in _coverSizes) {
      var imgTemp = Image.network(
        "${_imgUrl}${size}$imgPath",
        errorBuilder: (context, error, stackTrace) {
          error = true;
          return SizedBox();
        },
      );

      if (!error == true) {
        img = imgTemp;
        break;
      }
    }

    return img;
  }
}
