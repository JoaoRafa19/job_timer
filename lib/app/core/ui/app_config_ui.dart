import 'package:flutter/material.dart';

class AppConfigUI {
  AppConfigUI._();

  static get theme => _theme;

  static const MaterialColor _primarySwatch = MaterialColor(0xFF0066b0, {
    50: Color(0xFF005c9e),
    100: Color(0xFF00528d),
    200: Color(0xFF00477b),
    300: Color(0xFF003d6a),
    400: Color(0xFF003358),
    500: Color(0xFF002946),
    600: Color(0xFF001f35),
    700: Color(0xFF001423),
    800: Color(0xFF000a12),
    900: Color(0xFF000000),
  });

  static final ThemeData _theme = ThemeData(
    primaryColor: const Color(0xFF0066B0),
    primarySwatch: _primarySwatch,
    primaryColorLight: const Color(0xFF219FFF),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true
    ),
  );
}