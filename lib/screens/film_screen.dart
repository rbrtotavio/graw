import 'package:cinegraw_app/applications/films_app.dart';
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
              height: 80,
              color: const Color.fromARGB(255, 220, 220, 220),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(film.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(film.average.toString()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(film.overview),
            ),
          ],
        ),
      ),
    );
  }
}
