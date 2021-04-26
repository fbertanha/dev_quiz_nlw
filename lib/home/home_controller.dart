import 'package:dev_quiz_nlw/home/home_repository.dart';
import 'package:dev_quiz_nlw/home/home_state.dart';
import 'package:dev_quiz_nlw/shared/models/quiz_model.dart';
import 'package:dev_quiz_nlw/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);

  set _state(HomeState newState) => stateNotifier.value = newState;

  HomeState get state => stateNotifier.value;
  UserModel? user;
  List<QuizModel>? quizzes;

  final _homeRepository = HomeRepository();

  void getUser() async {
    _state = HomeState.loading;
    // await Future.delayed(Duration(seconds: 2));

    user = await _homeRepository.getUser();

    _state = HomeState.success;
  }

  void getQuizzes() async {
    _state = HomeState.loading;
    // await Future.delayed(Duration(seconds: 2));
    quizzes = await _homeRepository.getQuizzes();

    _state = HomeState.success;
  }
}
