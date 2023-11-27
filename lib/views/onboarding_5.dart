import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:get/get.dart';

class Onboarding5 extends StatelessWidget {
  const Onboarding5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Thank you. We will process your application in 24 hours.")
              ],
            )
          ],
        ),
      ),
    );
  }
}
