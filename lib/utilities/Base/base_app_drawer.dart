import 'package:flutter/material.dart';
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
            color: AppColors.colorDrawerHeader,
            height: 110, // Set the desired height here
            child: const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: "Khidmat",
                    color: AppColors.appBarTextKhidmat,
                    size: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  AppText(
                    text: "Pro",
                    color: AppColors.appBarTextPro,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Column(
              children: [
                /// Settings
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(UniconsLine.cog),
                    SizedBox(
                      width: 20,
                    ),
                    AppText(
                      text: "Settings",
                      color: AppColors.appBarTextPro,
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                /// Help
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(UniconsLine.question_circle),
                    SizedBox(
                      width: 20,
                    ),
                    AppText(
                      text: "Help",
                      color: AppColors.appBarTextPro,
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          ),
          // Add more drawer items as needed
        ],
      ),
    );
  }
}
