/// Data Models for the Learn Local App
/// These classes define the structure of data used throughout the application

/// Lessons model represents a language learning lesson
/// Contains information about lesson content and user progress
class Lessons {
  final String title;        // Title of the lesson (e.g., "Basic Greetings")
  final String description;  // Description of what the lesson covers
  final double progress;     // Progress completion (0.0 to 1.0, where 1.0 = 100%)
  final bool isUnlocked;     // Whether the lesson is available to the user

  /// Constructor for creating a Lessons object
  /// All fields are required except isUnlocked which defaults to false
  Lessons({
    required this.title,
    required this.description,
    required this.progress,
    this.isUnlocked = false,  // Default to locked lesson
  });
}

/// Phrase model represents a single phrase/sentence in a lesson
/// Contains the phrase in different formats for learning
class Phrase {
  final String localletters;  // Phrase in native script (e.g., देवनागरी for Hindi)
  final String english;       // English translation of the phrase
  final String local;         // Romanized/transliterated version (easier to read)
  final String pronunciation; // Phonetic pronunciation guide

  /// Constructor for creating a Phrase object
  /// All fields are required to provide complete phrase information
  Phrase({
    required this.localletters,
    required this.english,
    required this.local,
    required this.pronunciation,
  });
}

/// UserProfile model represents a user's learning profile and statistics
/// Tracks progress, achievements, and personal information
class UserProfile {
  final String name;              // User's display name
  final int lessonsCompleted;     // Total number of lessons completed
  final int currentStreak;        // Current consecutive days of learning
  final int totalPoints;          // Total points earned from lessons and quizzes
  final List<String> badges;      // List of achievement badges earned

  /// Constructor for creating a UserProfile object
  /// All fields are required to maintain complete user statistics
  UserProfile({
    required this.name,
    required this.lessonsCompleted,
    required this.currentStreak,
    required this.totalPoints,
    required this.badges,
  });
}

/// Quiz model represents a language quiz with metadata
/// Contains quiz information, difficulty, and user performance data
class Quiz {
  final String title;          // Quiz title (e.g., "Basic Vocabulary Test")
  final String description;    // Description of quiz content
  final int questionCount;     // Number of questions in the quiz
  final String estimatedTime;  // Estimated time to complete (e.g., "5 minutes")
  final String difficulty;     // Difficulty level (Easy, Medium, Hard)
  final bool isUnlocked;       // Whether quiz is available to the user
  final int bestScore;         // User's highest score on this quiz (0-100)
  final int attempts;          // Number of times user has attempted this quiz

  /// Constructor for creating a Quiz object
  /// All fields are required to provide complete quiz information
  Quiz({
    required this.title,
    required this.description,
    required this.questionCount,
    required this.estimatedTime,
    required this.difficulty,
    required this.isUnlocked,
    required this.bestScore,
    required this.attempts,
  });
}

/// QuizQuestion model represents a single question within a quiz
/// Contains question text, multiple choice options, and correct answer
class QuizQuestion {
  final String question;        // The question text
  final List<String> options;   // List of answer choices (usually 4 options)
  final int correctAnswer;      // Index of correct answer in options list (0-based)
  final String explanation;     // Explanation of why the answer is correct

  /// Constructor for creating a QuizQuestion object
  /// All fields are required for a complete quiz question
  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
}

/// DownloadableLesson model represents a lesson that can be downloaded for offline use
/// Manages download state, progress, and lesson metadata
class DownloadableLesson {
  final String id;                    // Unique identifier for the lesson
  final String title;                 // Lesson title
  final String language;              // Language this lesson teaches
  final String description;           // Brief description of lesson content
  final double fileSizeMB;            // File size in megabytes
  final bool isDownloaded;            // Whether lesson is fully downloaded
  final bool isDownloading;           // Whether lesson is currently being downloaded
  final double downloadProgress;      // Download progress (0.0 to 1.0)

  /// Constructor for creating a DownloadableLesson object
  /// Required fields: id, title, language, description, fileSizeMB
  /// Optional fields have default values for initial state
  DownloadableLesson({
    required this.id,
    required this.title,
    required this.language,
    required this.description,
    required this.fileSizeMB,
    this.isDownloaded = false,      // Default: not downloaded
    this.isDownloading = false,     // Default: not downloading
    this.downloadProgress = 0.0,    // Default: no progress
  });

  /// Creates a copy of this lesson with updated fields
  /// Used to update download state without modifying the original object
  /// Only provided parameters are updated, others remain the same
  DownloadableLesson copyWith({
    String? id,
    String? title,
    String? language,
    String? description,
    double? fileSizeMB,
    bool? isDownloaded,
    bool? isDownloading,
    double? downloadProgress,
  }) {
    return DownloadableLesson(
      // Use provided value or keep current value (null-aware operator ??)
      id: id ?? this.id,
      title: title ?? this.title,
      language: language ?? this.language,
      description: description ?? this.description,
      fileSizeMB: fileSizeMB ?? this.fileSizeMB,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      isDownloading: isDownloading ?? this.isDownloading,
      downloadProgress: downloadProgress ?? this.downloadProgress,
    );
  }
}

/// Achievement model represents a user achievement or milestone
/// Tracks progress towards specific learning goals with visual representation
class Achievement {
  final String title;        // Achievement title (e.g., "First Steps")
  final String description;  // Description of what needs to be accomplished
  final int current;         // Current progress towards achievement
  final int target;          // Target value needed to unlock achievement
  final String emoji;        // Emoji icon representing the achievement

  /// Constructor for creating an Achievement object
  /// All fields are required to properly display achievement progress
  Achievement({
    required this.title,
    required this.description,
    required this.current,
    required this.target,
    required this.emoji,
  });
}
