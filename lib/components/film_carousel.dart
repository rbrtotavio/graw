import 'package:cinegraw_app/models/film.dart';
import 'package:flutter/material.dart';

import 'film_card.dart';

class FilmCarousel extends StatelessWidget {
  const FilmCarousel({
    Key? key,
    required this.films,
  }) : super(key: key);

  final List<Film> films;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        (films.length * 2),
        (index) {
          if (index.isEven) {
            return FilmCard(title: films[index ~/ 2].title);
          }
          return const SizedBox(width: 12);
        },
      ),
    );
  }
}
