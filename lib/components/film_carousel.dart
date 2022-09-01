import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:flutter/material.dart';

import 'film_card.dart';

class FilmCarousel extends StatelessWidget {
  const FilmCarousel({
    Key? key,
    required this.films,
  }) : super(key: key);

  final List<FilmMovieDB> films;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        (films.length),
        (index) {
          if (index.isEven) {
            return FilmCard(film: films[index]);
          }
          return const SizedBox(width: 12);
        },
      ),
    );
  }
}
