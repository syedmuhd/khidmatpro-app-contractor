import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/storage_constant.dart';
import 'package:khidmatpro_app_vendor/enums/storage_enums.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class LocaleService extends GetxService {
  StorageService storageService = Get.find();

  final RxInt currentLocaleIndex = 0.obs;

  Future<LocaleService> init() async {
    await storageService.getCurrentLocale().then((String currentLocale) {
      Locale locale;

      if (currentLocale == StorageConstant.localeMY) {
        currentLocaleIndex.value = 0;
        locale = const Locale('my', 'MY');
      } else {
        currentLocaleIndex.value = 1;
        locale = const Locale('en', 'US');
      }
      Get.updateLocale(locale);
    });

    return this;
  }

  void setLocale(int index) {
    Locale locale;

    /// Bahasa
    if (index == 0) {
      locale = const Locale('my', 'MY');
      currentLocaleIndex.value = index;
      storageService.setLocale(
          StorageConstantsEnum.currentLocale, StorageConstant.localeMY);
    } else {
      /// Omputih
      locale = const Locale('en', 'US');
      currentLocaleIndex.value = index;
      storageService.setLocale(
          StorageConstantsEnum.currentLocale, StorageConstant.localeEN);
    }

    Get.updateLocale(locale);
  }
}
