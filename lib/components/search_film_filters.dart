import 'package:cinegraw_app/components/filters/genreFilters.dart';
import 'package:cinegraw_app/components/filters/releaseFilters.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
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
  final MovieDBApiRepository _movieDBApiRepository = MovieDBApiRepository();
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

  String diretor = "Diretor";
  List<String> diretores = <String>[
    "Diretor",
    "Erik Kripke",
    "George A. Romero",
    "Alfred hitchcock",
    "Martin Scorsese"
  ];

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
    if (diretor != "Diretor") {
      return true;
    }
    return false;
  }

  void searchFilm() {
    var filtroFilme = {
      "nomefilme": nomeFilme != "" ? nomeFilme : null,
      "genre": _genreId != 0 ? _genreId.toString() : null,
      "release": _release != "Lançamento" ? _release.toString() : null,
      "diretor": diretor != "Diretor" ? diretor.toString() : null,
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

  Widget menuFilter(String holder, String categoria, List<String> opcoes) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      ),
      child: DropdownButton<String>(
        value: holder,
        isExpanded: true,
        elevation: 16,
        underline: const SizedBox(),
        icon: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            diretor = newValue!;
          });
        },
        items: opcoes.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Text(value)),
          );
        }).toList(),
      ),
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
              Expanded(
                flex: 11,
                child: menuFilter(diretor, "D", diretores),
              ),
            ],
          )
        ],
      ),
    );
  }
}
