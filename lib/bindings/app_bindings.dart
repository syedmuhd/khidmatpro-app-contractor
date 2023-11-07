import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("[Binding Dependencies: AppBindings]");

    Get.lazyPut(() => StorageService());
  }
}
