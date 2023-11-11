import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/settings_controller.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class ThemeService extends GetxService {
  StorageService storageService = Get.find();

  final RxInt currentThemeIndex = 0.obs;

  Future<ThemeService> init() async {
    await storageService.isDarkMode().then((bool isDark) {
      if (isDark) {
        currentThemeIndex.value = 1;
        Get.changeTheme(ThemeData.dark());
      } else {
        currentThemeIndex.value = 0;
        Get.changeTheme(ThemeData.light());
      }
    });

    return this;
  }

  void setCurrentTheme() async {
    Get.changeTheme(await storageService.isDarkMode()
        ? ThemeData.dark()
        : ThemeData.light());
  }
}
