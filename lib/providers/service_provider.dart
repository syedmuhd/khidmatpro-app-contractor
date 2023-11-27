import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/api_constant.dart';
import 'package:khidmatpro_app_vendor/models/service.dart';
import 'package:khidmatpro_app_vendor/providers/base_provider.dart';

class ServiceProvider extends BaseProvider {
  // Get currently authenticated Services
  Future<Response<List<Service>>> all() {
    return get<List<Service>>("${ApiConstant.service}/all",
        decoder: (obj) => Service.listFromJson(obj));
  }
}
