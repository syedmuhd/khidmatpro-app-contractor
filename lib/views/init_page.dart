import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/services/storage_service.dart';
import 'package:khidmatpro_app_vendor/views/loading_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    StorageService storageService = Get.find<StorageService>();

    return FutureBuilder(
      // Based on this output
      future: storageService.getNextPage(),

      // What to do with the screen
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          debugPrint("$runtimeType ConnectionState.waiting");
          return const LoadingPage();
        } else if (snapshot.hasError) {
          debugPrint("$runtimeType snapshot.hasError");
          return Text('Error: ${snapshot.error}');
        } else {
          final nextPage = snapshot.data;
          debugPrint("$runtimeType nextPage $nextPage");

          if (nextPage != null) {
            Future.delayed(const Duration(milliseconds: 1), () {
              debugPrint("Next Page ${nextPage.toString()}");
              Get.offNamed(nextPage.toString());
            });
          }

          debugPrint("$runtimeType Empty widget");

          // Return an empty widget
          return const SizedBox.shrink();
        }
      },
    );
  }
}
