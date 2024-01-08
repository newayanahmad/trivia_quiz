import 'package:flutter/material.dart';
import 'package:trivia_quiz/components/custom_button.dart';
import 'package:trivia_quiz/pages/quiz_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                width: MediaQuery.of(context).size.width * .8,
              ),
              Text(
                'Trivia Quiz',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent.shade400,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Test your knowledge with fun and challenging trivia questions!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900, // Set your desired text color
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Start Quiz',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
