import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/utilities/app_button.dart';
import 'package:khidmatpro_app_vendor/utilities/base/base_app_bar.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:lottie/lottie.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final GlobalKey<ScaffoldState> _homePageKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homePageKey,
      appBar: BaseAppBar(
        homePageKey: _homePageKey,
        showMenuIcon: false,
        showNotificationIcon: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Lottie.asset('assets/lottie/sign_in.json'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButton(
                  onPressed: () => Get.toNamed(RouteConstant.login),
                  text: "Log Masuk"),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButton(
                  onPressed: () {}, text: "Daftar sebagai Contractor"),
            ),
          ]),
        ),
      ),
    );
  }
}
