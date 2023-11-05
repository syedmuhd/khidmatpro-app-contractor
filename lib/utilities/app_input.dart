import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class AppInput extends StatelessWidget {
  final String text;
  final double size;

  const AppInput({
    super.key,
    required this.text,
    this.size = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.left,
      style: TextStyle(
        color: colorInput,
        fontSize: size,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: text,
        labelStyle: GoogleFonts.openSans(
          color: colorInput,
          fontSize: size,
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: colorInput,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: colorInput,
          ),
        ),
      ),
    );
  }
}
