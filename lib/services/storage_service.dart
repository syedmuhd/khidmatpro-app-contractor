import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService extends GetxService {
  @override
  Future<void> onInit() async {
    final apiKey = await readApiKey();

    // If api key is not yet exist,
    // or is empty (""),
    // create a new one with empty values
    if (apiKey == null || apiKey.isEmpty) {
      debugPrint('[Storage] Creating a new key: ApiKey with empty value');
      await writeApiKey("");
    }

    debugPrint('$runtimeType ready!');
  }

  /// Storage
  FlutterSecureStorage storage() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );

    return FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  Future<String?> readApiKey() async {
    return await storage().read(key: "ApiKey");
  }

  Future<void> writeApiKey(String value) async {
    await storage().write(key: "ApiKey", value: value);
  }

  Future<void> clearApiKey() async {
    await storage().write(key: "ApiKey", value: "");
  }

  /// Determine if user is authenticated
  Future<bool> isAuthenticated() async {
    final apiKey = await readApiKey();

    if (apiKey == null || apiKey == "") {
      return false;
    } else {
      return true;
    }
  }
}
