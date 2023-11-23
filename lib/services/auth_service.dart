import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/api_constant.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';

class AuthService extends BaseProvider {
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
}
