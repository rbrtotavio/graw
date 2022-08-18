import 'package:cinegraw_app/screens/main_screen.dart';
import 'package:cinegraw_app/screens/search_film_screen.dart';
import 'package:cinegraw_app/screens/config_screen.dart';
import 'package:cinegraw_app/screens/login_register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/login_register': ((context) => const LoginRegister())
      },
    );
  }
}
