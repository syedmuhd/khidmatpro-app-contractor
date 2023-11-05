import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/bindings/app_bindings.dart';
import 'package:khidmatpro_app_vendor/bindings/auth_bindings.dart';
import 'package:khidmatpro_app_vendor/views/app_page.dart';
import 'package:khidmatpro_app_vendor/services/base_service.dart'
    as base_service;
import 'package:khidmatpro_app_vendor/views/auth_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    enableLog: true,
    getPages: [
      GetPage(
        name: '/',
        page: () => const AppPage(),
        binding: AppBindings(),
      ),
      GetPage(
        name: '/auth',
        page: () => const AuthPage(),
        binding: AuthBindings(),
      ),
    ],
  ));
}
