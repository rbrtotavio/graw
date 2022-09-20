import 'package:cinegraw_app/screens/auth_page.dart';
import 'package:cinegraw_app/screens/film_Screen.dart';
import 'package:cinegraw_app/screens/main_screen.dart';
import 'package:cinegraw_app/screens/search_film_screen.dart';
import 'package:cinegraw_app/screens/config_screen.dart';
import 'package:cinegraw_app/screens/login_register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final colorAppbar = const Color(0xFF221e22);
  final colorBG = const Color(0xFFf7fff7);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: colorAppbar),
          drawerTheme: DrawerThemeData(backgroundColor: colorBG),
          scaffoldBackgroundColor: colorBG,
          textTheme: GoogleFonts.ralewayTextTheme(),
          brightness: Brightness.light,
          primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "GRAW"),
        '/buscar': (context) => const SearchFilmScreen(title: "Buscar filme"),
        '/config': (context) => const ConfigPage(),
        '/login_register': ((context) => const LoginRegister()),
        '/auth_page': ((context) => const LoginAuth()),
        '/film': (context) => const FilmScreen(),
      },
    );
  }
}
