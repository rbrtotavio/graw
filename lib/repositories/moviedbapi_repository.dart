import 'dart:convert';

import 'package:cinegraw_app/env/env.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:http/http.dart' as http;

class MovieDBApiRepository {
  final String _apiUrl = "https://api.themoviedb.org/3";
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

    return genresApi;
  }
}
