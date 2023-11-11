import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class WelcomeController extends GetxController {
  var pageController = PageController();
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page!.round();
    });
  }

  void endWelcome() async {
    StorageService storageService = Get.find();
    await storageService.setWelcomeAsComplete();
    Get.offAndToNamed(RouteConstant.auth);
  }
}
