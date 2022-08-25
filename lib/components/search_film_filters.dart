import 'package:cinegraw_app/components/filters/genreFilters.dart';
import 'package:cinegraw_app/models/film.dart';
import 'package:cinegraw_app/models/movieDB/genre.dart';
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

  Future<List<Genre>> getGenres() async {
    var genresApi = await _movieDBApiRepository.getGenres();
    print(genresApi);
    return genresApi;
  }

  int _genreId = 0;
  void getGenreFilter(int genreId) {
    setState(() {
      _genreId = genreId;
    });
    print(_genreId);
  }

  String nomeFilme = "";

  String lancamento = "Lançamento";
  List<String> lancamentos = <String>[
    "Lançamento",
    "2022",
    "2021",
    "2020",
    "2019",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012"
  ];

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
    if (lancamento != "Lançamento") {
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
      "genre": _genreId != 0 ? _genreId : null,
      "lancamento": lancamento != "Lançamento" ? lancamento : null,
      "diretor": diretor != "Diretor" ? diretor : null,
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
            switch (categoria) {
              case "L":
                lancamento = newValue!;
                break;
              case "D":
                diretor = newValue!;
                break;
              default:
            }
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
              Expanded(
                flex: 9,
                child: menuFilter(lancamento, "L", lancamentos),
              ),
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
