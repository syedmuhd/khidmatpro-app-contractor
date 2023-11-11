import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: AppColors.colorMain,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],
    scaffoldBackgroundColor: Colors.black45,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    ),
  );
}
