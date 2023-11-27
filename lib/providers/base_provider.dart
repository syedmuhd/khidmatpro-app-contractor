import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:khidmatpro_app_vendor/constants/api_constant.dart';
import 'package:khidmatpro_app_vendor/constants/storage_constant.dart';
import 'package:khidmatpro_app_vendor/enums/storage_enums.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class BaseProvider extends GetConnect {
  final excludedPaths = [
    ApiConstant.login,
    ApiConstant.register,
    ApiConstant.forgotPassword
  ];

  @override
  Future<void> onInit() async {
    httpClient.baseUrl = "https://devoted-jennet-frankly.ngrok-free.app/api";

    httpClient.addRequestModifier((Request request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      /// Append API token if authenticated
      StorageService storageService = Get.find<StorageService>();
      String? apiKey = await storageService
          .readFromStorage(const StorageConstantsEnum(StorageConstant.apiKey));
      if (apiKey != '') {
        request.headers['Authorization'] = 'Bearer $apiKey';
      }
      return request;
    });

    httpClient.addResponseModifier((Request request, Response response) {
      if (!excludedPaths.contains(request.url.path) &&
          response.statusCode == 401) {
        Get.find<AuthProvider>().actionWhenUnauthenticated();
        return false;
      }

      if (response.statusCode == 422) {
        debugPrint(response.bodyString);
      }
      return response;
    });
  }
}
