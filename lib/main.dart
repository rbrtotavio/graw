import 'package:cinegraw_app/screens/main_screen.dart';
import 'package:cinegraw_app/screens/search_film_screen.dart';
import 'package:cinegraw_app/screens/config_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "GRAW"),
        '/buscar': (context) => const SearchFilmScreen(title: "Buscar filme"),
        '/config': (context) => const ConfigPage(),
      },
    );
  }
}
