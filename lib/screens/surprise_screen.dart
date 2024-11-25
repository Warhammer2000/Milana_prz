import 'dart:math';
import 'package:flutter/material.dart';

class SurpriseScreen extends StatelessWidget {
  const SurpriseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surprises = [
      "🎉 You win a prize!",
      "✨ You are awesome!",
      "🎁 Here's a gift for you!",
      "🌟 Keep shining!",
    ];
    final randomSurprise = surprises[Random().nextInt(surprises.length)];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Сюрприз'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text(
          randomSurprise,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.pinkAccent,
          ),
        ),
      ),
    );
  }
}