// Import Flutter material design components
import 'package:flutter/material.dart';
// Import system services for haptic feedback
import 'package:flutter/services.dart';
// Import app data models
import '../models/app_models.dart';

/// QuizDetailScreen widget for taking language quizzes
/// Displays questions, handles answers, and tracks progress
class QuizDetailScreen extends StatefulWidget {
  final Quiz quiz;      // Quiz object containing metadata
  final String language; // Language being tested

  const QuizDetailScreen({
    super.key,
    required this.quiz,
    required this.language,
  });

  @override
  QuizDetailScreenState createState() => QuizDetailScreenState();
}

/// State class for QuizDetailScreen
/// Manages quiz progress, answers, and scoring
class QuizDetailScreenState extends State<QuizDetailScreen> {
  int currentQuestionIndex = 0;    // Current question being displayed (0-based)
  int? selectedAnswerIndex;        // Currently selected answer option
  List<int> userAnswers = [];      // List of user's answers for all questions
  bool quizCompleted = false;      // Whether the quiz has been completed
  int score = 0;                   // User's final score

  // Sample quiz questions organized by language and quiz title
  // Key format: "Language_QuizTitle"
  final Map<String, List<QuizQuestion>> quizQuestions = {
    'Hindi_Hindi Greetings Quiz': [
      QuizQuestion(
        question: 'What does "Namaste" mean in English?',
        options: ['Goodbye', 'Hello', 'Thank you', 'Please'],
        correctAnswer: 1,
        explanation:
            'Namaste is a common Hindi greeting meaning "Hello" or a respectful greeting.',
      ),
      QuizQuestion(
        question: 'How do you say "Thank you" in Hindi?',
        options: ['Namaste', 'Alvida', 'Dhanyawad', 'Kripaya'],
        correctAnswer: 2,
        explanation: 'Dhanyawad means "Thank you" in Hindi.',
      ),
      QuizQuestion(
        question: 'What is the Hindi word for "Goodbye"?',
        options: ['Namaste', 'Alvida', 'Dhanyawad', 'Maaf kijiye'],
        correctAnswer: 1,
        explanation: 'Alvida means "Goodbye" in Hindi.',
      ),
      QuizQuestion(
        question: 'How do you say "Please" in Hindi?',
        options: ['Kripaya', 'Dhanyawad', 'Namaste', 'Alvida'],
        correctAnswer: 0,
        explanation: 'Kripaya means "Please" in Hindi.',
      ),
      QuizQuestion(
        question: 'What does "Maaf kijiye" mean?',
        options: ['Hello', 'Thank you', 'Excuse me', 'Goodbye'],
        correctAnswer: 2,
        explanation: 'Maaf kijiye means "Excuse me" or "Sorry" in Hindi.',
      ),
    ],
    'Hindi_Numbers 1-10 Quiz': [
      QuizQuestion(
        question: 'What is "Five" in Hindi?',
        options: ['Char', 'Panch', 'Chhe', 'Teen'],
        correctAnswer: 1,
        explanation: 'Panch means "Five" in Hindi.',
      ),
      QuizQuestion(
        question: 'How do you say "One" in Hindi?',
        options: ['Ek', 'Do', 'Teen', 'Char'],
        correctAnswer: 0,
        explanation: 'Ek means "One" in Hindi.',
      ),
      QuizQuestion(
        question: 'What does "Das" mean in English?',
        options: ['Eight', 'Nine', 'Ten', 'Seven'],
        correctAnswer: 2,
        explanation: 'Das means "Ten" in Hindi.',
      ),
      QuizQuestion(
        question: 'How do you say "Three" in Hindi?',
        options: ['Do', 'Teen', 'Char', 'Panch'],
        correctAnswer: 1,
        explanation: 'Teen means "Three" in Hindi.',
      ),
      QuizQuestion(
        question: 'What is "Seven" in Hindi?',
        options: ['Chhe', 'Saat', 'Aath', 'Nau'],
        correctAnswer: 1,
        explanation: 'Saat means "Seven" in Hindi.',
      ),
    ],
    'Yoruba_Yoruba Greetings Quiz': [
      QuizQuestion(
        question: 'What does "Bawo" mean in English?',
        options: ['Goodbye', 'Hello', 'Thank you', 'Good morning'],
        correctAnswer: 1,
        explanation: 'Bawo means "Hello" in Yoruba.',
      ),
      QuizQuestion(
        question: 'How do you say "Good morning" in Yoruba?',
        options: ['Bawo', 'E ku aaro', 'E ku aale', 'E se'],
        correctAnswer: 1,
        explanation: 'E ku aaro means "Good morning" in Yoruba.',
      ),
      QuizQuestion(
        question: 'What does "E se" mean?',
        options: ['Hello', 'Goodbye', 'Thank you', 'Good evening'],
        correctAnswer: 2,
        explanation: 'E se means "Thank you" in Yoruba.',
      ),
      QuizQuestion(
        question: 'How do you say "Good evening" in Yoruba?',
        options: ['E ku aaro', 'E ku aale', 'Bawo', 'Ko to pe'],
        correctAnswer: 1,
        explanation: 'E ku aale means "Good evening" in Yoruba.',
      ),
      QuizQuestion(
        question: 'What does "Ko to pe" mean?',
        options: ['Hello', 'Thank you', 'You\'re welcome', 'Goodbye'],
        correctAnswer: 2,
        explanation: 'Ko to pe means "You\'re welcome" in Yoruba.',
      ),
    ],
  };

  @override
  void initState() {
    super.initState();
    userAnswers = List.filled(widget.quiz.questionCount, -1);
  }

  @override
  Widget build(BuildContext context) {
    final questionKey = '${widget.language}_${widget.quiz.title}';
    final questions = quizQuestions[questionKey] ?? [];

    if (questions.isEmpty) {
      return _buildNoQuestionsScreen();
    }

    if (quizCompleted) {
      return _buildResultsScreen();
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => _showExitConfirmation(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: (currentQuestionIndex + 1) / questions.length,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  '${currentQuestionIndex + 1}/${questions.length}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Question
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${currentQuestionIndex + 1}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      currentQuestion.question,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // Answer options
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedAnswerIndex == index;
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => setState(() => selectedAnswerIndex = index),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.orange
                                : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: isSelected
                              ? Colors.orange.shade50
                              : Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? Colors.orange
                                    : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: Text(
                                  String.fromCharCode(65 + index), // A, B, C, D
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                currentQuestion.options[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected
                                      ? Colors.orange.shade800
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Navigation buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: currentQuestionIndex > 0
                      ? () => _previousQuestion()
                      : null,
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: selectedAnswerIndex != null
                      ? () => _nextQuestion(questions)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    currentQuestionIndex < questions.length - 1
                        ? 'Next'
                        : 'Finish',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoQuestionsScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: Colors.orange),
            SizedBox(height: 16),
            Text(
              'Quiz questions are being prepared',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'This quiz will be available soon!',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsScreen() {
    final percentage = ((score / widget.quiz.questionCount) * 100).round();
    final passed = percentage >= 60;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 32),
            Icon(
              passed ? Icons.celebration : Icons.replay,
              size: 80,
              color: passed ? Colors.green : Colors.orange,
            ),
            SizedBox(height: 16),
            Text(
              passed ? 'Congratulations! 🎉' : 'Good effort! 💪',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              passed
                  ? 'You passed the quiz!'
                  : 'Keep practicing and try again!',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            SizedBox(height: 32),
            Card(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildResultStat(
                          'Score',
                          '$score/${widget.quiz.questionCount}',
                        ),
                        _buildResultStat('Percentage', '$percentage%'),
                        _buildResultStat('Time', widget.quiz.estimatedTime),
                      ],
                    ),
                    SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: percentage / 100,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        passed ? Colors.green : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            if (passed) ...[
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.emoji_events, color: Colors.green),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Badge earned: Quiz Master! 🏆',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
            Spacer(),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => _retakeQuiz(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 48),
                  ),
                  child: Text('Retake Quiz'),
                ),
                SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48),
                  ),
                  child: Text('Back to Quizzes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultStat(String label, String value) {
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
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        selectedAnswerIndex = userAnswers[currentQuestionIndex] != -1
            ? userAnswers[currentQuestionIndex]
            : null;
      });
    }
  }

  void _nextQuestion(List<QuizQuestion> questions) {
    if (selectedAnswerIndex != null) {
      userAnswers[currentQuestionIndex] = selectedAnswerIndex!;

      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswerIndex = userAnswers[currentQuestionIndex] != -1
              ? userAnswers[currentQuestionIndex]
              : null;
        });
      } else {
        _finishQuiz(questions);
      }
    }
  }

  void _finishQuiz(List<QuizQuestion> questions) {
    // Calculate score
    score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswer) {
        score++;
      }
    }

    setState(() {
      quizCompleted = true;
    });

    // Provide haptic feedback
    HapticFeedback.lightImpact();
  }

  void _retakeQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswerIndex = null;
      userAnswers = List.filled(widget.quiz.questionCount, -1);
      quizCompleted = false;
      score = 0;
    });
  }

  void _showExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit Quiz?'),
        content: Text(
          'Are you sure you want to exit? Your progress will be lost.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Exit quiz
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Exit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
