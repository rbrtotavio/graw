import 'package:auto_size_text/auto_size_text.dart';
import 'package:cinegraw_app/applications/implementation/films_app.dart';
import 'package:cinegraw_app/config/utilities.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:flutter/material.dart';

class FilmCard extends StatefulWidget {
  final FilmMovieDB film;
  const FilmCard({Key? key, required this.film}) : super(key: key);

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  final FilmsApp _filmsApp = FilmsApp();
  bool isTurned = false;

  void _gotoFilm() async {
    Navigator.pushNamed(
      context,
      '/film',
      arguments: widget.film,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        if (isTurned == true) {
          isTurned = false;
        } else {
          isTurned = true;
        }
        setState(() {});
      },
      onTap: _gotoFilm,
      child: getFilmImg(),
    );
  }

  dynamic getFilmImg() {
    if (isTurned == false) {
      return _filmsApp.getCardImage(widget.film.cardImagePath);
    }
    return getTitleCard();
  }

  Flex getTitleCard() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Container(
          height: 200,
          width: 133.3,
          color: colorAppbar,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    widget.film.title.toString(),
                    style: Utilities.styleTitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  Text(
                    '(${widget.film.releaseDate!.year.toString()})',
                    style: Utilities.styleRater,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
