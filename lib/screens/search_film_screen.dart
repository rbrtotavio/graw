import 'package:cinegraw_app/components/search_film_filters.dart';
import 'package:cinegraw_app/components/search_results.dart';
import 'package:flutter/material.dart';

class SearchFilmScreen extends StatefulWidget {
  const SearchFilmScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchFilmScreen> createState() => _SearchFilmScreenState();
}

class _SearchFilmScreenState extends State<SearchFilmScreen> {
  int quantCards = 9;

  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  void searchFilm(Map<String, dynamic> filtroFilme) {
    //TODO: Implementar função de procurar filme
    setState(() {});
    print(filtroFilme);
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
              quantCards: quantCards,
            ),
          ],
        ),
      ),
    );
  }
}
