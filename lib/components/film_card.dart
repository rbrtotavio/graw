import 'package:cinegraw_app/models/film.dart';
import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/film',
          arguments: Film("teste"),
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
