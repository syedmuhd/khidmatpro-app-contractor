import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const AppText(
      {super.key,
      this.text = "Text",
      this.color = AppColors.colorMain,
      this.size = 16.0,
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
