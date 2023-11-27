import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Image.asset(
                'assets/images/icons/loading/khidmatpro.png',
                // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
