import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/constants/storage_constant.dart';
import 'package:khidmatpro_app_vendor/enums/storage_enums.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    List<StorageConstantsEnum> keys = [
      const StorageConstantsEnum(StorageConstant.apiKey),
      const StorageConstantsEnum(StorageConstant.isFirstTime),
      const StorageConstantsEnum(StorageConstant.isDarkMode),
      const StorageConstantsEnum(StorageConstant.currentLocale),
    ];

    for (var key in keys) {
      final value = await readFromStorage(key);
      String keyName = key.value;

      if (value == null) {
        if (keyName == StorageConstant.currentLocale) {
          debugPrint(
              '[$runtimeType] Creating a new key: $keyName with ${StorageConstant.localeMY} value');
          await writeToStorage(key, StorageConstant.localeMY);
        } else {
          debugPrint(
              '[$runtimeType] Creating a new key: $keyName with empty value');
          await writeToStorage(key, "");
        }
      } else {
        debugPrint('[$runtimeType] Key: $keyName exist with value: $value');
        if (keyName == StorageConstant.currentLocale) {
          if (value == StorageConstant.localeMY) {
            Get.updateLocale(const Locale('my', 'MY'));
          } else {
            Get.updateLocale(const Locale('en', 'US'));
          }
        }
      }
    }

    return this;
  }

  /// Storage Instance
  FlutterSecureStorage storage() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );

    return FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  Future<String?> readFromStorage(StorageConstantsEnum key) async {
    return await storage().read(key: key.value);
  }

  Future<void> writeToStorage(StorageConstantsEnum key, String value) async {
    await storage().write(key: key.value, value: value);
  }

  Future<void> clearFromStorage(StorageConstant key) async {
    await storage().write(key: key.toString(), value: "");
  }

  Future<String?> readAllKeyValueFromStorage() async {
    Map<String, String> allValues = await storage().readAll();
    for (var key in allValues.keys) {
      String? value = allValues[key];
      debugPrint('Key: $key, Value: $value');
    }
  }

  Future<String?> deleteAllKeyValueFromStorage() async {
    await storage().deleteAll();
  }

  /// Determine if user is authenticated
  Future<bool> isAuthenticated() async {
    final value = await readFromStorage(
        const StorageConstantsEnum(StorageConstant.apiKey));
    debugPrint("$runtimeType isAuthenticated(): $value");
    if (value == null || value == "") {
      debugPrint("$runtimeType FALSE");
      return false;
    } else {
      debugPrint("$runtimeType TRUE");
      return true;
    }
  }

  Future<bool> isFirstTime() async {
    final value = await readFromStorage(
        const StorageConstantsEnum(StorageConstant.isFirstTime));

    if (value == null || value == "") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isDarkMode() async {
    final value = await readFromStorage(
        const StorageConstantsEnum(StorageConstant.isDarkMode));

    if (value == "true") {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getCurrentLocale() async {
    final value = await readFromStorage(
        const StorageConstantsEnum(StorageConstant.currentLocale));

    return value ?? StorageConstant.localeMY;
  }

  Future<bool> setLocale(StorageConstantsEnum key, String value) async {
    debugPrint("Locale set to $value");
    await writeToStorage(key, value);
    return true;
  }

  Future<bool> setWelcomeAsComplete() async {
    await writeToStorage(StorageConstantsEnum.isFirstTime, "false");
    return true;
  }

  /// Return onboarding page based on current step
  String getOnboardingPage(int currentOnboardingStep) {
    String page = RouteConstant.onboarding1;
    switch (currentOnboardingStep) {
      case 1:
        page = RouteConstant.onboarding1;
        break;
      case 2:
        page = RouteConstant.onboarding2;
        break;
      case 3:
        page = RouteConstant.onboarding3;
        break;
      case 4:
        page = RouteConstant.onboarding4;
        break;
      case 5:
        page = RouteConstant.onboarding5;
        break;
    }

    return page;
  }

  /// Where to after opening the apps in fresh state mode
  /// if authenticated, has completed onboarding?
  Future<String> getNextPage() async {
    // Uncomment this to restore app back to initial/empty state
    // deleteAllKeyValueFromStorage();
    if (await isAuthenticated()) {
      debugPrint("$runtimeType isAuthenticated()");
      var contractor = await Get.find<AuthProvider>().getCurrentContractor();

      /// Onboarding journey still not finish, resume to current step
      if (contractor.isOnboardingCompleted == 0) {
        debugPrint("$runtimeType isOnboardingCompleted == 0");
        return getOnboardingPage(contractor.currentOnboardingStep!);
      } else {
        return RouteConstant.home;
      }
    } else {
      debugPrint("$runtimeType NOT isAuthenticated()");
      return RouteConstant.auth;
    }

    // if (await isFirstTime()) {
    //   return RouteConstant.auth;
    // } else if (await isAuthenticated()) {
    //   return RouteConstant.home;
    // } else {
    //   return RouteConstant.auth;
    // }
  }
}
