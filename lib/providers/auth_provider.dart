import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/configs/api_config.dart';
import 'package:khidmatpro_app_vendor/models/auth_model.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    httpClient.baseUrl = ApiConfig.baseUrl;
    httpClient.addRequestModifier((request) {
      request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
      return request;
    });
  }

  Future<Response<AuthModel>> login(
          {required String email, required String password}) =>
      post<AuthModel>("https://khidmatpro.localhost/api/auth/login",
          {email: email, password: password},
          decoder: (obj) => AuthModel.fromJson(obj));
}
