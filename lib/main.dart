import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/bindings/app_bindings.dart';
import 'package:khidmatpro_app_vendor/bindings/auth_bindings.dart';
import 'package:khidmatpro_app_vendor/views/app_page.dart';
import 'package:khidmatpro_app_vendor/views/auth_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: '/',
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(
          name: '/',
          page: () => const AppPage(),
        ),
        GetPage(
          name: '/auth',
          page: () => const AuthPage(),
          binding: AuthBindings(),
        ),
      ],
    ),
  );
}
