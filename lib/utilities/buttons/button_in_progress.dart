import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ButtonInProgress extends StatelessWidget {
  const ButtonInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(
      indicatorType: Indicator.ballPulse,
      colors: [Colors.white],
    );
  }
}
