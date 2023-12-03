import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:khidmatpro_app_vendor/components/inputs/app_input_phone_number.dart';
import 'package:khidmatpro_app_vendor/controllers/auth_controller.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/buttons/button_in_progress.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: SizedBox(
            height: double.maxFinite.h,
            child: ListView(
              children: [
                Row(
                  children: [
                    Wrap(
                      children: [
                        CountryFlag.fromCountryCode(
                          'MY',
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 5.h,
                        ),
                        const Text(
                          "BM",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const Text(
                      "Bantuan",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Image.asset(
                            'assets/images/icons/loading/khidmatpro.png',
                            // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "KhidmatPro",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Daftar sebagai kontraktor",
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                /// PHONE NUMBER
                AppInputPhoneNumber(
                  onChanged: (PhoneNumber phone) {
                    controller.phone.value = phone.number;
                  },
                  onCountryChanged: (Country country) {
                    controller.dialCode.value = int.parse(country.dialCode);
                  },
                ),
                const SizedBox(height: 25),

                /// PASSWORD
                Obx(
                  () => TextField(
                    onChanged: (value) {
                      controller.password.value = value;
                    },
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      hintText: 'Kata laluan',
                      hintStyle: const TextStyle(fontSize: 15),
                      contentPadding: const EdgeInsets.all(18),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // Toggle the obscureText state
                          controller.obscureText.toggle();
                        },
                        child: Icon(
                          controller.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Confirm Password
                Obx(
                  () => TextField(
                    onChanged: (value) {
                      controller.passwordConfirmation.value = value;
                    },
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      hintText: 'Sahkan kata laluan',
                      hintStyle: const TextStyle(fontSize: 15),
                      contentPadding: const EdgeInsets.all(18),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // Toggle the obscureText state
                          controller.obscureText.toggle();
                        },
                        child: Icon(
                          controller.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => SizedBox(
                    height: 36,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: controller.hasError.isTrue
                          ? AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(
                                  controller.errorMessage.value,
                                  textStyle: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => controller.register(),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.shade400,
                            Colors.purple.shade800
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: controller.obx(
                            (state) => const Text(
                              "Daftar",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onLoading: ButtonInProgress(
                              indicatorColor: Colors.white,
                            ),
                            onError: (error) => const Text(
                              "Daftar",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah ada akaun?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Log Masuk",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
