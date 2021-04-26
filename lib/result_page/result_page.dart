import 'package:dev_quiz_nlw/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz_nlw/core/app_images.dart';
import 'package:dev_quiz_nlw/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int totalQuestions;
  final int correctAnswers;

  ResultPage({required this.title, required this.totalQuestions, required this.correctAnswers});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            SizedBox(height: 40,),
            Text(
              "Parabéns!",
              style: AppTextStyles.heading40,
            ),
            SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                text: "Você concluiu",
                style: AppTextStyles.body,
                children: [
                  TextSpan(
                      text: "\n$title",
                      style: AppTextStyles.bodyBold),
                  TextSpan(
                    text: "\ncom $correctAnswers de $totalQuestions acertos.",
                    style: AppTextStyles.body,
                  )
                ],
              ),
              style: AppTextStyles.heading,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 68),
              width: double.maxFinite,
              child:
                  NextButtonWidget.purple(label: "Compartilhar", onTap: () {
                    print("aa");
                    Share.share("DevQuiz NLW 5 - Flutter: Resultado do Quiz $title");
                  }),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 68),
              width: double.maxFinite,
              child: NextButtonWidget.transparent(
                  label: "Voltar ao início", onTap: () {
                    Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
    );
  }

}
