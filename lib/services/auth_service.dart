import 'dart:convert';

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

class AuthService extends BaseProvider {
  StorageService storageService = Get.find<StorageService>();

  /// Login
  Future<dynamic> login(
      {required String phoneNumberOrEmail, required String password}) async {
    final response = await post("/auth/login",
        {"phoneNumberOrEmail": phoneNumberOrEmail, "password": password});

    if (response.isOk) {
      // Convert api response (json object/array) into Dart Object
      return Contractor.fromJson(response.body);
    } else {
      throw Exception();
    }
  }

  /// Register
  Future<dynamic> register(
      {required String phoneNumberOrEmail, required String password}) async {
    final response = await post(ApiConstant.register,
        {"phone_number_or_email": phoneNumberOrEmail, "password": password});

    if (response.isOk) {
      return Contractor.fromJson(response.body);
    } else {
      return response.body['message'];
    }
  }

  /// Registration Success
  /// Write api key into secure storage
  /// Write contractor model instance into local storage
  /// Set onboarding step to step 1
  /// Set onboardingCompleted to false
  void registerSuccess(Contractor contractor) {
    storageService.writeToStorage(
        StorageConstantsEnum.apiKey, contractor.token!);

    GetStorage().write(AppConstant.contractor, contractor.withoutToken());
    GetStorage().write(AppConstant.integerCurrentOnboardingStep, 1);
    GetStorage().write(AppConstant.boolOnboardingCompleted, false);

    Get.offAllNamed(RouteConstant.onboarding1);
  }
}
