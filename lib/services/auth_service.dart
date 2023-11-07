import 'package:khidmatpro_app_vendor/models/auth_model.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';

class AuthService extends BaseProvider {
  // Login logic
  Future<dynamic> login(
      {required String email, required String password}) async {
    final response =
        await post("/auth/login", {"email": email, "password": password});

    if (response.isOk) {
      return AuthModel.fromJson(response.body);
    } else {
      throw Exception();
    }
  }
}
