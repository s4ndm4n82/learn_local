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
  final String english;
  final String local;
  final String pronunciation;

  Phrase({
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
