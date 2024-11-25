import 'dart:math';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What is the capital of France?",
      "answers": ["Paris", "London", "Berlin", "Rome"],
      "correct": 0
    },
    {
      "question": "What is 2 + 2?",
      "answers": ["3", "4", "5", "6"],
      "correct": 1
    },
    {
      "question": "What is the largest planet in our solar system?",
      "answers": ["Earth", "Mars", "Jupiter", "Venus"],
      "correct": 2
    },
  ];

  int _currentQuestion = 0;
  String _feedback = "";

  void _checkAnswer(int selectedIndex) {
    setState(() {
      if (selectedIndex == _questions[_currentQuestion]["correct"]) {
        _feedback = "Correct!";
      } else {
        _feedback = "Wrong!";
      }
      _currentQuestion = (_currentQuestion + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Викторина'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question["question"],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...List.generate(
              question["answers"].length,
                  (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () => _checkAnswer(index),
                child: Text(question["answers"][index]),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}