import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

import 'film_carousel.dart';

class CarouselSector extends StatelessWidget {
  CarouselSector({
    Key? key,
    required this.sectorTitle,
  }) : super(key: key);

  final String sectorTitle;
  MovieDBApiRepository _movieDBApiRepository = new MovieDBApiRepository();

  getFilms() async {
    var filmsApi = await _movieDBApiRepository.getTrendingFilms();
    return filmsApi;
  }

  @override
  Widget build(BuildContext context) {
    var films = getFilms();

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
