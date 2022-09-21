import 'package:cinegraw_app/applications/implementation/films_app.dart';
import 'package:cinegraw_app/components/search_film_filters.dart';
import 'package:cinegraw_app/components/search_results.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:flutter/material.dart';

class SearchFilmScreen extends StatefulWidget {
  const SearchFilmScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchFilmScreen> createState() => _SearchFilmScreenState();
}

class _SearchFilmScreenState extends State<SearchFilmScreen> {
  final FilmsApp _filmsApp = FilmsApp();

  Map<String, dynamic> _filmFilter = {};
  List<FilmMovieDB> films = <FilmMovieDB>[];
  int page = 0;

  final ScrollController _scrollController = ScrollController();

  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  void searchFilm(Map<String, dynamic> filtroFilme) async {
    _filmFilter = filtroFilme;
    page = 1;
    films = await _filmsApp.searchFilms(
      _filmFilter["filmName"] ?? "",
      _filmFilter["release"] ?? "",
      _filmFilter["genre"] ?? "",
      page.toString(),
    );
    setState(() {});
  }

  void searchMoreFilm() async {
    page += 1;
    films += await _filmsApp.searchFilms(
      _filmFilter["filmName"] ?? "",
      _filmFilter["release"] ?? "",
      _filmFilter["genre"] ?? "",
      page.toString(),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        searchMoreFilm();
      }
    });
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
        controller: _scrollController,
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
