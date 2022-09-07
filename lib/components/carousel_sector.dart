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

  Future<List<FilmMovieDB>> getPopular() async {
    var filmsApi = await _filmsApp.getPopularFilms();
    return filmsApi;
  }

  Future<List<FilmMovieDB>> getNowPlaying() async {
    var filmsApi = await _filmsApp.getNowPlaying();

    return filmsApi;
  }

  Future<List<FilmMovieDB>> getUpComing() async {
    var filmsApi = await _filmsApp.getUpComing();

    return filmsApi;
  }

  Future<List<FilmMovieDB>> getTopRated() async {
    var filmsApi = await _filmsApp.getTopRated();

    return filmsApi;
  }

  Future<List<FilmMovieDB>> CarrosselSelector() async {
    switch (widget.sectorTitle) {
      case 'Populares':
        return getPopular();

      case 'Lançamentos':
        return getNowPlaying();

      case 'Em breve':
        return getUpComing();

      case 'Melhores filmes':
        return getTopRated();

      default:
        return getPopular();
    }
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
              future: CarrosselSelector(),
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
