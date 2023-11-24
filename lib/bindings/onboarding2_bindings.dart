import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/global_service.dart';
import 'package:permission_handler/permission_handler.dart';

class Onboarding2Bindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => GlobalService());
  }
}
