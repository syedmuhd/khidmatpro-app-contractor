import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';
import 'package:khidmatpro_app_vendor/views/welcome_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final storageService = Get.find<StorageService>();

    return FutureBuilder(
      future: storageService.getNextPage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Display a loading indicator while waiting
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Future.delayed(const Duration(milliseconds: 1), () {
            Get.toNamed(snapshot.data.toString());
          });
          return const SizedBox.shrink(); // Return an empty widget
        }
      },
    );
  }
}
