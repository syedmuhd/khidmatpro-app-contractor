import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService authService;

  AuthController({required this.authService});

  var email = 'syed@softwarehub.my'.obs;
  var password = 'password'.obs;

  void signIn() {
    authService
        .login(email: email.value, password: password.value)
        .then((result) {
    }, onError: (err) {
      debugPrint("err: $err");
    });
  }
}
