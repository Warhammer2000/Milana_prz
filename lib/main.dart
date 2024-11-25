import 'package:flutter/material.dart';
import 'screens/compliments_screen.dart';
import 'screens/photos_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/surprise_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milana App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    ComplimentsScreen(),
    PhotosScreen(),
    NotificationsScreen(),
    QuizScreen(),
    SurpriseScreen(),
  ];

  final List<String> _titles = [
    'Комплименты',
    'Фотографии',
    'Уведомления',
    'Викторина',
    'Сюрприз',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Комплименты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Фотографии',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Уведомления',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Викторина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Сюрприз',
          ),
        ],
      ),
    );
  }
}