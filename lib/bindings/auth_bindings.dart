import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/auth_controller.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';
import 'package:khidmatpro_app_vendor/services/auth_service.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("[Binding Dependencies: AuthBindings]");
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => AuthController(authService: Get.find()));
  }
}
