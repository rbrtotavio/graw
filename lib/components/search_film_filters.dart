import 'package:flutter/material.dart';

class SearchFilmFilters extends StatefulWidget {
  const SearchFilmFilters({Key? key}) : super(key: key);

  @override
  State<SearchFilmFilters> createState() => _SearchFilmFiltersState();
}

class _SearchFilmFiltersState extends State<SearchFilmFilters> {
  String nomeFilme = "";

  String genero = "Gênero";
  List<String> generos = <String>[
    "Gênero",
    "Terror",
    "Ação",
    "Comédia",
    "Drama"
  ];

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
    if (genero != "Gênero") {
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

  void buscar_filme() {
    var filtroFilme = {
      "nomefilme": nomeFilme != "" ? nomeFilme : null,
      "genero": genero != "Gênero" ? genero : null,
      "lancamento": lancamento != "Lançamento" ? lancamento : null,
      "diretor": diretor != "Diretor" ? diretor : null
    };
    print(filtroFilme);
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
            onPressed: filtroValido() ? buscar_filme : null,
            child: const Text(
              "Buscar",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget filtroMenu(String holder, String categoria, List<String> opcoes) {
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
        underline: SizedBox(),
        icon: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            switch (categoria) {
              case "G":
                genero = newValue!;
                break;
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            searchField(),
            Row(
              children: [
                Expanded(flex: 10, child: filtroMenu(genero, "G", generos)),
                Expanded(
                    flex: 9, child: filtroMenu(lancamento, "L", lancamentos)),
                Expanded(flex: 11, child: filtroMenu(diretor, "D", diretores)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
