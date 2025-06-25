import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/lessons_screen.dart';
import 'screens/quizzes_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(LearnLocal());
}

class LearnLocal extends StatelessWidget {
  const LearnLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Learn Local",
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    LessonsScreen(),
    QuizzesScreen(),
    ProfileScreen(),
    SettingsScreen(),
    HelpScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Lessons'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quizzes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
