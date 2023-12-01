import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/base_controller.dart';
import 'package:khidmatpro_app_vendor/controllers/contractor_controller.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/models/service.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';
import 'package:khidmatpro_app_vendor/providers/contractor_provider.dart';
import 'package:khidmatpro_app_vendor/providers/service_provider.dart';

class ServiceController extends BaseController {
  final ServiceProvider serviceProvider;

  ServiceController({required this.serviceProvider});

  // Data
  final servicesList = <Service>[].obs;
  final selectedServicesList = <String>[].obs;

  // State
  final isFetching = false.obs;
  final isProcessing = false.obs;

  void fetchAll() {
    serviceProvider.all().then((response) {
      if (response.isOk) {
        servicesList.value = response.body ?? <Service>[];
      }
    });
  }

  void complete() async {
    isProcessing.value = true;

    // Update contractor's services
    ContractorProvider contractorProvider = Get.find<ContractorProvider>();
    contractorProvider.updateServices(
        {'service_ids': selectedServicesList.toList()}).then((value) {
      Get.find<ContractorController>().toNextOnboardingPage().then((nextPage) {
        debugPrint(nextPage);
        isProcessing.value = false;
        Get.offAllNamed(nextPage!);
      });
    });
  }
}
