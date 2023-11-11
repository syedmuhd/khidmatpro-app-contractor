import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/welcome_controller.dart';

class WelcomeBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("[Binding Dependencies: $runtimeType]");
    Get.lazyPut(() => WelcomeController());
  }
}
