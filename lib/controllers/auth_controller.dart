import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/base_controller.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';
import 'package:logger/logger.dart';

class AuthController extends BaseController with StateMixin<Contractor> {
  final AuthProvider authProvider;

  AuthController({required this.authProvider});

  final phoneCode = '60'.obs;
  final phone = '162731882'.obs;
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

  /// Login
  void login() {
    var logger = Logger();

    logger.d(phone);
    if (phone.value != '' && password.value != '') {
      change(data, status: RxStatus.loading());
      authProvider
          .login(phone: phone.value, password: password.value)
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
          .register(phoneNumberOrEmail: phone.value, password: password.value)
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
