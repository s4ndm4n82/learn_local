import 'package:flutter/material.dart';
import '../models/app_models.dart';
import 'lesson_detail_screen.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  LessonsScreenState createState() => LessonsScreenState();
}

class LessonsScreenState extends State<LessonsScreen> {
  String selectedLanguage = 'Hindi';
  final List<String> languages = ['Hindi', 'Yoruba', 'Swahili', 'Bengali'];

  final Map<String, List<Lessons>> lessons = {
    'Hindi': [
      Lessons(
        title: 'Basic Greeting',
        description: 'Learn hello, goodbye, and common greetings',
        progress: 0.8,
        isUnlocked: true,
      ),
      Lessons(
        title: 'Numbers 1-10',
        description: 'Learn numbers from one to ten',
        progress: 0.6,
        isUnlocked: true,
      ),
      Lessons(
        title: 'Family Members',
        description: 'Words for family relationships',
        progress: 0.3,
        isUnlocked: false,
      ),
      Lessons(
        title: 'Food & Drinks',
        description: 'Essential food and drink vocabulary',
        progress: 0.0,
        isUnlocked: false,
      ),
      Lessons(
        title: 'Directions',
        description: 'Ask for and give directions',
        progress: 0.0,
        isUnlocked: false,
      ),
    ],
    'Yoruba': [
      Lessons(
        title: 'Basic Greeting',
        description: 'Learn hello, goodbye, and common greetings',
        progress: 0.5,
        isUnlocked: true,
      ),
      Lessons(
        title: 'Numbers 1-10',
        description: 'Learn numbers from one to ten',
        progress: 0.2,
        isUnlocked: false,
      ),
      Lessons(
        title: 'Colors',
        description: 'Basic colors vocabulary',
        progress: 0.0,
        isUnlocked: false,
      ),
      Lessons(
        title: 'Time & Days',
        description: 'Tell time and days of the week',
        progress: 0.0,
        isUnlocked: false,
      ),
    ],
    'Swahili': [
      Lessons(
        title: 'Basic Greeting',
        description: 'Learn hello, goodbye, and common greetings',
        progress: 0.3,
        isUnlocked: true,
      ),
      Lessons(
        title: 'Numbers 1-10',
        description: 'Learn numbers from one to ten',
        progress: 0.0,
        isUnlocked: false,
      ),
      Lessons(
        title: 'Animals',
        description: 'Common animals vocabulary',
        progress: 0.0,
        isUnlocked: false,
      ),
    ],
    'Bengali': [
      Lessons(
        title: 'Basic Greeting',
        description: 'Learn hello, goodbye, and common greetings',
        progress: 0.1,
        isUnlocked: true,
      ),
      Lessons(
        title: 'Numbers 1-10',
        description: 'Learn numbers from one to ten',
        progress: 0.5,
        isUnlocked: false,
      ),
      Lessons(
        title: 'Shopping',
        description: 'Essential shopping vocabulary',
        progress: 0.0,
        isUnlocked: false,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lessons'), backgroundColor: Colors.green),
      body: Column(
        children: [
          // Language Selection Dropdown
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.language, color: Colors.green),
                SizedBox(width: 12.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedLanguage,
                    decoration: InputDecoration(
                      labelText: 'Select Language',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                    ),
                    items: languages
                        .map(
                          (lang) =>
                              DropdownMenuItem(value: lang, child: Text(lang)),
                        )
                        .toList(),
                    onChanged: (value) =>
                        setState(() => selectedLanguage = value!),
                  ),
                ),
              ],
            ),
          ),

          // Progress overview
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildProgressStat(
                  'Completed',
                  '${_getCompletedLessons()}/${lessons[selectedLanguage]?.length ?? 0}',
                ),
                _buildProgressStat('Progress', '${_getOverallProgress()}'),
                _buildProgressStat('Unlocked', '${_getUnlockedLessons()}'),
              ],
            ),
          ),
          SizedBox(height: 16.0),

          // Lessons List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: lessons[selectedLanguage]?.length ?? 0,
              itemBuilder: (context, index) {
                final lesson = lessons[selectedLanguage]![index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12.0),
                  elevation: lesson.isUnlocked ? 2 : 1,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: lesson.isUnlocked
                          ? Colors.green
                          : Colors.grey,
                      child: Icon(
                        lesson.isUnlocked ? Icons.play_arrow : Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      lesson.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: lesson.isUnlocked ? Colors.black : Colors.grey,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.description,
                          style: TextStyle(
                            color: lesson.isUnlocked
                                ? Colors.black87
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        LinearProgressIndicator(
                          value: lesson.progress,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            lesson.isUnlocked ? Colors.green : Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${(lesson.progress * 100).toInt()}% Complete',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: lesson.isUnlocked
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    trailing: lesson.isUnlocked
                        ? Icon(Icons.arrow_forward_ios, color: Colors.green)
                        : Icon(Icons.lock, color: Colors.grey),
                    onTap: lesson.isUnlocked
                        ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonDetailScreen(
                                lesson: lesson,
                                language: selectedLanguage,
                              ),
                            ),
                          )
                        : () => _showLockedLessonDialog(context),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12.0, color: Colors.grey.shade700),
        ),
      ],
    );
  }

  int _getCompletedLessons() {
    return lessons[selectedLanguage]
            ?.where((lesson) => lesson.progress >= 1.0)
            .length ??
        0;
  }

  int _getOverallProgress() {
    final currentLessons = lessons[selectedLanguage] ?? [];
    if (currentLessons.isEmpty) return 0;

    final totalProgress = currentLessons.fold(
      0.0,
      (sum, lessons) => sum + lessons.progress,
    );
    return ((totalProgress / currentLessons.length) * 100).round();
  }

  int _getUnlockedLessons() {
    return lessons[selectedLanguage]
            ?.where((lesson) => lesson.isUnlocked)
            .length ??
        0;
  }

  void _showLockedLessonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lesson Locked'),
        content: Text(
          'Complete the previous lessons to unlock this one. Keep learning!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
