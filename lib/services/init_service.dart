import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class InitService {
  void start() async {
    debugPrint("starting InitService");
    StorageService storageService = Get.find();

    if (await storageService.isFirstTime()) {
      Get.toNamed('/welcome');
    }
  }
}
