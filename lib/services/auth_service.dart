import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/models/auth_model.dart';
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';

class AuthService extends GetxService {
  final AuthProvider authProvider;

  AuthService(this.authProvider);

  // Login logic
  Future<Future<Response<AuthModel>>> login(
      {required String email, required String password}) async {
    debugPrint("[AuthService.dart] login($email, $password)");
    return authProvider.login(email: email, password: password);
  }
}
