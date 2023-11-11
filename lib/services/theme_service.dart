import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/setting_controller.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class ThemeService extends GetxService {
  Future<ThemeService> init() async {
    StorageService storageService = Get.find();

    await storageService.isDarkMode()
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());

    /// WIP: change to service
    SettingController settingController = Get.find();
    settingController.setCurrentTheme();

    return this;
  }
}
