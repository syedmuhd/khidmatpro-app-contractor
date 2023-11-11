import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/welcome_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/settings_controller.dart';
import 'package:khidmatpro_app_vendor/controllers/welcome_controller.dart';
import 'package:khidmatpro_app_vendor/utilities/app_button.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends GetView<WelcomeController> {
  WelcomePage({super.key});

  final SettingsController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.currentPage.value = index;
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildPage(
                  indexToWelcomeText(index),
                  indexToImage(index), // Replace with your image asset
                );
              },
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  String indexToImage(int index) {
    List images = ["one", "two", "three"];

    return images[index];
  }

  String indexToWelcomeText(int index) {
    List texts = [
      WelcomeConstant.firstText,
      WelcomeConstant.secondText,
      WelcomeConstant.thirdText
    ];

    return texts[index];
  }

  Widget _buildPage(String text, String image) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Lottie.asset('assets/lottie/welcome/$image.json'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                // Adjust the padding as needed
                child: AppText(text: text, textAlign: TextAlign.center),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AppButton(
              onPressed: () => controller.endWelcome(),
              text: "Getting Started"),
          const SizedBox(height: 30),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => _buildDot(index == controller.currentPage.value),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}
