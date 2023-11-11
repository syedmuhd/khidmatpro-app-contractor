import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/storage_constant.dart';
import 'package:khidmatpro_app_vendor/enums/storage_enums.dart';
import 'package:khidmatpro_app_vendor/services/locale_service.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';
import 'package:khidmatpro_app_vendor/services/theme_service.dart';

class SettingsController extends GetxController {
  StorageService storageService = Get.find();
  LocaleService localeService = Get.find();
  ThemeService themeService = Get.find();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  void toggleTheme() async {
    debugPrint("toggling theme");
    String? isDarkMode =
        await storageService.readFromStorage(StorageConstantsEnum.isDarkMode);

    if (isDarkMode == "true") {
      themeService.currentThemeIndex.value = 1;
      Get.changeTheme(ThemeData.light());
      storageService.writeToStorage(StorageConstantsEnum.isDarkMode, "false");
    } else {
      themeService.currentThemeIndex.value = 0;
      Get.changeTheme(ThemeData.dark());
      storageService.writeToStorage(StorageConstantsEnum.isDarkMode, "true");
    }
  }

  void switchLocale(int index) {
    Locale locale;

    /// Bahasa
    if (index == 0) {
      locale = const Locale('my', 'MY');
      localeService.currentLocaleIndex.value = index;
      storageService.setLocale(
          StorageConstantsEnum.currentLocale, StorageConstant.localeMY);
    } else {
      /// Omputih
      locale = const Locale('en', 'US');
      localeService.currentLocaleIndex.value = index;
      storageService.setLocale(
          StorageConstantsEnum.currentLocale, StorageConstant.localeEN);
    }

    Get.updateLocale(locale);
  }
}
