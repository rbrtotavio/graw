import 'package:cinegraw_app/applications/implementation/films_app.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:flutter/material.dart';

class FilmCard extends StatefulWidget {
  final FilmMovieDB film;
  const FilmCard({Key? key, required this.film}) : super(key: key);

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  final FilmsApp _filmsApp = FilmsApp();

  void _gotoFilm() async {
    var profile = await _filmsApp.getUser();
    print(profile == null);
    // Navigator.pushNamed(
    //   context,
    //   '/film',
    //   arguments: widget.film,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _gotoFilm,
      child: _filmsApp.getCardImage(widget.film.cardImagePath),
    );
  }
}
