import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_quiz/components/custom_button.dart';
import 'package:trivia_quiz/controllers/quiz_controller.dart';
import 'package:trivia_quiz/pages/start_page.dart';

class ResultsPage extends StatelessWidget {
  final QuizController quizController = Get.find();

  ResultsPage({super.key});

  String getFeedback() {
    var percentage =
        quizController.score.value / quizController.questions.length;
    if (percentage >= 0.8) {
      return '🎉 Excellent work! You really know your stuff! 🎉';
    } else if (percentage >= 0.6) {
      return '👍 Good job! You have a solid understanding. 👍';
    } else if (percentage >= 0.4) {
      return '😊 Not bad! But there\'s still room for improvement. 😊';
    } else {
      return '😅 Don\'t be discouraged. Keep trying and you\'ll get better! 😅';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score: ${quizController.score.value}/${quizController.questions.length}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              getFeedback(),
              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Play Again',
              onPressed: () {
                quizController.reset();
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
