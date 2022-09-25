import 'package:cinegraw_app/config/firebase_options.dart';
import 'package:cinegraw_app/screens/auth_screen.dart';
import 'package:cinegraw_app/screens/film_Screen.dart';
import 'package:cinegraw_app/screens/main_screen.dart';
import 'package:cinegraw_app/screens/sharing_screen.dart';
import 'package:cinegraw_app/screens/review_page.dart';
import 'package:cinegraw_app/screens/search_film_screen.dart';
import 'package:cinegraw_app/screens/config_screen.dart';
import 'package:cinegraw_app/screens/login_register.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final colorAppbar = const Color(0xFF006D77);
  final colorBG = const Color(0xFFEDF6F9);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "GRAW"),
        '/buscar': (context) => const SearchFilmScreen(title: "Buscar filme"),
        '/config': (context) => const ConfigPage(),
        '/login_register': ((context) => const LoginRegister()),
        '/auth_page': ((context) => LoginAuth()),
        '/film': (context) => const FilmScreen(),
        '/review_page': (context) => const ReviewPage(),
        '/qrcode_page': (context) => const QRCodeScreen()
      },
    );
  }
}
