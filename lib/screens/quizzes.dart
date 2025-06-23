import 'package:flutter/material.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quizzes')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quiz Interface (Prototype)',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text('Question: What is the "Hello" in Hindi?'),
            SizedBox(height: 8.0),
            Text('A) नमस्ते (Namaste)'),
            Text('B) नमस्कार (Namaskaar)'),
            Text('C) हेलो (Hello)'),
            SizedBox(height: 16.0),
            Text('Select an option (not functional in this prototype):'),
          ],
        ),
      ),
    );
  }
}
