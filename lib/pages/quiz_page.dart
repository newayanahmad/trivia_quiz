import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_quiz/components/custom_button.dart';
import 'package:trivia_quiz/components/custom_radio_group.dart';
import 'package:trivia_quiz/controllers/quiz_controller.dart';
import 'package:trivia_quiz/pages/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizController quizController = Get.put(QuizController());

  String get message {
    if (quizController.selectedAnswer.value == "") {
      return '';
    } else if (quizController.currentQuestion.correctAnswer ==
        quizController.selectedAnswer.value) {
      return 'Correct Answer!';
    } else {
      return 'Incorrect! Correct Answer is ${quizController.currentQuestion.correctAnswer}\n\n';
    }
  }

  @override
  void dispose() {
    quizController.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
      ),
      body: Obx(
        () {
          if (quizController.questions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Question ${quizController.currentQuestionIndex.value + 1} of 10',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    quizController.currentQuestion.questionText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomRadioGroup(
                    options: quizController.currentQuestion.options,
                    groupValue: quizController.selectedAnswer.value,
                    onChanged: (value) {
                      if (quizController.selectedAnswer.value == "") {
                        quizController.setSelectedAnswer(value.toString());
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Next Question',
                    onPressed: () {
                      if (quizController.selectedAnswer.value == "") {
                        return;
                      } else {
                        if (quizController.currentQuestionIndex.value == 9) {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultsPage()),
                          );
                        }
                        quizController.setSelectedAnswer("");
                        quizController.nextQuestion();
                      }
                    },
                    color: quizController.selectedAnswer.value == ""
                        ? Colors.pink.shade200
                        : Colors.pinkAccent.shade200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: message.startsWith("Correct")
                          ? Colors.green
                          : Colors.red,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
