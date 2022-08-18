import 'package:cinegraw_app/models/film.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

import 'film_carousel.dart';

class CarouselSector extends StatefulWidget {
  CarouselSector({
    Key? key,
    required this.sectorTitle,
  }) : super(key: key);

  final String sectorTitle;

  @override
  State<CarouselSector> createState() => _CarouselSectorState();
}

class _CarouselSectorState extends State<CarouselSector> {
  MovieDBApiRepository _movieDBApiRepository = new MovieDBApiRepository();

  Future<List<Film>> getFilms() async {
    var filmsApi = await _movieDBApiRepository.getPopularFilms();
    List<Film> films = <Film>[];

    for (var i = 0; i < 10; i++) {
      films.add(Film(filmsApi[i].title));
    }

    return films;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.sectorTitle,
            style: const TextStyle(),
            textScaleFactor: 3.0,
          ),
        ),
        SizedBox(
          height: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder<List<Film>>(
              future: getFilms(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FilmCarousel(films: snapshot.data!);
                } else if (snapshot.hasError) {
                  print('${snapshot.error}');
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ],
    );
  }
}
