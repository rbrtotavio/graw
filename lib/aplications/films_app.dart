import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';

class FilmsApp {
  FilmsApp();
  final MovieDBApiRepository _movieDBApiRepository = MovieDBApiRepository();

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
}
