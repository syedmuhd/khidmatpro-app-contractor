import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/views/login_page.dart';
import 'package:khidmatpro_app_vendor/views/register_page.dart';
import 'package:khidmatpro_app_vendor/bindings/onboarding3_bindings.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/auth_controller.dart';
import 'package:khidmatpro_app_vendor/controllers/contractor_controller.dart';
import 'package:khidmatpro_app_vendor/controllers/location_controller.dart';
import 'package:khidmatpro_app_vendor/controllers/service_controller.dart';
import 'package:khidmatpro_app_vendor/providers/contractor_provider.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';
import 'package:khidmatpro_app_vendor/providers/service_provider.dart';
import 'package:khidmatpro_app_vendor/services/locale_service.dart';
import 'package:khidmatpro_app_vendor/services/location_service.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

// import 'package:khidmatpro_app_vendor/services/theme_service.dart';
// import 'package:khidmatpro_app_vendor/themes/theme_dark.dart';
// import 'package:khidmatpro_app_vendor/themes/theme_light.dart';
// import 'package:khidmatpro_app_vendor/utilities/i18n/messages.dart';
import 'package:khidmatpro_app_vendor/views/auth_page.dart';
import 'package:khidmatpro_app_vendor/views/init_page.dart';
import 'package:khidmatpro_app_vendor/views/onboarding_1.dart';
import 'package:khidmatpro_app_vendor/views/onboarding_2.dart';
import 'package:khidmatpro_app_vendor/views/onboarding_3.dart';
import 'package:khidmatpro_app_vendor/views/onboarding_4.dart';
import 'package:khidmatpro_app_vendor/views/onboarding_5.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  await initializeServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // 1080x2400 was the initial design sized, built using Samsung A52 5G (407 ppi)
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            enableLog: true,
            debugShowCheckedModeBanner: false,
            initialRoute: '/init',
            defaultTransition: Transition.native,
            theme: _buildTheme(),
            // darkTheme: ThemeDark.theme,
            // themeMode: ThemeMode.light,
            // translations: Messages(),
            getPages: [
              GetPage(
                name: RouteConstant.init,
                page: () => const InitPage(),
                // page: () => const LoadingPage(),
              ),
              GetPage(
                name: RouteConstant.auth,
                page: () => const AuthPage(),
              ),
              GetPage(
                name: RouteConstant.login,
                page: () => const LoginPage(),
              ),
              GetPage(
                name: RouteConstant.register,
                page: () => const RegisterPage(),
              ),
              GetPage(
                name: RouteConstant.onboarding1,
                page: () => const Onboarding1(),
              ),
              GetPage(
                name: RouteConstant.onboarding2,
                page: () => const Onboarding2(),
              ),
              GetPage(
                  name: RouteConstant.onboarding3,
                  page: () => const Onboarding3(),
                  binding: Onboarding3Binding()),
              GetPage(
                name: RouteConstant.onboarding4,
                page: () => const Onboarding4(),
              ),
              GetPage(
                name: RouteConstant.onboarding5,
                page: () => const Onboarding5(),
              ),
            ],
          );
        });
  }
}

/// Initialize services permanently in order
Future<void> initializeServices() async {
  /**
   * Dependencies
   */
  await GetStorage.init();

  /**
   * Services
   */
  await Get.putAsync(() => StorageService().init(), permanent: true);
  await Get.putAsync(() => LocaleService().init(), permanent: true);
  Get.lazyPut(() => LocationService(), fenix: true);
  // await Get.putAsync(() => ThemeService().init(), permanent: true);

  /**
   * Providers
   */
  Get.put(AuthProvider(), permanent: true); // AuthProvider MUST use Get.put
  Get.lazyPut(() => ContractorProvider(), fenix: true);
  Get.lazyPut(() => ServiceProvider(), fenix: true);

  /**
   * Controllers
   */
  Get.lazyPut(() => AuthController(authProvider: Get.find<AuthProvider>()),
      fenix: true);
  Get.lazyPut(
      () => ContractorController(
          contractorProvider: Get.find<ContractorProvider>()),
      fenix: true);
  Get.lazyPut(() => LocationController(), fenix: true);
  Get.lazyPut(
      () => ServiceController(serviceProvider: Get.find<ServiceProvider>()),
      fenix: true);
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData.light();

  return baseTheme.copyWith(
    textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
  );
}
