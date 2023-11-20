import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class ThemeLight {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: AppColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.buttonBackground),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic, color: Colors.blueGrey),
      bodyLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      iconTheme: IconThemeData(
        color: Colors.black, // Set your desired color for the back icon
      ),
    ),
  );
}
