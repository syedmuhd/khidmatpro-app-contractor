import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 48, right: 48, bottom: 24),
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
                    "Where is your location?",
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
                  maxWidth: MediaQuery.of(context).size.width, maxHeight: 500),
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(3.0341228, 101.5598843),
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 47, right: 47),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "No 53, Jalan Aman Arahsia 40400 Teluk Panglima Garang, Selangor",
                          style: TextStyle(
                            fontSize: 16,
                          ),
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
                    onPressed: () => Get.toNamed(RouteConstant.register4),
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
                        child: const Center(
                          child: Text(
                            "Continue",
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
