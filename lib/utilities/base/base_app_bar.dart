import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/app_text.dart';
import 'package:unicons/unicons.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> homePageKey;
  final bool showMenuIcon;
  final bool showNotificationIcon;
  final bool centerTitle;

  const BaseAppBar({
    Key? key,
    required this.homePageKey,
    this.showMenuIcon = true,
    this.showNotificationIcon = true,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: showMenuIcon
          ? IconButton(
              icon: const Icon(UniconsLine.bars),
              onPressed: () {
                homePageKey.currentState?.openDrawer(); // Open the drawer
              },
            )
          : null,
      centerTitle: centerTitle,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(
            text: "Khidmat",
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          AppText(
            text: "Pro",
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
      actions: showNotificationIcon
          ? [
              IconButton(
                icon: const Icon(UniconsLine.bell),
                onPressed: () {
                  // Implement your notifications functionality here
                },
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
