import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/locale_service.dart';
import 'package:khidmatpro_app_vendor/services/theme_service.dart';
import 'package:khidmatpro_app_vendor/utilities/base/base_page_app_bar.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:unicons/unicons.dart';

class SettingsPage extends GetView {
  SettingsPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _pageKey = GlobalKey<ScaffoldState>();

  double switchLength = 60.0;

  LocaleService localeService = Get.find();
  ThemeService themeService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackgroundMain,
      appBar: BasePageAppBar(homePageKey: _pageKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: AppText(
                    text: "Appearance",
                    color: Colors.grey,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              /// Language
              ListTile(
                leading: const Icon(UniconsLine.language),
                title: AppText(
                  text: "app_language".tr,
                  color: AppColors.appBarTextPro,
                  fontWeight: FontWeight.w500,
                ),
                trailing: Obx(
                  () => ToggleSwitch(
                    minWidth: switchLength,
                    initialLabelIndex: localeService.currentLocaleIndex.value,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: const ['MY', 'EN'],
                    activeBgColors: const [
                      [Colors.blue],
                      [Colors.blue]
                    ],
                    onToggle: (index) {
                      localeService.setLocale(index!);
                    },
                  ),
                ),
              ),

              /// Theme
              ListTile(
                leading: const Icon(UniconsLine.adjust_circle),
                title: AppText(
                  text: "theme_selection".tr,
                  color: AppColors.appBarTextPro,
                  fontWeight: FontWeight.w500,
                ),
                trailing: Obx(
                  () => ToggleSwitch(
                    minWidth: switchLength,
                    initialLabelIndex: themeService.currentThemeIndex.value,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: [
                      'theme_selection_light'.tr,
                      'theme_selection_dark'.tr
                    ],
                    activeBgColors: const [
                      [Colors.blue],
                      [Colors.blue]
                    ],
                    onToggle: (index) {
                      themeService.setTheme(index!);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
