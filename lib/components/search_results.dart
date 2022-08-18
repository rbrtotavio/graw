import 'package:cinegraw_app/components/film_card.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key, required this.quantCards}) : super(key: key);

  final int quantCards;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<Widget> generateCards() {
    var a = List.generate(widget.quantCards, (index) {
      return const FilmCard(title: "title");
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
