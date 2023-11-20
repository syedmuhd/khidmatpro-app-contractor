import 'package:flutter/material.dart';

class ThemeDark {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black, // Set your desired color for the back icon
      ),
    ),
  );
}
