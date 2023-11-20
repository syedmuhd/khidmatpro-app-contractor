import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color color;

  const AppText(
      {super.key,
      this.text = "Text",
      this.size = 16.0,
      this.color = AppColors.text,
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
