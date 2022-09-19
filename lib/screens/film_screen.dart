import 'package:auto_size_text/auto_size_text.dart';
import 'package:cinegraw_app/applications/films_app.dart';
import 'package:cinegraw_app/config/utilities.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:flutter/material.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({Key? key}) : super(key: key);

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  final FilmsApp _filmsApp = FilmsApp();

  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context)!.settings.arguments as FilmMovieDB;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GRAW"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _filmsApp.getCoverImage(film.coverImagePath),
            Container(
              padding: EdgeInsets.all(8.0),
              height: 80,
              color: Colors.blueGrey,
              child: Row(
                children: [
                  SizedBox(
                    width: 216,
                    child: AutoSizeText(
                      film.title,
                      maxFontSize: 24,
                      minFontSize: 16,
                      maxLines: 2,
                      style: Utilities.styleTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "GRAW",
                          style: Utilities.styleRater,
                        ),
                        Text(
                          "${film.average.toString()}/10",
                          style: Utilities.styleRating,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "TMDB",
                          style: Utilities.styleRater,
                        ),
                        Text(
                          "${film.average.toString()}/10",
                          style: Utilities.styleRating,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        "Sinopse:",
                        textAlign: TextAlign.start,
                        style: Utilities.styleOverviewtitle,
                      ),
                    ],
                  ),
                  Text(film.overview),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
