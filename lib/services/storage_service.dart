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
    ];

    for (var key in keys) {
      final value = await readFromStorage(key);
      String keyName = key.value;

      if (value == null) {
        debugPrint(
            '[$runtimeType] Creating a new key: $keyName with empty value');
        await writeToStorage(key, "");
      } else {
        debugPrint('[$runtimeType] Key: $keyName exist with value: $value');
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

  Future<bool> setWelcomeAsComplete() async {
    await writeToStorage(StorageConstantsEnum.isFirstTime, "false");
    return true;
  }

  Future<String> getNextPage() async {
    if (await isFirstTime()) {
      debugPrint("GOING TO WELCOMEEEEEEEEEEEEEEEE");
      return RouteConstant.welcome;
    } else if (await isAuthenticated()) {
      debugPrint("GOING TO HOMEEEEEEEEEEEEEE");
      return RouteConstant.home;
    } else {
      debugPrint("GOING TO AUTH: ${RouteConstant.auth}");
      return RouteConstant.auth;
    }
  }
}
