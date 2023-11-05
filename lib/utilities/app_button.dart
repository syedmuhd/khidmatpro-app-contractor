import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.maxFinite,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorMain,
          ),
          child: const AppText(
            text: "Sign In",
            color: colorWhite,
          ),
        ),
      ),
    );
  }
}
