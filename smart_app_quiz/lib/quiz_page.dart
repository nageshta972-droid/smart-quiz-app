import 'package:flutter/material.dart';
import 'question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questions = [
    Question(
      question: "What is Flutter?",
      options: [
        "Programming Language",
        "SDK",
        "Database",
        "Browser"
      ],
      correctAnswer: 1,
    ),

    Question(
      question: "Who developed Dart?",
      options: [
        "Microsoft",
        "Google",
        "Apple",
        "Meta"
      ],
      correctAnswer: 1,
    ),

    Question(
      question: "Which widget is immutable?",
      options: [
        "StatefulWidget",
        "Container",
        "StatelessWidget",
        "TextField"
      ],
      correctAnswer: 2,
    ),

    Question(
      question: "What is Dart primarily used for?",
      options: [
        "StatefulWidget",
        "Operating system development",
        "Database management",
        "Mobile app development"
      ],
      correctAnswer: 3,
    ),

    Question(
      question: "Dart is classified as which type of language?",
      options: [
        "Interpreted",
        "Assembled",
        "Scripting",
        "Compiled"
      ],
      correctAnswer: 3,
    ),

    Question(
      question:
          "Which keyword defines a variable that cannot be changed after assignment?",
      options: [
        "var",
        "final",
        "const",
        "static"
      ],
      correctAnswer: 2,
    ),
  ];

  int currentQuestion = 0;
  int score = 0;
  int selectedAnswer = -1;

  @override
  void initState() {
    super.initState();

    // Randomize questions every time quiz starts
    questions.shuffle();
  }

  void nextQuestion() {
    if (selectedAnswer ==
        questions[currentQuestion].correctAnswer) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = -1;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Question q = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Question ${currentQuestion + 1}/${questions.length}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            Text(
              q.question,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ...List.generate(
              q.options.length,
              (index) => RadioListTile<int>(
                value: index,
                groupValue: selectedAnswer,
                title: Text(q.options[index]),
                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value!;
                  });
                },
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:
                    selectedAnswer == -1 ? null : nextQuestion,
                child: const Text(
                  "Next Question",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}