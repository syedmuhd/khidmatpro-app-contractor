import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/app_size_constant.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/auth_controller.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/buttons/button_in_progress.dart';

class AuthDrawer extends GetView<AuthController> {
  const AuthDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.all(40),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Hello",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Please sign up to open an account",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 353,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(RouteConstant.login),
                  child: const Text(
                    "Continue with Google",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("or", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            /// PHONE NUMBER
            TextField(
              onTap: () {},
              onChanged: (value) {
                controller.phoneNumberOrEmail.value = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                hintText: 'Phone number or email address',
                hintStyle: TextStyle(fontSize: AppSizeConstant.hintFontSize),
                contentPadding: EdgeInsets.all(18),
              ),
              keyboardType: TextInputType.phone,
              // Set the keyboard type to phone
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
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
                  hintText: 'Password',
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
                      colors: [Colors.purple.shade400, Colors.purple.shade800],
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
                          "Register",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onLoading: const ButtonInProgress(),
                        onError: (error) => const Text(
                          "Register",
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
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Login",
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
    );
  }
}
