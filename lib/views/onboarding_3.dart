import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/controllers/location_controller.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/buttons/button_in_progress.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  double localStepCoverageInKilometer = 20.0;

  LocationController locationController = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 48, right: 48, bottom: 24),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: CircleBorder(
                          side: BorderSide.none,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Set your coverage area",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  minHeight: 500,
                  maxHeight: 500),
              child: Obx(
                () => locationController.isLatLngReady.value
                    ? FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(
                              locationController.currentLat.value,
                              locationController.currentLng.value),
                          initialZoom: 10,
                          maxZoom: 17,
                          minZoom: 10,
                          interactionOptions: const InteractionOptions(
                              flags: InteractiveFlag.pinchZoom),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),

                          // Coverage radius
                          CircleLayer(
                            circles: [
                              CircleMarker(
                                point: LatLng(
                                    locationController.currentLat.value,
                                    locationController.currentLng.value),
                                radius: locationController
                                    .coverageInMeter.value, // default 20km
                                useRadiusInMeter: true,
                                color: AppColors.primaryColor.withAlpha(50),
                              ),
                            ],
                          ),

                          // Current contractor location
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: LatLng(
                                    locationController.currentLat.value,
                                    locationController.currentLng.value),
                                width: 80,
                                height: 80,
                                child: const Icon(
                                  Icons.location_on_outlined,
                                  size: 40,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : const Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Getting your current location",
                                    style: TextStyle(fontSize: 18)),
                                SizedBox(
                                  height: 10,
                                ),
                                CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 25),
            Column(
              children: [
                // My Location
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      const Text(
                        "My location : ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Expanded(
                        child: Obx(() => locationController.isLatLngReady.value
                            ? Text(
                                locationController.city.value,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            : SizedBox(
                                height: 10,
                                width: 20,
                                child: ButtonInProgress(
                                  indicatorColor: Colors.black54,
                                ),
                              )),
                      ),
                    ],
                  ),
                ),

                // Coverage radius
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: SfSlider(
                          showDividers: true,
                          min: 0.0,
                          max: 100.0,
                          value: localStepCoverageInKilometer,
                          interval: 20,
                          showTicks: true,
                          showLabels: true,
                          enableTooltip: false,
                          minorTicksPerInterval: 5,
                          onChanged: (dynamic value) {
                            setState(() {
                              // Update local state
                              localStepCoverageInKilometer = value;

                              // Update obs
                              // times 1000 to get meter value
                              locationController.coverageInKilometer.value =
                                  value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                SizedBox(
                  width: 312,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => locationController.toOnboarding4(),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.shade400,
                            Colors.purple.shade800
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Obx(
                            () => locationController.isProcessing.value == true
                                ? ButtonInProgress(
                                    indicatorColor: Colors.white,
                                  )
                                : const Text(
                                    "Seterusnya",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
