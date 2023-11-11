import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/enums/storage_enums.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class SettingController extends GetxController {
  StorageService storageService = Get.find();

  void toggleTheme() async {
    String? isDarkMode =
        await storageService.readFromStorage(StorageConstantsEnum.isDarkMode);

    if (isDarkMode == "true") {
      Get.changeTheme(ThemeData.light());
      storageService.writeToStorage(StorageConstantsEnum.isDarkMode, "false");
    } else {
      Get.changeTheme(ThemeData.dark());
      storageService.writeToStorage(StorageConstantsEnum.isDarkMode, "true");
    }
  }

  void setCurrentTheme() async {
    Get.changeTheme(await storageService.isDarkMode()
        ? ThemeData.dark()
        : ThemeData.light());
  }
}
