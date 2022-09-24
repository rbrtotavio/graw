import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:flutter/material.dart';
import '../models/movieDB/film_movieDB.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ProfileApp _filmsApp = ProfileApp();
  String? _rating;
  List<String> _optionsRating = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  final _reviewController = TextEditingController();

  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context)!.settings.arguments as FilmMovieDB;
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 2, color: colorAppbar)),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sua nota:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: DropdownButton<String>(
                          value: _rating,
                          items: _optionsRating.map((item) {
                            return DropdownMenuItem<String>(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              print(film.filmId);
                              _rating = value;
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 15,
                  minLines: 1,
                  controller: _reviewController,
                  decoration: InputDecoration(
                      hintText: 'Escreva sua review',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _filmsApp.reviewFilm(film.filmId, _reviewController.text,
                      double.parse(_rating.toString()), null);
                  _gotoReturn(context);
                  //FutureBuilder(future:_filmsApp.reviewFilm(film.filmId,_reviewController,_rating),builder: (BuildContext context))
                });
              },
              child: Text("Enviar"))
        ],
      ),
    );
  }
}
