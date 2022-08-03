import 'package:flutter/material.dart';

import 'film_card.dart';

class FilmCarousel extends StatelessWidget {
  const FilmCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        FilmCard(),
        SizedBox(width: 12),
        FilmCard(),
        SizedBox(width: 12),
        FilmCard(),
        SizedBox(width: 12),
        FilmCard(),
        SizedBox(width: 12),
        FilmCard(),
        SizedBox(width: 12),
      ],
    );
  }
}
