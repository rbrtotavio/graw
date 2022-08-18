import 'package:cinegraw_app/models/film.dart';
import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  final String title;
  const FilmCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/film',
          arguments: Film(title),
        );
      },
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
