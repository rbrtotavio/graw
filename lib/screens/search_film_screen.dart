import 'package:cinegraw_app/components/search_film_filters.dart';
import 'package:cinegraw_app/components/search_results.dart';
import 'package:cinegraw_app/models/film.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

class SearchFilmScreen extends StatefulWidget {
  const SearchFilmScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchFilmScreen> createState() => _SearchFilmScreenState();
}

class _SearchFilmScreenState extends State<SearchFilmScreen> {
  MovieDBApiRepository _movieDBApiRepository = MovieDBApiRepository();
  List<Film> films = <Film>[];

  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  void searchFilm(Map<String, dynamic> filtroFilme) async {
    films.clear();
    var filmsApi = await _movieDBApiRepository.searchFilm(
      filtroFilme["release"] ?? "",
      filtroFilme["genre"] ?? "",
    );

    for (var i = 0; i < 10; i++) {
      films.add(Film(filmsApi[i].title));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.title),
          ],
        ),
        actions: const [
          SizedBox(
            width: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchFilmFilters(
                searchFilm: (filtroFilme) => searchFilm(filtroFilme)),
            SearchResults(
              films: films,
            ),
          ],
        ),
      ),
    );
  }
}
