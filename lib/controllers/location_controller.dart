import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/base_controller.dart';
import 'package:khidmatpro_app_vendor/controllers/contractor_controller.dart';
import 'package:khidmatpro_app_vendor/models/contractor.dart';
import 'package:khidmatpro_app_vendor/models/location.dart'
    as contractor_location;
import 'package:khidmatpro_app_vendor/providers/auth_provider.dart';
import 'package:khidmatpro_app_vendor/providers/contractor_provider.dart';
import 'package:khidmatpro_app_vendor/services/location_service.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class LocationController extends BaseController {
  LocationService locationService = Get.find<LocationService>();

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

// Input
  final isLatLngReady = false.obs;
  final currentLat = 0.0.obs;
  final currentLng = 0.0.obs;
  final coverageInMeter = 20000.0.obs; // Default 20km
  final coverageInKilometer = 20.0.obs; // Default 20km
  final street = ''.obs;
  final postcode = 0.obs;
  final state = ''.obs;
  final city = ''.obs;

  // State
  final isProcessing = false.obs;

  void getCurrentLocation() {
    locationService.getCurrentLocation().then((Position position) async {
      currentLat.value = position.latitude;
      currentLng.value = position.longitude;

      isLatLngReady.value = true;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(currentLat.value, currentLng.value);

      street.value = placemarks.first.street ?? "";
      postcode.value = int.parse(placemarks.first.postalCode!);
      state.value = placemarks.first.administrativeArea ?? "";
      city.value = placemarks.first.locality ?? "";

      Contractor contractor = await Get.find<AuthProvider>()
          .getCurrentContractor(); // Convert this to local?

      // Update contractor's location
      // street, postcode, state, city
      ContractorProvider contractorProvider = Get.find<ContractorProvider>();
      contractorProvider.updateLocation(
          contractor_location.Location(
            coverageInKm: coverageInKilometer.value,
            latitude: currentLat.value,
            longitude: currentLng.value,
            street: street.value,
            postcode: postcode.value,
            state: state.value,
            city: city.value,
          ).toJson(),
          contractor.id);

      debugPrint("Current lat: ${currentLat.value}");
      debugPrint("Current lng: ${currentLng.value}");
    });
  }

  void toOnboarding4() async {
    isProcessing.value = true;

    Contractor contractor = await Get.find<AuthProvider>()
        .getCurrentContractor(); // Convert this to local?

    // Update contractor's location
    // street, postcode, state, city
    ContractorProvider contractorProvider = Get.find<ContractorProvider>();
    contractorProvider
        .updateLocation(
            contractor_location.Location(
              coverageInKm: coverageInKilometer.value,
              latitude: currentLat.value,
              longitude: currentLng.value,
              street: street.value,
              postcode: postcode.value,
              state: state.value,
              city: city.value,
            ).toJson(),
            contractor.id)
        .then((value) {
      Get.find<ContractorController>().toNextOnboardingPage().then((nextPage) {
        isProcessing.value = false;
        Get.offAllNamed(nextPage!);
      });
    });
  }
}
