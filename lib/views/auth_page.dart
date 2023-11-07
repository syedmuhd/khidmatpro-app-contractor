import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/auth_controller.dart';
import 'package:khidmatpro_app_vendor/models/auth_model.dart';
import 'package:khidmatpro_app_vendor/utilities/app_button.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:khidmatpro_app_vendor/utilities/text_field_input_decoration.dart';
import 'package:khidmatpro_app_vendor/utilities/text_field_text_style.dart';
import 'package:lottie/lottie.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Lottie.asset('assets/lottie/sign_in.json'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(text: "Log In", size: 20),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        controller.email.value = value;
                      },
                      style: TextFieldTextStyle.style(),
                      decoration: TextFieldInputDecoration.style(text: "Email"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        controller.password.value = value;
                      },
                      style: TextFieldTextStyle.style(),
                      decoration:
                          TextFieldInputDecoration.style(text: "Password"),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    controller.obx(
                      (state) => AppButton(
                          text: "Sign In",
                          onPressed: () {
                            controller.signIn();
                          }),
                      onLoading:
                          const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            color: Color(0xFF837E93),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 2.5,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF755DC1),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Color(0xFF755DC1),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
