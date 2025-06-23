import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/theme_model.dart';
import 'screens/home.dart';
import 'screens/lessons.dart';
import 'screens/quizzes.dart';
import 'screens/profile.dart';
import 'screens/settings.dart';
import 'screens/help.dart';
import 'screens/about.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: const LearnLocalApp(),
    ),
  );
}

class LearnLocalApp extends StatelessWidget {
  const LearnLocalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Local',
      theme: ThemeData(
        primarySwatch: Provider.of<ThemeModel>(context).isHighContrast
            ? Colors.grey
            : Colors.blue,
        brightness: Provider.of<ThemeModel>(context).isHighContrast
            ? Brightness.dark
            : Brightness.light,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: Provider.of<ThemeModel>(context).fontSize,
          ),
          headlineSmall: TextStyle(
            fontSize: Provider.of<ThemeModel>(context).fontSize + 4,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            textStyle: TextStyle(
              fontSize: Provider.of<ThemeModel>(context).fontSize,
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Provider.of<ThemeModel>(context).isHighContrast
            ? Colors.black
            : Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/lessons': (context) => const LessonsScreen(),
        '/quizzes': (context) => const QuizzesScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/help': (context) => const HelpScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
