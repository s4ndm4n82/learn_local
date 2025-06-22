import 'package:flutter/material.dart';

void main() {
  runApp(const LearnLocalApp());
}

class LearnLocalApp extends StatelessWidget {
  const LearnLocalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Local',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16.0)),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn Local')),
      body: const Center(child: Text('Welcome to Learn Local!')),
    );
  }
}
