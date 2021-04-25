import 'dart:convert';

import 'package:dev_quiz_nlw/shared/models/answer_model.dart';
import 'package:dev_quiz_nlw/shared/models/quiz_model.dart';
import 'package:dev_quiz_nlw/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {

  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>?> getQuizzes() async {
    final response = await rootBundle.loadString("assets/database/quizzes.json");
    final quizzes = QuizModel.fromJsonList(response);
    return quizzes;
  }
}
