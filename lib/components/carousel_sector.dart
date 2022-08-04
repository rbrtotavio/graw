import 'package:flutter/material.dart';

import 'film_carousel.dart';

class CarouselSector extends StatelessWidget {
  const CarouselSector({
    Key? key,
    required this.sectorTitle,
  }) : super(key: key);

  final String sectorTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sectorTitle,
            style: const TextStyle(),
            textScaleFactor: 3.0,
          ),
        ),
        const SizedBox(
          height: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FilmCarousel(),
          ),
        ),
      ],
    );
  }
}
