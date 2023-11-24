import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/constants/api_constant.dart';
import 'package:khidmatpro_app_vendor/models/registration_type.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';

class GlobalService extends BaseProvider {
  /// Get All Registration Types
  Future<dynamic> getAllRegistrationTypes() async {
    final response = await get(ApiConstant.registrationTypes);
    return response;
  }
}
