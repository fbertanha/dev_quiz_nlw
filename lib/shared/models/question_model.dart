import 'answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.title,
    required this.answers,
  }) : assert(answers.length == 4);


  @override
  String toString() {
    return 'QuestionModel{title: $title, answers: $answers}';
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return new QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(
        map['answers']?.map((a) => AnswerModel.fromMap(a)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'answers': this.answers.map((a) => a.toMap()).toList(),
    } as Map<String, dynamic>;
  }
}
