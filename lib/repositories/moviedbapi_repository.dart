import 'package:cinegraw_app/models/film.dart';
import 'package:cinegraw_app/models/review.dart';

class MovieDBApiRepository {
  String _ApiKey = "";

  MovieDBApiRepository() {
    _ApiKey = "KEY";
  }

  List<Film> getFilms(Map<String, dynamic> filters) {
    List<Film> filmes = <Film>[];
    return filmes;
  }

  Film getFilm(int idFilm) {
    return Film("teste");
  }

  List<Review> getReviews(int idFilm) {
    List<Review> reviews = <Review>[];
    return reviews;
  }
}
