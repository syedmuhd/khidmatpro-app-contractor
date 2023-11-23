import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/base_controller.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/services/auth_service.dart';

class AuthController extends BaseController with StateMixin<Contractor> {
  final AuthService authService;

  AuthController({required this.authService});

  final phoneNumberOrEmail = ''.obs;
  final password = ''.obs;
  final obscureText = true.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;

  Contractor? get data => Contractor();

  @override
  void onInit() {
    change(data, status: RxStatus.success());
    hasError.value = false;
    super.onInit();
  }

  void signIn() {
    Get.offNamed(RouteConstant.home);
  }

  void register() {
    if (phoneNumberOrEmail.value != '' && password.value != '') {
      change(data, status: RxStatus.loading());
      authService
          .register(
              phoneNumberOrEmail: phoneNumberOrEmail.value,
              password: password.value)
          .then((contractor) {
        change(data, status: RxStatus.success());
        if (contractor is Contractor) {
          authService.registerSuccess(contractor);
        } else if (contractor is String) {
          errorMessage.value = contractor;
          hasError.value = true;
          Future.delayed(
              const Duration(seconds: 5), () => hasError.value = false);
        }
      });
    } else {
      debugPrint("$runtimeType Wrong input");
    }
  }
}
