import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

class FilmCard extends StatefulWidget {
  final FilmMovieDB film;
  const FilmCard({Key? key, required this.film}) : super(key: key);

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  MovieDBApiRepository _movieDBApiRepository = MovieDBApiRepository();

  void _gotoFilm() {
    Navigator.pushNamed(
      context,
      '/film',
      arguments: widget.film,
    );
  }

  void getFilmCard() async {
    var result =
        await _movieDBApiRepository.getFilmCard(widget.film.cardImagePath);
    return;
  }

  @override
  Widget build(BuildContext context) {
    // getFilmCard();

    return InkWell(
      onTap: _gotoFilm,
      child: AnimatedContainer(
        duration: const Duration(),
        child: Ink(
          width: 150,
          height: 200,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
