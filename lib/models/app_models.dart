// Data Models for the Learn Local App
class Lessons {
  final String title;
  final String description;
  final double progress;
  final bool isUnlocked;

  Lessons({
    required this.title,
    required this.description,
    required this.progress,
    this.isUnlocked = false,
  });
}

class Phrase {
  final String localletters;
  final String english;
  final String local;
  final String pronunciation;

  Phrase({
    required this.localletters,
    required this.english,
    required this.local,
    required this.pronunciation,
  });
}

class UserProfile {
  final String name;
  final int lessonsCompleted;
  final int currentStreak;
  final int totalPoints;
  final List<String> badges;

  UserProfile({
    required this.name,
    required this.lessonsCompleted,
    required this.currentStreak,
    required this.totalPoints,
    required this.badges,
  });
}

class Quiz {
  final String title;
  final String description;
  final int questionCount;
  final String estimatedTime;
  final String difficulty;
  final bool isUnlocked;
  final int bestScore;
  final int attempts;

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

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
}

class DownloadableLesson {
  final String id;
  final String title;
  final String language;
  final String description;
  final double fileSizeMB;
  final bool isDownloaded;
  final bool isDownloading;
  final double downloadProgress;

  DownloadableLesson({
    required this.id,
    required this.title,
    required this.language,
    required this.description,
    required this.fileSizeMB,
    this.isDownloaded = false,
    this.isDownloading = false,
    this.downloadProgress = 0.0,
  });

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
