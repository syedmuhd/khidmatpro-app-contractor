import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    StorageService storageService = Get.find();

    return FutureBuilder(
      future: storageService.getNextPage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final nextPage = snapshot.data;
          if (nextPage != null) {
            Future.delayed(const Duration(milliseconds: 1), () {
              Get.offNamed(nextPage.toString());
            });
          }
          // Return an empty widget
          return const SizedBox.shrink();
        }
      },
    );
  }
}
