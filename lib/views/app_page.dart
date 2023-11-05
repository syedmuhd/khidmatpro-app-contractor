import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';
import 'package:khidmatpro_app_vendor/views/auth_page.dart';
import 'package:khidmatpro_app_vendor/views/home_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final storageService = Get.find<StorageService>();

    return FutureBuilder(
      future: storageService.isAuthenticated(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Display a loading indicator while waiting
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data == true) {
            return const HomePage();
          } else {
            Future.delayed(const Duration(milliseconds: 1), () {
              Get.toNamed('/auth');
            });
            return const SizedBox.shrink(); // Return an empty widget
          }
        }
      },
    );
  }
}
