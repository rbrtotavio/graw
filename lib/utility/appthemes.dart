import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorAppbar = Color(0xFF006D77);
const colorDarkbar = Color(0xFF343a40);
const colorBG = Color(0xFFEDF6F9);
const colorDarkBG = Color(0xFF495057);

ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: colorAppbar),
    drawerTheme: const DrawerThemeData(backgroundColor: colorBG),
    scaffoldBackgroundColor: colorBG,
    textTheme: GoogleFonts.ralewayTextTheme(),
    brightness: Brightness.light,
    primarySwatch: Colors.blue);

ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: colorAppbar),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      primary: Colors.white,
    )),
    drawerTheme: const DrawerThemeData(backgroundColor: colorDarkBG),
    scaffoldBackgroundColor: colorDarkBG,
    textTheme: GoogleFonts.ralewayTextTheme().copyWith(
      headline1: GoogleFonts.raleway(
        textStyle: TextStyle(color: Colors.white),
      ),
      headline2: GoogleFonts.raleway(
        textStyle: TextStyle(color: Colors.white),
      ),
      bodyText1: GoogleFonts.raleway(
        textStyle: TextStyle(color: Colors.white),
      ),
      bodyText2: GoogleFonts.raleway(
        textStyle: TextStyle(color: Colors.white),
      ),
    ),
    brightness: Brightness.light,
    primarySwatch: Colors.blue);
