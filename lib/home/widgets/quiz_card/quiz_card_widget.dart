import 'package:dev_quiz_nlw/core/app_colors.dart';
import 'package:dev_quiz_nlw/core/app_images.dart';
import 'package:dev_quiz_nlw/core/app_text_styles.dart';
import 'package:dev_quiz_nlw/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Gerenciamento de Estado",
            style: AppTextStyles.heading15,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                "3 de 10",
                style: AppTextStyles.body11,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: LinearProgressIndicatorWidget(value: 0.5,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
