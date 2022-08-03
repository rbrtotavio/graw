import 'package:cinegraw_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:cinegraw_app/components/search_film_screen.dart';

void main() {
  runApp(const SearchFilmScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GRAW'),
    );
  }
}
