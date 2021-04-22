import 'package:dev_quiz_nlw/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz_nlw/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title:
                "Kit de desenvolvimento de interface de usuário awygd gawyg wag",
            isCorrect: false,
            isSelected: false,
          ),
          SizedBox(
            height: 8,
          ),
          AnswerWidget(
            title:
                "Kit de desenvolvimento de interface de usuário awygd gawyg wag",
            isCorrect: true,
            isSelected: true,
          ),
          SizedBox(
            height: 8,
          ),
          AnswerWidget(
            title:
                "Kit de desenvolvimento de interface de usuário awygd gawyg wag",
            isCorrect: false,
            isSelected: false,
          ),
          SizedBox(
            height: 8,
          ),
          AnswerWidget(
            title:
                "Kit de desenvolvimento de interface de usuário awygd gawyg wag",
            isCorrect: false,
            isSelected: true,
          ),
        ],
      ),
    );
  }
}
