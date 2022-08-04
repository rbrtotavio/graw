import 'package:flutter/material.dart';

import '../components/carousel_sector.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _gotoSearchFilm(BuildContext context) {
    Navigator.pushNamed(context, '/buscar');
  }

  void _gotoConfigPage(BuildContext context) {
    Navigator.pushNamed(context, '/config');
  }

  void _gotoLoginRegister(BuildContext context) {
    Navigator.pushNamed(context, '/login_register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.title),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _gotoSearchFilm(context);
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.grey,
              height: 200,
              alignment: Alignment.bottomLeft,
              child: IconButton(
                iconSize: 120,
                color: Colors.white,
                icon: const Icon(Icons.account_circle),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {
                    _gotoLoginRegister(context);
                  },
                  child: const Text(
                    "Login/Registrar-se",
                    style: TextStyle(
                        color: Color.fromARGB(255, 26, 26, 26), fontSize: 27),
                  )),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {
                    _gotoConfigPage(context);
                  },
                  child: const Text(
                    "Configurações",
                    style: TextStyle(
                        color: Color.fromARGB(255, 26, 26, 26), fontSize: 27),
                  )),
            )
          ],
        ),
      ),
      body: ListView(
        children: const [
          CarouselSector(sectorTitle: "Lançamentos"),
          CarouselSector(sectorTitle: "Populares"),
          CarouselSector(sectorTitle: "Ranking de Filmes"),
          CarouselSector(sectorTitle: "Filmes por Gênero"),
        ],
      ),
    );
  }
}
