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
    setState(() {
      quantCards = filtroFilme['quantidade'] as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _gotoReturn(context);
                },
              ),
              Text(widget.title),
            ],
          ),
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
      ),
    );
  }
}
