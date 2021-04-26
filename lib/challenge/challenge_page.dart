import 'package:dev_quiz_nlw/challenge/challenge_controller.dart';
import 'package:dev_quiz_nlw/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz_nlw/challenge/widgets/question_indicator/question_indicator.dart';
import 'package:dev_quiz_nlw/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz_nlw/core/app_colors.dart';
import 'package:dev_quiz_nlw/result_page/result_page.dart';
import 'package:dev_quiz_nlw/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  final String title;

  ChallengePage({required this.questions, required this.title});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final _controller = ChallengeController();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: AppColors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ValueListenableBuilder<int>(
                valueListenable: _controller.currentPageNotifier,
                builder: (context, value, _) {
                  return QuestionIndicatorWidget(
                    currentPage: value,
                    totalPages: widget.questions.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          _controller.currentPage = index + 1;
        },
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: (answer) => _nextPage(answer.isCorrect),
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
              valueListenable: _controller.currentPageNotifier,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (value < widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.white(
                          label: "Pular",
                          onTap: () => _nextPage(false),
                        ),
                      ),
                    if (value == widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.darkGreen(
                          label: "Confirmar",
                          onTap: _finishChallenge,
                        ),
                      ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void _nextPage(bool isCorrect) {
    if (isCorrect) {
      _controller.correctAnswers++;
    }

    if (_controller.currentPage == widget.questions.length) {
      // _finishChallenge();
      return;
    }

    print("nextPage:isCorrect: ${isCorrect}");
    _pageController.nextPage(
        duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  void _finishChallenge() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => ResultPage(
                title: widget.title,
                totalQuestions: widget.questions.length,
                correctAnswers: _controller.correctAnswers,
              )),
    );
  }
}
