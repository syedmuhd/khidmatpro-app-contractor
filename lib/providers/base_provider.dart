import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:khidmatpro_app_vendor/constants/api_constant.dart';
import 'package:khidmatpro_app_vendor/services/auth_service.dart';

class BaseProvider extends GetConnect {
  final excludedPaths = [
    ApiConstant.login,
    ApiConstant.register,
    ApiConstant.forgotPassword
  ];

  @override
  void onInit() {
    httpClient.baseUrl = "https://devoted-jennet-frankly.ngrok-free.app/api";

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';
      return request;
    });

    httpClient.addResponseModifier((Request request, Response response) {
      if (!excludedPaths.contains(request.url.path) &&
          response.statusCode == 401) {
        Get.find<AuthService>().actionWhenUnauthenticated();
        return false;
      }
      return response;
    });

    super.onInit();
  }
}
