import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/views/app_page.dart';
import 'package:khidmatpro_app_vendor/services/base_service.dart'
    as base_service;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize all required services
  base_service.initServices();

  runApp(
      const GetMaterialApp(debugShowCheckedModeBanner: false, home: AppPage()));
}
