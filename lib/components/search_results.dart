import 'package:cinegraw_app/components/film_card.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key, required this.films}) : super(key: key);

  final List<FilmMovieDB> films;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<Widget> generateCards() {
    var a = List.generate(widget.films.length, (index) {
      var film = widget.films[index];
      return FilmCard(film: film);
    });
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: generateCards(),
    );
  }
}
