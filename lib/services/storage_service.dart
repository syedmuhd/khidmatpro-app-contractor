import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/constants/storage_constant.dart';
import 'package:khidmatpro_app_vendor/enums/storage_enums.dart';

class StorageService extends GetxService {
  @override
  Future<void> onInit() async {
    initApp();
    debugPrint('$runtimeType ready!');
  }

  Future<void> initApp() async {
    await initAllKeys();
  }

  // Init all required Storage keys
  Future<void> initAllKeys() async {
    List<StorageConstantsEnum> keys = [
      const StorageConstantsEnum(StorageConstant.apiKey),
      const StorageConstantsEnum(StorageConstant.isFirstTime)
    ];

    for (var key in keys) {
      final value = await readFromStorage(key);
      String keyName = key.value;

      if (value == null) {
        debugPrint(
            '[$runtimeType] Creating a new key: $keyName with empty value');
        await writeToStorage(key, "");
      } else {
        debugPrint(
            '[$runtimeType] Key: $keyName exist with value: $value value');
      }
    }
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
    final apiKey = await readFromStorage(
        const StorageConstantsEnum(StorageConstant.apiKey));

    if (apiKey == null || apiKey == "") {
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

  Future<String> getNextPage() async {
    if (await isFirstTime()) {
      return RouteConstant.welcome;
    } else if (await isAuthenticated()) {
      return RouteConstant.home;
    } else {
      return RouteConstant.error;
    }
  }
}
