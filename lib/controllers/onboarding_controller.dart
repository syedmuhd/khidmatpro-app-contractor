import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khidmatpro_app_vendor/constants/app_constant.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/base_controller.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/models/registration_type.dart';
import 'package:khidmatpro_app_vendor/services/global_service.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class OnboardingController extends BaseController with StateMixin<Contractor> {
  @override
  void onInit() {
    getRegistrationTypes();
    super.onInit();
  }

  final totalSteps = 4.obs;
  final currentStep = 1.obs;
  final RxList<Map<String, dynamic>> registrationTypes =
      <Map<String, dynamic>>[].obs;

  /// Get current onboarding step
  /// Update to next step until 5
  void goToNextOnboardingPage() {
    StorageService storageService = Get.find<StorageService>();

    int currentOnboardingStep =
        GetStorage().read(AppConstant.integerCurrentOnboardingStep);

    if (GetStorage().read(AppConstant.boolOnboardingCompleted) == false) {
      int nextOnboardingStep = currentOnboardingStep + 1;
      String nextOnboardingPage =
          storageService.getOnboardingPage(nextOnboardingStep);

      /// This is the last page
      if (currentOnboardingStep == totalSteps.value) {
        Get.offAllNamed(RouteConstant.home);
      } else {
        /// Update to next step
        GetStorage().write(
            AppConstant.integerCurrentOnboardingStep, nextOnboardingStep);
      }

      Get.offAllNamed(nextOnboardingPage);
    }
  }

  /// Get available employment type
  void getRegistrationTypes() {
    GlobalService globalService = Get.find<GlobalService>();
    globalService.getAllRegistrationTypes().then((response) {
      if (response.isOk) {
        return RegistrationType.fromJson(response);
        // Convert api response (json object/array) into Dart Object
      } else {
        throw Exception();
      }
    });
  }
}
