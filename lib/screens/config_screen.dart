import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key, required this.switchTheme, required this.isDark})
      : super(key: key);
  final void Function(bool isDark) switchTheme;
  final bool isDark;

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final colorTheme = const Color(0xFF006D77);
  void _gotoReturn(BuildContext context) {
    Navigator.pop(context);
  }

  var idiomas = ["português", 'inglês', "espanhol"];
  @override
  Widget build(BuildContext context) {
    bool switchButton = widget.isDark;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: colorTheme,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                _gotoReturn(context);
              },
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(20),
              color: colorTheme,
              child: const Text(
                "Configurações",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 500,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "configurações gerais",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const Text(
                      "Modo noturno",
                      style: TextStyle(fontSize: 20),
                    ),
                    Switch(
                      value: switchButton,
                      onChanged: (value) {
                        setState(() {
                          switchButton = value;
                          widget.switchTheme(switchButton);
                        });
                      },
                      activeTrackColor: colorTheme,
                      activeColor: colorTheme,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "idiomas",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Acessibilidade",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Tamanho da fonte",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
