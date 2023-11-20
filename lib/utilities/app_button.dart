import 'package:flutter/material.dart';
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
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          child: AppText(
            text: text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
