import 'package:flutter/services.dart';

class FormatterOnlyAlphaAndSingleSpace extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only alphabets and spaces, replace consecutive spaces with a single space
    String filteredText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z\s]'), '');
    filteredText = filteredText.replaceAll(RegExp(r'\s+'), ' ');

    return TextEditingValue(
      text: filteredText,
    );
  }
}
