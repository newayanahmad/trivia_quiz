class Question {
  final String category;
  final String id;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final String questionText;
  final List<String> options;

  Question(
      {required this.category,
      required this.id,
      required this.correctAnswer,
      required this.incorrectAnswers,
      required this.questionText,
      required this.options});

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> allOptions = [
      ...json['incorrectAnswers'],
      json['correctAnswer']
    ];
    allOptions.shuffle();
    return Question(
      category: json['category'],
      id: json['id'],
      correctAnswer: json['correctAnswer'],
      incorrectAnswers: List<String>.from(json['incorrectAnswers']),
      questionText: json['question']['text'],
      options: allOptions,
    );
  }
}
