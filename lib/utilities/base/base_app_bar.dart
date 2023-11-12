import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:unicons/unicons.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> homePageKey;
  final bool showMenuIcon;
  final bool showNotificationIcon;

  const BaseAppBar({
    Key? key,
    required this.homePageKey,
    this.showMenuIcon = true,
    this.showNotificationIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 14, right: 5),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.colorMain,
        leading: showMenuIcon
            ? IconButton(
                icon: const Icon(UniconsLine.bars, color: AppColors.colorIcon),
                onPressed: () {
                  homePageKey.currentState?.openDrawer(); // Open the drawer
                },
              )
            : null,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: "Khidmat",
              color: AppColors.appBarTextKhidmat,
              size: 18,
              fontWeight: FontWeight.w600,
            ),
            AppText(
              text: "Pro",
              color: AppColors.appBarTextPro,
              size: 18,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        actions: showNotificationIcon
            ? [
                IconButton(
                  icon: const Icon(
                    UniconsLine.bell,
                    color: AppColors.colorIcon,
                  ),
                  onPressed: () {
                    // Implement your notifications functionality here
                  },
                ),
              ]
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
