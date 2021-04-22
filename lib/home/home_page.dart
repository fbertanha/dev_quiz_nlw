import 'package:dev_quiz_nlw/home/widgets/app_bar/app_bar_widget.dart';
import 'package:dev_quiz_nlw/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz_nlw/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: "Fácil",
                  style: LevelButtonStyle.purple,
                ),
                LevelButtonWidget(
                  label: "Médio",
                  style: LevelButtonStyle.green,
                ),
                LevelButtonWidget(
                  label: "Difícil",
                  style: LevelButtonStyle.orange,
                ),
                LevelButtonWidget(
                  label: "Perito",
                  style: LevelButtonStyle.red,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
