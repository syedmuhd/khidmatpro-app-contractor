import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:khidmatpro_app_vendor/components/inputs/app_input_phone_number.dart';
import 'package:khidmatpro_app_vendor/constants/app_size_constant.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/auth_controller.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/buttons/button_in_progress.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "Sign in to continue",
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
                // TextField(
                //   cursorOpacityAnimates: true,
                //   onChanged: (value) {
                //     controller.phone.value = value;
                //     // Handle the phone number input changes
                //   },
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(60.r)),
                //     ),
                //     hintText: 'Nombor telefon',
                //     hintStyle:
                //         TextStyle(fontSize: AppSizeConstant.hintFontSize.sp),
                //     contentPadding: EdgeInsets.all(18.w),
                //   ),
                //   keyboardType: TextInputType.phone,
                //   inputFormatters: [
                //     FilteringTextInputFormatter.digitsOnly,
                //     LengthLimitingTextInputFormatter(11),
                //   ],
                // ),

                SizedBox(height: 25.h),

                /// PASSWORD
                Obx(
                  () => TextField(
                    onChanged: (value) {
                      controller.password.value = value;
                    },
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(60.r))),
                      hintText: 'Kata laluan',
                      hintStyle:
                          TextStyle(fontSize: AppSizeConstant.hintFontSize.sp),
                      contentPadding: EdgeInsets.all(18.w),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Toggle the obscureText state
                              controller.obscureText.toggle();
                            },
                            child: Icon(
                              color: Colors.grey,
                              controller.obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          SizedBox(
                            width: 7.h,
                          ),
                          Text("|",
                              style: TextStyle(color: Colors.grey.shade300)),
                          SizedBox(
                            width: 7.h,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteConstant.recovery),
                            child: const Text("Terlupa?",
                                style:
                                    TextStyle(color: AppColors.primaryColor)),
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0.h),
                Obx(
                  () => SizedBox(
                    height: 36.h,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: controller.hasError.isTrue
                          ? AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(
                                  controller.errorMessage.value,
                                  textStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                ),

                /// Login Button
                SizedBox(
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () => controller.login(),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
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
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: controller.obx(
                            (state) => Text(
                              "Log Masuk",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onLoading: ButtonInProgress(),
                            onError: (error) => Text(
                              "Log Masuk",
                              style: TextStyle(
                                fontSize: 16.sp,
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
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tiada akaun?",
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    GestureDetector(
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: Column(
                  children: [
                    Text("App Version 1.0.0",
                        style: TextStyle(color: Colors.grey.shade500)),
                    Text("Software Hub Sdn Bhd",
                        style: TextStyle(color: Colors.grey.shade500)),
                    Text("(1538985-T)",
                        style: TextStyle(color: Colors.grey.shade500))
                  ],
                )),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
