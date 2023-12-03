import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/base_controller.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';
import 'package:logger/logger.dart';

class AuthController extends BaseController with StateMixin<Contractor> {
  final AuthProvider authProvider;

  AuthController({required this.authProvider});

  final dialCode = 60.obs; // default Malaysia
  final phone = ''.obs;
  final password = ''.obs;
  final passwordConfirmation = ''.obs;
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

  /// Login
  void login() {
    if (phone.value != '' && password.value != '') {
      change(data, status: RxStatus.loading());
      authProvider
          .login(
              dialCode: dialCode.value,
              phone: phone.value,
              password: password.value)
          .then((contractor) {
        change(data, status: RxStatus.success());
        if (contractor is Contractor) {
          authProvider.loginSuccess(contractor);
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

  /// Register
  void register() {
    if (phone.value != '' && password.value != '') {
      change(data, status: RxStatus.loading());
      authProvider
          .register(
              dialCode: dialCode.value,
              phone: phone.value,
              password: password.value,
              passwordConfirmation: passwordConfirmation.value)
          .then((contractor) {
        change(data, status: RxStatus.success());
        if (contractor is Contractor) {
          authProvider.registerSuccess(contractor);
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

  /// Recovery - Look up phone number
  void recovery() {
    if (phone.value != '') {
      change(data, status: RxStatus.loading());
      authProvider
          .recovery(dialCode: dialCode.value, phone: phone.value)
          .then((contractor) {
        change(data, status: RxStatus.success());
        if (contractor is Contractor) {
          authProvider.registerSuccess(contractor);
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
