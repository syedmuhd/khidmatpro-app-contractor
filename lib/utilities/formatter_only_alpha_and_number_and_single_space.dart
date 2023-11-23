import 'package:flutter/services.dart';

class FormatterOnlyAlphaAndNumberAndSingleSpace extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow alphabets, numbers, and dashes
    String filteredText =
        newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9-]'), '');

    return TextEditingValue(
      text: filteredText,
    );
  }
}
