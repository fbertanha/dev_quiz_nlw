import 'package:dev_quiz_nlw/core/app_text_styles.dart';
import 'package:dev_quiz_nlw/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;


  QuestionIndicatorWidget({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.body,
              ),
              Text("de $totalPages", style: AppTextStyles.body)
            ],
          ),
          SizedBox(
            height: 16,
          ),
          LinearProgressIndicatorWidget(
            value: currentPage / totalPages,
          )
        ],
      ),
    );
  }
}
