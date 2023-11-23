import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/bindings/auth_bindings.dart';
import 'package:khidmatpro_app_vendor/bindings/onboarding3_bindings.dart';
import 'package:khidmatpro_app_vendor/bindings/welcome_bindings.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/auth_controller.dart';
import 'package:khidmatpro_app_vendor/services/auth_service.dart';
import 'package:khidmatpro_app_vendor/services/locale_service.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

// import 'package:khidmatpro_app_vendor/services/theme_service.dart';
// import 'package:khidmatpro_app_vendor/themes/theme_dark.dart';
// import 'package:khidmatpro_app_vendor/themes/theme_light.dart';
import 'package:khidmatpro_app_vendor/utilities/i18n/messages.dart';
import 'package:khidmatpro_app_vendor/views/init_page.dart';
import 'package:khidmatpro_app_vendor/views/v2/auth_page.dart';
import 'package:khidmatpro_app_vendor/views/v2/onboarding_1.dart';
import 'package:khidmatpro_app_vendor/views/v2/onboarding_2.dart';
import 'package:khidmatpro_app_vendor/views/v2/onboarding_3.dart';
import 'package:khidmatpro_app_vendor/views/v2/onboarding_4.dart';
import 'package:khidmatpro_app_vendor/views/v2/onboarding_5.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  await initializeServices();

  runApp(
    GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      initialRoute: '/init',
      defaultTransition: Transition.native,
      theme: _buildTheme(),
      // darkTheme: ThemeDark.theme,
      // themeMode: ThemeMode.light,
      translations: Messages(),
      getPages: [
        GetPage(
            name: RouteConstant.init,
            page: () => const InitPage(),
            binding: AuthBindings()),
        GetPage(
          name: RouteConstant.auth,
          page: () => AuthPage(),
        ),
        GetPage(
          name: RouteConstant.register1,
          page: () => const Onboarding1(),
        ),
        GetPage(
          name: RouteConstant.register2,
          page: () => const Onboarding2(),
        ),
        GetPage(
          name: RouteConstant.register3,
          page: () => const Onboarding3(),
        ),
        GetPage(
          name: RouteConstant.register4,
          page: () => const Onboarding4(),
        ),
        GetPage(
          name: RouteConstant.register5,
          page: () => const Onboarding5(),
        ),
      ],
    ),
  );
}

/// Initialize services permanently in order
Future<void> initializeServices() async {
  await Get.putAsync(() => StorageService().init(), permanent: true);
  await Get.putAsync(() => LocaleService().init(), permanent: true);
  // await Get.putAsync(() => ThemeService().init(), permanent: true);
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData.light();

  return baseTheme.copyWith(
    textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
  );
}
