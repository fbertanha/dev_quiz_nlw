import 'package:dev_quiz_nlw/home/home_controller.dart';
import 'package:dev_quiz_nlw/home/home_state.dart';
import 'package:dev_quiz_nlw/home/widgets/app_bar/app_bar_widget.dart';
import 'package:dev_quiz_nlw/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz_nlw/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:dev_quiz_nlw/shared/widgets/progress_indicator/circular_progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.getUser();
    _controller.getQuizzes();
    _controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.state == HomeState.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicatorWidget(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBarWidget(
        user: _controller.user!,
      ),
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
                children: _controller.quizzes!
                    .map((quiz) => QuizCardWidget(
                          quiz: quiz,
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
