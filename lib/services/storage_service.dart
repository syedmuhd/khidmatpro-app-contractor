import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/constants/storage_constant.dart';
import 'package:khidmatpro_app_vendor/enums/storage_enums.dart';

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

  /// Determine if user is authenticated
  Future<bool> isAuthenticated() async {
    final value = await readFromStorage(
        const StorageConstantsEnum(StorageConstant.apiKey));

    if (value == null || value == "") {
      return false;
    } else {
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

  Future<String> getNextPage() async {
    if (await isFirstTime()) {
      return RouteConstant.auth;
    } else if (await isAuthenticated()) {
      return RouteConstant.home;
    } else {
      return RouteConstant.auth;
    }
  }
}
