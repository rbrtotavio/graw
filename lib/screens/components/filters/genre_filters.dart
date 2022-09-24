import 'package:cinegraw_app/applications/implementation/films_app.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:flutter/material.dart';

class GenreFilters extends StatefulWidget {
  const GenreFilters({
    required this.getFilter,
    Key? key,
  }) : super(key: key);

  final void Function(int) getFilter;

  @override
  State<GenreFilters> createState() => _GenreFiltersState();
}

class _GenreFiltersState extends State<GenreFilters> {
  final FilmsApp _filmsApp = FilmsApp();
  Genre _selectedGenre = Genre(genreId: 0, genreName: "Gênero");

  bool search = true;
  List<Genre> _genres = <Genre>[];
  Future<List<Genre>> getGenres() async {
    if (search) {
      search = false;
      var genresApi = await _filmsApp.getGenres();
      genresApi.insert(0, Genre(genreId: 0, genreName: "Gênero"));
      _genres = List.from(genresApi);
      return genresApi;
    }
    return _genres;
  }

  Widget menuFilter(List<Genre> opcoes) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      ),
      child: DropdownButton<Genre>(
        menuMaxHeight: 250,
        value: opcoes.firstWhere((g) => g.genreId == _selectedGenre.genreId),
        isExpanded: true,
        elevation: 16,
        underline: const SizedBox(),
        icon: const SizedBox(),
        onChanged: (Genre? newValue) {
          setState(() {
            _selectedGenre = newValue!;
          });
          widget.getFilter(newValue!.genreId);
        },
        items: opcoes.map((Genre genre) {
          return DropdownMenuItem<Genre>(
            value: genre,
            child: Center(child: Text(genre.genreName)),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: FutureBuilder(
        future: getGenres(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Genre> genres = snapshot.data! as List<Genre>;
            return menuFilter(genres);
          } else if (snapshot.hasError) {
            print('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
