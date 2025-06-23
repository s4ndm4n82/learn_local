import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  final List<Lesson> lessons = const [
    Lesson(
      id: 1,
      title: 'Greetings in Hindi',
      phrase: 'नमस्ते (Namaste)',
      translation: 'Hello',
    ),
    Lesson(
      id: 2,
      title: 'Travel Phrases in Hindi',
      phrase: 'क्या है? (Kitna hai?)',
      translation: 'How much?',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lessons')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                lesson.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text('${lesson.phrase} - ${lesson.translation}'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You selected: ${lesson.title}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
