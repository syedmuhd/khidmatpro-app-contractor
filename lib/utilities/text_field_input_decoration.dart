import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextFieldInputDecoration {
  static InputDecoration style({
    required String text,
    double size = 15,
    Color colorInput = colorInput,
  }) {
    return InputDecoration(
      labelText: text,
      labelStyle: GoogleFonts.openSans(
        color: colorInput,
        fontSize: size,
        fontWeight: FontWeight.normal,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1,
          color: colorInput,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1,
          color: colorInput,
        ),
      ),
    );
  }
}
