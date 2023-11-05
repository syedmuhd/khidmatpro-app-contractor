import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextFieldTextStyle {
  static TextStyle style({
    double size = 15,
    Color colorInput = colorInput,
  }) {
    return GoogleFonts.openSans(
      color: colorInput,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }
}
