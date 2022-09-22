import 'package:cinegraw_app/components/filters/genre_filters.dart';
import 'package:cinegraw_app/components/filters/release_filters.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:flutter/material.dart';

class SearchFilmFilters extends StatefulWidget {
  const SearchFilmFilters({
    Key? key,
    required this.searchFilm,
  }) : super(key: key);

  final void Function(Map<String, dynamic>) searchFilm;

  @override
  State<SearchFilmFilters> createState() => _SearchFilmFiltersState();
}

class _SearchFilmFiltersState extends State<SearchFilmFilters> {
  int _genreId = 0;
  String _release = "Lançamento";

  void getGenreFilter(int genreId) {
    setState(() {
      _genreId = genreId;
    });
  }

  void getReleaseFilter(String release) {
    setState(() {
      _release = release;
    });
  }

  String nomeFilme = "";

  bool filtroValido() {
    if (nomeFilme != "") {
      return true;
    }
    if (_genreId != 0) {
      return true;
    }
    if (_release != "Lançamento") {
      return true;
    }
    return false;
  }

  void searchFilm() {
    var filtroFilme = {
      "filmName": nomeFilme != "" ? nomeFilme : null,
      "genre": _genreId != 0 ? _genreId.toString() : null,
      "release": _release != "Lançamento" ? _release.toString() : null,
    };
    widget.searchFilm(filtroFilme);
  }

  Widget searchField() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: "Nome do filme",
              labelStyle: TextStyle(fontSize: 18),
              border: OutlineInputBorder(),
              fillColor: Colors.white,
            ),
            onChanged: (value) {
              setState(() {
                nomeFilme = value;
              });
            },
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: ElevatedButton(
            onPressed: filtroValido() ? searchFilm : null,
            child: const Text(
              "Buscar",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          searchField(),
          Row(
            children: [
              GenreFilters(
                getFilter: (int genreId) => getGenreFilter(genreId),
              ),
              ReleaseFilters(
                  getFilter: (String release) => getReleaseFilter(release)),
              // TODO: botao de limpar filtros
            ],
          )
        ],
      ),
    );
  }
}
