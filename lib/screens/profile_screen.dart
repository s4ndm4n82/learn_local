// Import Flutter material design components
import 'package:flutter/material.dart';
// Import app data models
import '../models/app_models.dart';

/// ProfileScreen widget displays user profile and learning statistics
/// Shows achievements, progress, goals, and analytics
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

/// State class for ProfileScreen
/// Manages user profile data, statistics, and achievements
class ProfileScreenState extends State<ProfileScreen> {
  // Sample user profile data - in a real app, this would come from a database
  UserProfile userProfile = UserProfile(
    name: 'Language Learner',
    lessonsCompleted: 8,
    currentStreak: 5,
    totalPoints: 420,
    badges: [
      '🎯 First Lesson',
      '🔥 5 Day Streak',
      '🗣️ Speech Practice',
      '📚 Quiz Master',
    ],
  );

  // Additional statistics
  final Map<String, dynamic> stats = {
    'totalStudyTime': '12h 30m',
    'favoriteLanguage': 'Hindi',
    'joinDate': 'January 2024',
    'lessonsThisWeek': 3,
    'quizzesCompleted': 4,
    'averageScore': 78,
  };

  // Achievement progress
  final List<Achievement> achievements = [
    Achievement('Dedicated Learner', 'Complete 10 lessons', 8, 10, '📚'),
    Achievement('Quiz Champion', 'Score 90%+ on 5 quizzes', 2, 5, '🏆'),
    Achievement('Streak Master', 'Maintain 7-day streak', 5, 7, '🔥'),
    Achievement('Polyglot', 'Learn 3 languages', 1, 3, '🌍'),
    Achievement('Early Bird', 'Complete 5 morning lessons', 3, 5, '🌅'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _showEditProfile(context),
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _shareProgress(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile header
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      userProfile.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Learning ${stats['favoriteLanguage']} since ${stats['joinDate']}',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${userProfile.totalPoints} XP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Statistics cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Lessons\nCompleted',
                    '${userProfile.lessonsCompleted}',
                    Icons.school,
                    Colors.blue,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Current\nStreak',
                    '${userProfile.currentStreak} days',
                    Icons.local_fire_department,
                    Colors.orange,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Study Time',
                    stats['totalStudyTime'],
                    Icons.access_time,
                    Colors.purple,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Avg Score',
                    '${stats['averageScore']}%',
                    Icons.star,
                    Colors.amber,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Weekly progress
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This Week\'s Progress',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildWeeklyProgressItem('Mon', true),
                        _buildWeeklyProgressItem('Tue', true),
                        _buildWeeklyProgressItem('Wed', true),
                        _buildWeeklyProgressItem('Thu', false),
                        _buildWeeklyProgressItem('Fri', false),
                        _buildWeeklyProgressItem('Sat', false),
                        _buildWeeklyProgressItem('Sun', false),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      '${stats['lessonsThisWeek']} lessons completed this week',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Badges section
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Badges Earned',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${userProfile.badges.length}/12',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: userProfile.badges
                          .map((badge) => _buildBadge(badge))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Achievements section
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Achievements',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    ...achievements.map(
                      (achievement) => _buildAchievementItem(achievement),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Learning goals
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Learning Goals',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildGoalItem(
                      'Daily Practice',
                      'Complete 1 lesson per day',
                      5,
                      7,
                    ),
                    SizedBox(height: 12),
                    _buildGoalItem(
                      'Weekly Quiz',
                      'Take 2 quizzes per week',
                      1,
                      2,
                    ),
                    SizedBox(height: 12),
                    _buildGoalItem('Vocabulary', 'Learn 50 new words', 32, 50),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _showLanguageStats(context),
                    icon: Icon(Icons.analytics),
                    label: Text('View Analytics'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _resetProgress(context),
                    icon: Icon(Icons.refresh),
                    label: Text('Reset Progress'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyProgressItem(String day, bool completed) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: completed ? Colors.green : Colors.grey.shade300,
          ),
          child: Icon(
            completed ? Icons.check : Icons.circle,
            color: completed ? Colors.white : Colors.grey.shade500,
            size: 18,
          ),
        ),
        SizedBox(height: 4),
        Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color: completed ? Colors.green : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(String badge) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Text(
        badge,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAchievementItem(Achievement achievement) {
    final progress = achievement.current / achievement.target;
    final isCompleted = achievement.current >= achievement.target;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted ? Colors.green.shade100 : Colors.grey.shade100,
            ),
            child: Center(
              child: Text(achievement.emoji, style: TextStyle(fontSize: 20)),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isCompleted ? Colors.green : Colors.black,
                  ),
                ),
                Text(
                  achievement.description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                SizedBox(height: 4),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isCompleted ? Colors.green : Colors.blue,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '${achievement.current}/${achievement.target}',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          if (isCompleted)
            Icon(Icons.check_circle, color: Colors.green, size: 20),
        ],
      ),
    );
  }

  Widget _buildGoalItem(
    String title,
    String description,
    int current,
    int target,
  ) {
    final progress = current / target;
    final isCompleted = current >= target;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              '$current/$target',
              style: TextStyle(
                color: isCompleted ? Colors.green : Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey.shade300,
          valueColor: AlwaysStoppedAnimation<Color>(
            isCompleted ? Colors.green : Colors.blue,
          ),
        ),
      ],
    );
  }

  void _showEditProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: userProfile.name,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Learning Goal',
                hintText: 'I want to learn Hindi for travel',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Profile updated!')));
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _shareProgress(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Share Progress'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Share your learning progress with friends!'),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'I\'ve completed ${userProfile.lessonsCompleted} lessons and earned ${userProfile.totalPoints} XP on LearnLocal! 🎉',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Progress shared!')));
            },
            child: Text('Share'),
          ),
        ],
      ),
    );
  }

  void _showLanguageStats(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Language Analytics'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Learning Statistics:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              _buildAnalyticItem(
                'Hindi',
                '8 lessons',
                '78% avg score',
                Colors.green,
              ),
              _buildAnalyticItem(
                'Yoruba',
                '2 lessons',
                '65% avg score',
                Colors.orange,
              ),
              _buildAnalyticItem(
                'Swahili',
                '1 lesson',
                '85% avg score',
                Colors.blue,
              ),
              SizedBox(height: 16),
              Text(
                'Most Active Time:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('7:00 PM - 8:00 PM'),
              SizedBox(height: 16),
              Text(
                'Favorite Lesson Type:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Greetings & Basic Phrases'),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticItem(
    String language,
    String lessons,
    String score,
    Color color,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          SizedBox(width: 8),
          Expanded(child: Text('$language: $lessons, $score')),
        ],
      ),
    );
  }

  void _resetProgress(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reset Progress?'),
        content: Text(
          'This will permanently delete all your progress, including lessons completed, scores, and badges. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Progress reset feature coming soon!'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Reset', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// Achievement data model
class Achievement {
  final String title;
  final String description;
  final int current;
  final int target;
  final String emoji;

  Achievement(
    this.title,
    this.description,
    this.current,
    this.target,
    this.emoji,
  );
}
