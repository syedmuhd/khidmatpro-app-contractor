import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

void initServices() async {
  debugPrint('[Services]: Starting services');

  Get.lazyPut(() => StorageService());
  Get.find<StorageService>().init();
}
