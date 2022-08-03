import 'package:cinegraw_app/screens/search_film_filter.dart';
import 'package:flutter/material.dart';
import 'package:cinegraw_app/components/search_film_screen.dart';

class SearchFilmScreen extends StatefulWidget {
  const SearchFilmScreen({Key? key}) : super(key: key);

  @override
  State<SearchFilmScreen> createState() => _SearchFilmScreenState();
}

class _SearchFilmScreenState extends State<SearchFilmScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'CineGRAW Tela buscar Filme'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          SearchFilmFilter(),
        ],
      ),
    );
  }
}
