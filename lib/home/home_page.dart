import 'package:dev_quiz_nlw/home/widgets/app_bar/app_bar_widget.dart';
import 'package:dev_quiz_nlw/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
    );
  }
}
