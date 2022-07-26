import 'package:auto_size_text/auto_size_text.dart';
import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/models/review_page_args.dart';
import 'package:cinegraw_app/screens/components/review_list.dart';
import 'package:cinegraw_app/config/utilities.dart';
import 'package:cinegraw_app/applications/implementation/films_app.dart';
import 'package:cinegraw_app/models/movieDB/film_movieDB.dart';
import 'package:flutter/material.dart';
import 'package:cinegraw_app/utility/appthemes.dart' as theme;

class FilmScreen extends StatefulWidget {
  const FilmScreen({Key? key}) : super(key: key);

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  final FilmsApp _filmsApp = FilmsApp();
  final ProfileApp _profileApp = ProfileApp();

  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context)!.settings.arguments as FilmMovieDB;
    void _gotoReviewPage(BuildContext context) {
      var args = ReviewPageArgs();
      args.filmId = film.filmId;
      args.filmName = film.title;
      Navigator.pushNamed(context, '/review_page', arguments: args)
          .whenComplete(() {
        setState(() {});
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GRAW"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _filmsApp.getCoverImage(film.coverImagePath),
            Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: theme.colorAppbar,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              film.title,
                              maxFontSize: 24,
                              minFontSize: 12,
                              style: Utilities.styleTitle,
                            ),
                            film.releaseDate != null
                                ? AutoSizeText(
                                    film.releaseDate!.year.toString(),
                                    maxFontSize: 18,
                                    minFontSize: 12,
                                    maxLines: 2,
                                    style: Utilities.styleTitle,
                                  )
                                : const SizedBox(),
                            FutureBuilder(
                              future: _filmsApp.getDirector(film.filmId),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data.toString(),
                                    style:
                                        const TextStyle(color: theme.colorBG),
                                  );
                                } else if (snapshot.hasError) {
                                  print('${snapshot.error}');
                                }
                                return const Text(
                                  "Loading...",
                                  style: TextStyle(color: theme.colorBG),
                                );
                              },
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
                              film.average.toString(),
                              style: Utilities.styleRating,
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<bool>(
                          future: _profileApp.isLogged(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasError &&
                                snapshot.hasData &&
                                snapshot.data!) {
                              return ElevatedButton(
                                child: Text("Avaliar"),
                                onPressed: () {
                                  _gotoReviewPage(context);
                                },
                              );
                            }
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey),
                              child: Text("Avaliar"),
                              onPressed: () {},
                            );
                          })
                    ],
                  ),
                ),
              ],
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
            ReviewList(
              isProfileScreen: false,
              filmId: film.filmId,
            )
          ],
        ),
      ),
    );
  }
}
