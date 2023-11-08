import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';
import 'package:khidmatpro_app_vendor/services/init_service.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("[Binding Dependencies: AppBindings]");

    Get.lazyPut(() => StorageService());
    Get.lazyPut(() => InitService());
  }
}
