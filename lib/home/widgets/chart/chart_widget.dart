import 'package:dev_quiz_nlw/core/app_colors.dart';
import 'package:dev_quiz_nlw/core/app_text_styles.dart';
import 'package:dev_quiz_nlw/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final UserModel user;

  ChartWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: user.score / 100,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text(
              "${user.score}%",
              style: AppTextStyles.heading,
            ),
          )
        ],
      ),
    );
  }
}
