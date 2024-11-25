import 'dart:math';
import 'package:flutter/material.dart';

class ComplimentsScreen extends StatefulWidget {
  const ComplimentsScreen({super.key});

  @override
  State<ComplimentsScreen> createState() => _ComplimentsScreenState();
}

class _ComplimentsScreenState extends State<ComplimentsScreen> {
  final List<String> _compliments = [
    "You're amazing!",
    "You have a great sense of humor!",
    "You're a true friend!",
    "You have an incredible smile!",
    "You're very talented!",
    "You're a gift to those around you!",
    "You're a ray of sunshine!",
    "You have a kind heart!",
  ];

  String _currentCompliment = "Tap the button to get a compliment!";

  void _generateCompliment() {
    setState(() {
      final random = Random();
      _currentCompliment = _compliments[random.nextInt(_compliments.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compliments"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentCompliment,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                onPressed: _generateCompliment,
                child: const Text(
                  "Get a Compliment",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}