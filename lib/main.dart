import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/bindings/auth_bindings.dart';
import 'package:khidmatpro_app_vendor/bindings/welcome_bindings.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/setting_controller.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';
import 'package:khidmatpro_app_vendor/services/theme_service.dart';
import 'package:khidmatpro_app_vendor/themes/themes.dart';
import 'package:khidmatpro_app_vendor/views/init_page.dart';
import 'package:khidmatpro_app_vendor/views/auth_page.dart';
import 'package:khidmatpro_app_vendor/views/home_page.dart';
import 'package:khidmatpro_app_vendor/views/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // Set the status bar color to transparent
    statusBarIconBrightness:
        Brightness.dark, // Set the status bar icon color to dark
  ));

  await initializeServices();

  runApp(
    GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      initialRoute: '/init',
      defaultTransition: Transition.native,
      theme: Themes.light,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      getPages: [
        GetPage(
          name: RouteConstant.init,
          page: () => const InitPage(),
        ),
        GetPage(
          name: RouteConstant.home,
          page: () => HomePage(),
        ),
        GetPage(
          name: RouteConstant.welcome,
          page: () => WelcomePage(),
          binding: WelcomeBindings(),
        ),
        GetPage(
          name: RouteConstant.auth,
          page: () => const AuthPage(),
          binding: AuthBindings(),
        ),
      ],
    ),
  );
}

/// Initialize services in order
Future<void> initializeServices() async {
  await Get.putAsync(() => StorageService().init());
  Get.lazyPut(() => SettingController());
  await Get.putAsync(() => ThemeService().init());
}
