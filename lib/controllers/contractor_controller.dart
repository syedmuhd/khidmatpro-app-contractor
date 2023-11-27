import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/base_controller.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/providers/contractor_provider.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class ContractorController extends BaseController {
  final ContractorProvider contractorProvider;

  ContractorController({required this.contractorProvider});

  final totalSteps = 4.obs;
  final currentStep = 1.obs;
  final selectedIsFulltime = 0.obs;
  final selectedIsCompany = 0.obs;

  /// Input
  final name = ''.obs;
  final registrationTypeId = 0.obs;
  final ssm = ''.obs;

  // State
  final isProcessing = false.obs;

  Future<String?> toNextOnboardingPage() async {
    StorageService storageService = Get.find<StorageService>();
    Contractor contractor = await Get.find<AuthProvider>()
        .getCurrentContractor(); // Convert this to local?

    /// Current onboarding step
    int currentOnboardingStep = contractor.currentOnboardingStep!;

    /// Onboarding is still in progress
    if (contractor.isOnboardingCompleted == 0) {
      // Set next onboarding step
      int nextOnboardingStep = currentOnboardingStep + 1;

      /// This is the last page
      if (currentOnboardingStep == totalSteps.value) {
        // Update isOnboardingCompleted = 1

        return contractorProvider
            .update(
                Contractor(
                        isOnboardingCompleted: 1,
                        currentOnboardingStep: currentOnboardingStep)
                    .toJsonWithoutNull(),
                contractor.id)
            .then((value) => RouteConstant.home);
      } else {
        debugPrint("$runtimeType Update to next step: $nextOnboardingStep");

        /// Update to next step
        return contractorProvider
            .update(
                Contractor(currentOnboardingStep: nextOnboardingStep)
                    .toJsonWithoutNull(),
                contractor.id)
            .then((value) =>
                storageService.getOnboardingPage(nextOnboardingStep));
      }
    }

    return null;
  }

  void toOnboarding2() async {
    isProcessing.value = true;

    toNextOnboardingPage().then((nextPage) {
      isProcessing.value = false;
      Get.offAllNamed(nextPage!);
    });
  }

  /// To Onboarding 3
  void toOnboarding3() async {
    if (isInputsOnboarding2Validated()) {
      isProcessing.value = true;

      Contractor contractor = await Get.find<AuthProvider>()
          .getCurrentContractor(); // Convert this to local?

      contractorProvider
          .update(
              Contractor(
                      name: name.value,
                      isCompany: selectedIsCompany.value,
                      isFulltime: selectedIsFulltime.value,
                      ssm: ssm.value)
                  .toJsonWithoutNull(),
              contractor.id)
          .then((value) {
        toNextOnboardingPage().then((nextPage) {
          isProcessing.value = false;
          Get.offAllNamed(nextPage!);
        });
      });
    } else {
      isProcessing.value = false;
      debugPrint("oh noo");
    }
  }

  /// Check for inputs
  bool isInputsOnboarding2Validated() {
    /// name is empty
    /// name less than 3 char
    /// registrationTypeId empty
    if (name.isEmpty ||
        name.value.length < 3 ||
        selectedIsFulltime.value == 0 ||
        selectedIsCompany.value == 0) {
      return false;
    } else {
      // registrationTypeId = 2 but ssm number is empty
      if (registrationTypeId.value == 2 && ssm.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
  }
}
