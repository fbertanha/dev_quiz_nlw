
class AnswerModel {
  final String title;
  final bool isCorrect;

  AnswerModel({
    required this.title,
    this.isCorrect = false,
  });


  @override
  String toString() {
    return 'AnswerModel{title: $title, isCorrect: $isCorrect}';
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return new AnswerModel(
      title: map['title'],
      isCorrect: map['isCorrect'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'isCorrect': this.isCorrect,
    } as Map<String, dynamic>;
  }
}