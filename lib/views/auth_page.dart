import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/utilities/app_button.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:khidmatpro_app_vendor/utilities/base/base_app_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:unicons/unicons.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final GlobalKey<ScaffoldState> _homePageKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homePageKey,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              color: Colors.black,
              text: "Khidmat",
              size: 18,
            ),
            AppText(
              text: "Pro",
              size: 18,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppButton(
                    onPressed: () => Get.toNamed(RouteConstant.login),
                    text: "sign_in".tr),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppButton(
                    onPressed: () => Get.toNamed(RouteConstant.register),
                    text: "register".tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
