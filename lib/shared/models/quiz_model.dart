import 'dart:convert';

import 'package:dev_quiz_nlw/shared/models/answer_model.dart';

import 'question_model.dart';

enum QuizLevel { easy, medium, hard, advanced }

extension QuizLevelStringExt on String {
  QuizLevel get parse => {
        "easy": QuizLevel.easy,
        "medium": QuizLevel.medium,
        "hard": QuizLevel.hard,
        "advanced": QuizLevel.advanced
      }[this]!;
}

extension QuizLevelExt on QuizLevel {
  String get parse => {
        QuizLevel.easy: "easy",
        QuizLevel.medium: "medium",
        QuizLevel.hard: "hard",
        QuizLevel.advanced: "advanced"
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int answeredQuestions;
  final String image;
  final QuizLevel level;

  QuizModel({
    required this.title,
    required this.questions,
    this.answeredQuestions = 0,
    required this.image,
    required this.level,
  });


  @override
  String toString() {
    return 'QuizModel{title: $title, questions: $questions, answeredQuestions: $answeredQuestions, image: $image, level: $level}';
  }

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(jsonDecode(source));

  factory QuizModel.fromMap(Map<String, dynamic> map) {

    return new QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
        map['questions']?.map((q) => QuestionModel.fromMap(q)),
      ),
      answeredQuestions: map['answeredQuestions'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'questions': this.questions.map((q) => q.toMap()).toList(),
      'answeredQuestions': this.answeredQuestions,
      'image': this.image,
      'level': this.level.parse,
    } as Map<String, dynamic>;
  }

  static List<QuizModel> fromJsonList(String response) {
    final list = jsonDecode(response) as List;
    return list.map((e) => QuizModel.fromMap(e)).toList();
  }
}
