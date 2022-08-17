import 'dart:convert';

import 'package:cinegraw_app/models/film.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MovieDBApiRepository {
  String _ApiUrl = "https://api.themoviedb.org/3";
  String _ApiKey = dotenv.env['MOVIEDB_KEY']!;

  MovieDBApiRepository() {}

  List<Film> getFilms(Map<String, dynamic> filters) {
    List<Film> filmes = <Film>[];
    return filmes;
  }

  Future<List<FilmMovieDB>> getTrendingFilms() async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    final response = await http
        .get(Uri.parse("$_ApiUrl/trending/movie/week?api_key=$_ApiKey"));

    if (response.statusCode == 200) {
      Map<String, dynamic> resultado = jsonDecode(response.body);

      for (Map<String, dynamic> film in resultado["results"]) {
        var filmapi = FilmMovieDB.fromJson(film);
        filmsApi.add(filmapi);
      }
    }

    return filmsApi;
  }

  Film getFilm(int idFilm) {
    return Film("teste");
  }

  List<Review> getReviews(int idFilm) {
    List<Review> reviews = <Review>[];
    return reviews;
  }
}
