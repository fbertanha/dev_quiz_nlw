import 'package:flutter/cupertino.dart';

class QuizController {
  final indexSelectedNotifier = ValueNotifier<int>(-1);

  int get indexSelected => indexSelectedNotifier.value;

  set indexSelected(int newValue) => indexSelectedNotifier.value = newValue;
}
