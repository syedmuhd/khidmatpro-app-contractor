import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl =
        "https://devoted-jennet-frankly.ngrok-free.app/api"; // Base URL
    httpClient.followRedirects = true; // Enable following redirects
  }
}
