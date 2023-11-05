import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/AuthController.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';
import 'package:khidmatpro_app_vendor/services/auth_service.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("[Binding Dependencies: AuthBindings]");
    Get.lazyPut(() => AuthService(AuthProvider()));
    Get.lazyPut(() => AuthController(authService: Get.find()));
  }
}
