import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khidmatpro_app_vendor/constants/app_size_constant.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class AppInputField extends StatelessWidget {
  final String text;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  const AppInputField(
      {super.key,
      required this.text,
      required this.textCapitalization,
      required this.keyboardType,
      required this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      cursorColor: Colors.black,
      cursorOpacityAnimates: true,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        label: Text(text),
        floatingLabelStyle: const TextStyle(color: AppColors.primaryColor),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
        labelStyle: const TextStyle(fontSize: AppSizeConstant.hintFontSize),
        contentPadding: const EdgeInsets.all(18),
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
