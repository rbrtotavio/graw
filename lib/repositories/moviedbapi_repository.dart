import 'dart:convert';

import 'package:cinegraw_app/env/env.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:http/http.dart' as http;

class MovieDBApiRepository {
  final String _apiUrl = "https://api.themoviedb.org/3";

  MovieDBApiRepository() {}

  Future<List<FilmMovieDB>> getPopularFilms() async {
    List<FilmMovieDB> filmsApi = <FilmMovieDB>[];

    Uri api = Uri.parse(
        "$_apiUrl/movie/popular?api_key=${Env.moviedb_key}&language=pt-BR");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      Map<String, dynamic> resultado = jsonDecode(response.body);

      for (Map<String, dynamic> film in resultado["results"]) {
        var filmapi = FilmMovieDB.fromJson(film);
        filmsApi.add(filmapi);
      }
    }

    return filmsApi;
  }

  List<Review> getReviews(int idFilm) {
    List<Review> reviews = <Review>[];
    return reviews;
  }
}
