import 'package:cinegraw_app/components/search_film_filters.dart';
import 'package:cinegraw_app/components/search_results.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

class SearchFilmScreen extends StatefulWidget {
  SearchFilmScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  MovieDBApiRepository _movieDBApiRepository = MovieDBApiRepository();

  @override
  State<SearchFilmScreen> createState() => _SearchFilmScreenState();
}

class _SearchFilmScreenState extends State<SearchFilmScreen> {
  Map<String, dynamic> _filmFilter = {};
  List<FilmMovieDB> films = <FilmMovieDB>[];

  ScrollController _scrollController = ScrollController();
  int page = 0;

  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  void searchFilm(Map<String, dynamic> filtroFilme) async {
    _filmFilter = filtroFilme;
    page = 1;
    films = await widget._movieDBApiRepository.searchFilm(
      _filmFilter["release"] ?? "",
      _filmFilter["genre"] ?? "",
      page.toString(),
    );
    setState(() {});
  }

  void searchMoreFilm() async {
    page += 1;
    films += await widget._movieDBApiRepository.searchFilm(
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
        print("buscando filmes");
        searchMoreFilm();
        print(films.length);
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
