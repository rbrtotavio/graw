import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool switchButton = false;
  var idiomas = ["português", 'inglês', "espanhol"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(20),
              color: Colors.grey,
              child: Text(
                "Configurações",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "configurações gerais",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "Modo noturno",
                          style: TextStyle(fontSize: 20),
                        ),
                        Switch(
                          value: switchButton,
                          onChanged: (value) {
                            setState(() {
                              switchButton = value;
                              print(switchButton);
                            });
                          },
                          activeTrackColor: Color.fromARGB(255, 33, 188, 28),
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "idiomas",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Acessibilidade",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Tamanho da fonte",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
