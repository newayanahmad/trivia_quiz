import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_quiz/models/quiz_model.dart';
import 'dart:convert';

class QuizController extends GetxController {
  var questions = <Question>[].obs;
  var currentQuestionIndex = 0.obs;
  var selectedAnswer = "".obs;
  var score = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuestions();
  }

  void fetchQuestions() async {
    var response = await http
        .get(Uri.parse('https://the-trivia-api.com/v2/questions?limit=10'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      questions
          .addAll(data.map((question) => Question.fromJson(question)).toList());
    } else {
      questions.value = [];
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
    }
  }

  void reset() {
    questions.value = [];
    fetchQuestions();
    currentQuestionIndex.value = 0;
    score.value = 0;
  }

  Question get currentQuestion => questions[currentQuestionIndex.value];

  String setSelectedAnswer(String value) {
    if (currentQuestion.correctAnswer == value) {
      score.value++;
    }
    selectedAnswer.value = value;
    return selectedAnswer.value;
  }
}
