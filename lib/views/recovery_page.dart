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

class RecoveryPage extends GetView<AuthController> {
  const RecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.onInit();

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

                const Row(
                  children: [
                    Icon(Icons.chevron_left),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "Account recovery",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox()
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Text(
                      "Please enter your registered phone number to recover.",
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(height: 30.h),

                /// PHONE NUMBER
                AppInputPhoneNumber(
                  onChanged: (PhoneNumber phone) {
                    controller.phone.value = phone.number;
                  },
                  onCountryChanged: (Country country) {
                    controller.dialCode.value = int.parse(country.dialCode);
                  },
                ),
                const SizedBox(height: 30),

                Obx(
                  () => SizedBox(
                    height: 20,
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
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => controller.recovery(),
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
                              "Seterusnya",
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
                              "Seterusnya",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
