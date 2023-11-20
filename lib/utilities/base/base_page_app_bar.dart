import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:unicons/unicons.dart';

class BasePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> homePageKey;

  const BasePageAppBar({Key? key, required this.homePageKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back(); // Navigate back when the back arrow is tapped
        },
      ),
      title: const AppText(
        text: "Settings",
        fontWeight: FontWeight.w500,
        size: 18,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
