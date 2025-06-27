import 'package:flutter/material.dart';
import '../models/app_models.dart';
import 'quiz_detail_screen.dart';

class QuizzesScreen extends StatefulWidget {
  @override
  _QuizzesScreenState createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  String selectedLanguage = 'Hindi';
  final List<String> languages = ['Hindi', 'Yoruba', 'Swahili', 'Bengali'];

  // Quiz data structure
  final Map<String, List<Quiz>> quizzes = {
    'Hindi': [
      Quiz(
        title: 'Hindi Greetings Quiz',
        description: 'Test your knowledge of basic Hindi greetings',
        questionCount: 5,
        estimatedTime: '2 min',
        difficulty: 'Beginner',
        isUnlocked: true,
        bestScore: 85,
        attempts: 3,
      ),
      Quiz(
        title: 'Numbers 1-10 Quiz',
        description: 'Quiz on Hindi numbers from one to ten',
        questionCount: 10,
        estimatedTime: '3 min',
        difficulty: 'Beginner',
        isUnlocked: true,
        bestScore: 70,
        attempts: 1,
      ),
      Quiz(
        title: 'Family Members Quiz',
        description: 'Test your knowledge of family relationship words',
        questionCount: 8,
        estimatedTime: '3 min',
        difficulty: 'Intermediate',
        isUnlocked: false,
        bestScore: 0,
        attempts: 0,
      ),
    ],
    'Yoruba': [
      Quiz(
        title: 'Yoruba Greetings Quiz',
        description: 'Test your knowledge of basic Yoruba greetings',
        questionCount: 5,
        estimatedTime: '2 min',
        difficulty: 'Beginner',
        isUnlocked: true,
        bestScore: 0,
        attempts: 0,
      ),
      Quiz(
        title: 'Colors in Yoruba',
        description: 'Quiz on basic colors in Yoruba',
        questionCount: 6,
        estimatedTime: '2 min',
        difficulty: 'Beginner',
        isUnlocked: false,
        bestScore: 0,
        attempts: 0,
      ),
    ],
    'Swahili': [
      Quiz(
        title: 'Swahili Greetings Quiz',
        description: 'Test your knowledge of basic Swahili greetings',
        questionCount: 5,
        estimatedTime: '2 min',
        difficulty: 'Beginner',
        isUnlocked: true,
        bestScore: 0,
        attempts: 0,
      ),
    ],
    'Bengali': [
      Quiz(
        title: 'Bengali Greetings Quiz',
        description: 'Test your knowledge of basic Bengali greetings',
        questionCount: 5,
        estimatedTime: '2 min',
        difficulty: 'Beginner',
        isUnlocked: true,
        bestScore: 0,
        attempts: 0,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quizzes'), backgroundColor: Colors.green),
      body: Column(
        children: [
          // Language selection
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.quiz, color: Colors.orange),
                SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedLanguage,
                    decoration: InputDecoration(
                      labelText: 'Select Language',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
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

          // Quiz statistics
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuizStat('Completed', '${_getCompletedQuizzes()}'),
                _buildQuizStat('Best Score', '${_getBestScore()}%'),
                _buildQuizStat('Total Attempts', '${_getTotalAttempts()}'),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Quizzes list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: quizzes[selectedLanguage]?.length ?? 0,
              itemBuilder: (context, index) {
                final quiz = quizzes[selectedLanguage]![index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: quiz.isUnlocked ? 3 : 1,
                  child: InkWell(
                    onTap: quiz.isUnlocked
                        ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizDetailScreen(
                                quiz: quiz,
                                language: selectedLanguage,
                              ),
                            ),
                          )
                        : () => _showLockedQuizDialog(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: quiz.isUnlocked
                                      ? Colors.orange
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  quiz.isUnlocked ? Icons.quiz : Icons.lock,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      quiz.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: quiz.isUnlocked
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      quiz.description,
                                      style: TextStyle(
                                        color: quiz.isUnlocked
                                            ? Colors.grey.shade600
                                            : Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (quiz.isUnlocked)
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              _buildQuizInfo(
                                Icons.help_outline,
                                '${quiz.questionCount} questions',
                              ),
                              SizedBox(width: 16),
                              _buildQuizInfo(
                                Icons.access_time,
                                quiz.estimatedTime,
                              ),
                              SizedBox(width: 16),
                              _buildQuizInfo(
                                Icons.signal_cellular_alt,
                                quiz.difficulty,
                                color: _getDifficultyColor(quiz.difficulty),
                              ),
                            ],
                          ),
                          if (quiz.attempts > 0) ...[
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Best: ${quiz.bestScore}% (${quiz.attempts} attempts)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.orange.shade700),
        ),
      ],
    );
  }

  Widget _buildQuizInfo(IconData icon, String text, {Color? color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color ?? Colors.grey.shade600),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 12, color: color ?? Colors.grey.shade600),
        ),
      ],
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return Colors.green;
      case 'intermediate':
        return Colors.orange;
      case 'advanced':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  int _getCompletedQuizzes() {
    return quizzes[selectedLanguage]
            ?.where((quiz) => quiz.attempts > 0)
            .length ??
        0;
  }

  int _getBestScore() {
    final currentQuizzes = quizzes[selectedLanguage] ?? [];
    if (currentQuizzes.isEmpty) return 0;

    final completedQuizzes = currentQuizzes.where((quiz) => quiz.attempts > 0);
    if (completedQuizzes.isEmpty) return 0;

    return completedQuizzes
        .map((quiz) => quiz.bestScore)
        .reduce((a, b) => a > b ? a : b);
  }

  int _getTotalAttempts() {
    return quizzes[selectedLanguage]?.fold(
          0,
          (sum, quiz) => (sum ?? 0) + (quiz.attempts),
        ) ??
        0;
  }

  void _showLockedQuizDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.lock, color: Colors.orange),
            SizedBox(width: 8),
            Text('Quiz Locked'),
          ],
        ),
        content: Text(
          'Complete the related lessons to unlock this quiz. Keep learning and come back later!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to lessons - for now just show a message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Go to Lessons to unlock this quiz!')),
              );
            },
            child: Text('Go to Lessons'),
          ),
        ],
      ),
    );
  }
}
