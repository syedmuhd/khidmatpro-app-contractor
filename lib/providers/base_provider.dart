import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://devoted-jennet-frankly.ngrok-free.app/api";

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';
      return request;
    });

    super.onInit();
  }
}
