import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/location_service.dart';

class Onboarding3Binding extends Bindings {
  @override
  Future<void> dependencies() async {
    LocationService locationService = Get.find<LocationService>();
    locationService.requestPermissionForLocation();

    // TODO: getCurrentLocation
  }
}
