import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: Rota para a Página do filme
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
