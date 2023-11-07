import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/base_controller.dart';
import 'package:khidmatpro_app_vendor/models/auth_model.dart';
import 'package:khidmatpro_app_vendor/services/auth_service.dart';

class AuthController extends BaseController with StateMixin<AuthModel> {
  final AuthService authService;

  AuthController({required this.authService});

  var email = 'syed@softwarehub.my'.obs;
  var password = 'password'.obs;

  AuthModel? get data => AuthModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(data, status: RxStatus.success());
  }

  void signIn() {
    change(data, status: RxStatus.loading());
    authService
        .login(email: email.value, password: password.value)
        .then((data) {
      if (data is AuthModel) {
        change(data, status: RxStatus.success());
        debugPrint(data.token);
      }
    }).onError((error, stackTrace) {
      debugPrint("Error: $error");
    });
  }
}
