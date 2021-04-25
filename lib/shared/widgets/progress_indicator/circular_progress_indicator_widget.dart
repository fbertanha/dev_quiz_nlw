import 'package:dev_quiz_nlw/core/core.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  CircularProgressIndicatorWidget();

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
      backgroundColor: AppColors.chartSecondary,
    );
  }
}
