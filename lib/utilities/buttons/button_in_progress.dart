import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ButtonInProgress extends StatelessWidget {
  ButtonInProgress({super.key, this.indicatorColor = Colors.white});

  Color indicatorColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      indicatorType: Indicator.ballPulse,
      colors: [indicatorColor],
    );
  }
}
