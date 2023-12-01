import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:khidmatpro_app_vendor/constants/app_size_constant.dart';

class AppInputPhoneNumber extends StatelessWidget {
  const AppInputPhoneNumber({super.key, required this.onChanged});

  final void Function(PhoneNumber) onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      // controller:
      //     TextEditingController(text: controller.phone.value),
      dropdownTextStyle: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(60.r)),
        ),
        hintText: 'Nombor telefon',
        hintStyle: TextStyle(fontSize: AppSizeConstant.hintFontSize.sp),
        contentPadding: EdgeInsets.all(18.w),
      ),
      flagsButtonPadding: const EdgeInsets.only(left: 10),
      initialCountryCode: 'MY',
      disableLengthCheck: true,
      countries: const [
        Country(
          name: "Malaysia",
          nameTranslations: {
            "en": "Malaysia",
          },
          flag: "🇲🇾",
          code: "MY",
          dialCode: "60",
          minLength: 9,
          maxLength: 10,
        )
      ],
      onChanged: onChanged,
    );
  }
}
