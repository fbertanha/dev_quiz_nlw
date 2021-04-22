import 'package:dev_quiz_nlw/challenge/widgets/question_indicator/question_indicator.dart';
import 'package:dev_quiz_nlw/challenge/widgets/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget(),
        ),
      ),

      body: QuizWidget(title: "O que o Flutter faz em sua totalidade?",),
    );
  }
}
