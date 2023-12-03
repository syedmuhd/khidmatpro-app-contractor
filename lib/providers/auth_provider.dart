import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khidmatpro_app_vendor/constants/api_constant.dart';
import 'package:khidmatpro_app_vendor/constants/app_constant.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/enums/storage_enums.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class AuthProvider extends BaseProvider {
  StorageService storageService = Get.find<StorageService>();

  /// Login
  Future<dynamic> login(
      {required int dialCode,
      required String phone,
      required String password}) async {
    final response = await post(ApiConstant.login,
        {"dial_code": dialCode, "phone": phone, "password": password});

    if (response.isOk) {
      return Contractor.fromJson(response.body);
    } else {
      return response.body['message'];
    }
  }

  /// Register
  Future<dynamic> register(
      {required int dialCode,
      required String phone,
      required String password,
      required String passwordConfirmation}) async {
    final response = await post(ApiConstant.register, {
      "dial_code": dialCode,
      "phone": phone,
      "password": password,
      "password_confirmation": passwordConfirmation
    });

    if (response.isOk) {
      return Contractor.fromJson(response.body);
    } else {
      return response.body['message'];
    }
  }

  /// Things to do if contractor is unauthenticated
  void actionWhenUnauthenticated() {
    // Empty the token
    storageService.writeToStorage(StorageConstantsEnum.apiKey, "");
    GetStorage().write(AppConstant.contractor, Contractor());
    Get.offAllNamed(RouteConstant.auth);
  }

  /// Registration Success
  /// Write api key into secure storage
  /// Write contractor model instance into local storage
  /// Set onboarding step to step 1
  /// Set onboardingCompleted to false
  void registerSuccess(Contractor contractor) {
    storageService.writeToStorage(
        StorageConstantsEnum.apiKey, contractor.token!);

    // Store current contractor into Storage
    GetStorage()
        .write(AppConstant.contractor, contractor.withoutToken().toJson());

    Get.offAllNamed(RouteConstant.onboarding1);
  }

  /// Login Success
  /// Write api key into secure storage
  /// Write contractor model instance into local storage
  /// Check if onboarding still not completed
  void loginSuccess(Contractor contractor) {
    // Store token into Secure Storage
    storageService.writeToStorage(
        StorageConstantsEnum.apiKey, contractor.token!);

    // Store current contractor into Storage
    GetStorage()
        .write(AppConstant.contractor, contractor.withoutToken().toJson());

    /// Still needs to complete the onboarding
    if (contractor.isOnboardingCompleted == 0) {
      /// Resume to current onboarding step
      String nextPage = Get.find<StorageService>()
          .getOnboardingPage(contractor.currentOnboardingStep!);
      Get.offAllNamed(nextPage);
    } else {
      debugPrint("Onboarding already completed: Go to Home");
      Get.offAllNamed(RouteConstant.home);
    }
  }

  /// Register
  Future<Contractor> getCurrentContractor() async {
    final response = await get(ApiConstant.contractor);

    if (response.isOk) {
      return Contractor.fromJson(response.body);
    } else {
      return response.body['message'];
    }
  }
}
