import 'package:dev_quiz_nlw/core/core.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {

  final double value;


  LinearProgressIndicatorWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: this.value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
