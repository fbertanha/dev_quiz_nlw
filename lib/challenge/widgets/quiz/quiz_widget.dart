import 'package:dev_quiz_nlw/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz_nlw/challenge/widgets/quiz/quiz_controller.dart';
import 'package:dev_quiz_nlw/core/app_text_styles.dart';
import 'package:dev_quiz_nlw/shared/models/answer_model.dart';
import 'package:dev_quiz_nlw/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  final ValueChanged<AnswerModel> onSelected;
  final _controller = QuizController();

  bool _alreadyAnswered = false;

  QuizWidget({required this.question, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: _controller.indexSelectedNotifier,
              builder: (context, value, child)  {
                return ListView.builder(
                  itemCount: question.answers.length,
                    itemBuilder: (context, index) {
                    final answer = question.answers[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: AnswerWidget(
                      answer: answer,
                      isSelected: index == _controller.indexSelected,
                      disabled: _alreadyAnswered,
                      onTap: () {
                        _alreadyAnswered = true;
                        _controller.indexSelected = index;
                        Future.delayed(Duration(seconds: 1)).then((value) => onSelected(answer));
                      },
                    ),
                  );
                });
              }),
          ),
        ],
      ),
    );
  }
}
