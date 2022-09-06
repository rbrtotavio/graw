import 'package:cinegraw_app/applications/films_app.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
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
  final FilmsApp _filmsApp = FilmsApp();

  Future<List<FilmMovieDB>> getFilms() async {
    var filmsApi = await _filmsApp.getPopularFilms();
    return filmsApi;
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
            child: FutureBuilder<List<FilmMovieDB>>(
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
