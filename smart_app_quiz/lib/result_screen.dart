import 'package:flutter/material.dart';
import 'main.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    int incorrectAnswers = totalQuestions - score;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Quiz Completed",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Score: $score / $totalQuestions",
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 10),

            Text("Correct Answers: $score"),

            Text(
              "Incorrect Answers: $incorrectAnswers",
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomePage(),
                  ),
                  (route) => false,
                );
              },
              child: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}