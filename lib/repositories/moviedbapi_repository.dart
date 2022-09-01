import 'dart:convert';

import 'package:cinegraw_app/env/env.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDBApiRepository {
  final String _apiUrl = "https://api.themoviedb.org/3";
  final String _imgUrl =
      "https://image.tmdb.org/t/p/"; // TODO: pegar de configuration API?
  final String _language = "pt-BR";

  MovieDBApiRepository() {}

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

  Future<List<FilmMovieDB>> searchFilm(
      String releaseYear, String genreId) async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    Uri api = Uri.parse(
        "$_apiUrl/discover/movie?api_key=${Env.moviedb_key}&sort_by=popularity.desc&primary_release_year=$releaseYear&with_genres=$genreId&language=$_language");
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

  Image renderImage(String imgUrl) {
    return Image.network("$_imgUrl/w300/$imgUrl");
  }
}
