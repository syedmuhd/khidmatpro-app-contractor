import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:unicons/unicons.dart';

class BaseAppDrawer extends StatelessWidget {
  const BaseAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                ),
              ),
            ),
            height: 110,
            child: const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: "Khidmat",
                    size: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  AppText(
                    text: "Pro",
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25),
            child: Column(
              children: [
                /// Settings
                InkWell(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(UniconsLine.cog),
                      SizedBox(
                        width: 20,
                      ),
                      AppText(
                        text: "Settings",
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.toNamed(RouteConstant.settings);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                /// Help
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(UniconsLine.question_circle),
                      SizedBox(
                        width: 20,
                      ),
                      const AppText(
                        text: "Help",
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.toNamed(RouteConstant.settings);
                  },
                ),
              ],
            ),
          ),
          // This is the button that should appear at the bottom
          const Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: AppText(
                text: "Powered by SoftwareHub",
                size: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
