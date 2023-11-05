import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const AppText({super.key,
    required this.text,
    this.color = colorMain,
    this.size = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color
      ),
    );
  }
}
