import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/bindings/init_bindings.dart';
import 'package:khidmatpro_app_vendor/bindings/auth_bindings.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/views/init_page.dart';
import 'package:khidmatpro_app_vendor/views/auth_page.dart';
import 'package:khidmatpro_app_vendor/views/home_page.dart';
import 'package:khidmatpro_app_vendor/views/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      initialBinding: InitBindings(),
      initialRoute: '/init',
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(
          name: RouteConstant.init,
          page: () => const InitPage(),
        ),
        GetPage(
          name: RouteConstant.home,
          page: () => const HomePage(),
        ),
        GetPage(
          name: RouteConstant.welcome,
          page: () => const WelcomePage(),
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
