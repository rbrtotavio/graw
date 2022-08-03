import 'package:cinegraw_app/components/search_film_filter.dart';
import 'package:flutter/material.dart';

class SearchFilmScreen extends StatefulWidget {
  const SearchFilmScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchFilmScreen> createState() => _SearchFilmScreenState();
}

class _SearchFilmScreenState extends State<SearchFilmScreen> {
  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // TODO: a discutir
        primarySwatch: Colors.blueGrey,
      ),
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
        body: Column(
          children: const [
            SearchFilmFilter(),
          ],
        ),
      ),
    );
  }
}
