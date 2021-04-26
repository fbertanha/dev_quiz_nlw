import 'package:flutter/foundation.dart';

class ChallengeController {
  int correctAnswers = 0;
  final currentPageNotifier = ValueNotifier<int>(1);

  int get currentPage => currentPageNotifier.value;

  set currentPage(int newValue) => currentPageNotifier.value = newValue;
}
