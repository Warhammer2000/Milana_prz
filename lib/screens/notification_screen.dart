import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Здесь будут ваши уведомления!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
      ),
    );
  }
}