import 'package:flutter/material.dart';
import 'dart:async';
import 'help_screen.dart';
import 'about_screen.dart';
import '../models/app_models.dart';

class HomeScreen extends StatefulWidget {
  final Function(int)? onNavigateToTab;
  
  const HomeScreen({super.key, this.onNavigateToTab});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<DownloadableLesson> _downloadableLessons = [
    DownloadableLesson(
      id: 'hindi_basics',
      title: 'Hindi Basics',
      language: 'Hindi',
      description: 'Basic greetings and common phrases',
      fileSizeMB: 25.3,
    ),
    DownloadableLesson(
      id: 'hindi_numbers',
      title: 'Hindi Numbers',
      language: 'Hindi',
      description: 'Learn to count from 1 to 100',
      fileSizeMB: 18.7,
    ),
    DownloadableLesson(
      id: 'yoruba_greetings',
      title: 'Yoruba Greetings',
      language: 'Yoruba',
      description: 'Traditional Yoruba greetings',
      fileSizeMB: 32.1,
    ),
    DownloadableLesson(
      id: 'swahili_basics',
      title: 'Swahili Basics',
      language: 'Swahili',
      description: 'Essential Swahili phrases',
      fileSizeMB: 28.9,
    ),
    DownloadableLesson(
      id: 'bengali_alphabet',
      title: 'Bengali Alphabet',
      language: 'Bengali',
      description: 'Learn Bengali script and pronunciation',
      fileSizeMB: 41.2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Local'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpScreen()),
            ),
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Learn Local',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16.0),
            Text(
              'Learn local languages with interactive lessons, practice pronunciation, and track your progress.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.play_circle_fill,
                  color: Colors.green,
                  size: 40.0,
                ),
                title: Text(
                  'Continue Learning',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Resume your Hindi lessons'),
                onTap: () {
                  widget.onNavigateToTab?.call(1); // Navigate to Lessons tab to continue learning
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Quick Links',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickActon(context, Icons.school, 'Lessons', () {
                  widget.onNavigateToTab?.call(1); // Navigate to Lessons tab (index 1)
                }),
                _buildQuickActon(context, Icons.mic, 'Practice', () {
                  widget.onNavigateToTab?.call(1); // Navigate to Lessons tab for practice
                }),
                _buildQuickActon(context, Icons.quiz, 'Quizzes', () {
                  widget.onNavigateToTab?.call(2); // Navigate to Quizzes tab (index 2)
                }),
                _buildQuickActon(context, Icons.download, 'Offline', () {
                  _showDownloadDialog(context);
                }),
              ],
            ),
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.offline_bolt, color: Colors.greenAccent),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      'Offline Mode Available - Download lessons for learning without internet!',
                      style: TextStyle(color: Colors.green.shade800),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Row(
                children: [
                  Icon(Icons.download, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Download Lessons'),
                ],
              ),
              content: SizedBox(
                width: double.maxFinite,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Download lessons for offline learning',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _downloadableLessons.length,
                        itemBuilder: (context, index) {
                          final lesson = _downloadableLessons[index];
                          return Card(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              lesson.title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              lesson.language,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              lesson.description,
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${lesson.fileSizeMB.toStringAsFixed(1)} MB',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          _buildDownloadButton(lesson, index, setState),
                                        ],
                                      ),
                                    ],
                                  ),
                                  if (lesson.isDownloading) ...[
                                    SizedBox(height: 12),
                                    LinearProgressIndicator(
                                      value: lesson.downloadProgress,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Downloading... ${(lesson.downloadProgress * 100).toInt()}%',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: ${_getTotalSize().toStringAsFixed(1)} MB',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        TextButton(
                          onPressed: _getDownloadedCount() > 0
                              ? () => _downloadAll(setState)
                              : null,
                          child: Text('Download All'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildDownloadButton(DownloadableLesson lesson, int index, StateSetter setState) {
    if (lesson.isDownloaded) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 16),
          SizedBox(width: 4),
          Text(
            'Downloaded',
            style: TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    } else if (lesson.isDownloading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () => _downloadLesson(index, setState),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          minimumSize: Size(0, 28),
        ),
        child: Text(
          'Download',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      );
    }
  }

  void _downloadLesson(int index, StateSetter setState) {
    final lesson = _downloadableLessons[index];
    
    setState(() {
      _downloadableLessons[index] = lesson.copyWith(isDownloading: true);
    });

    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        final currentLesson = _downloadableLessons[index];
        final newProgress = currentLesson.downloadProgress + 0.02;
        
        if (newProgress >= 1.0) {
          _downloadableLessons[index] = currentLesson.copyWith(
            isDownloading: false,
            isDownloaded: true,
            downloadProgress: 1.0,
          );
          timer.cancel();
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text('${lesson.title} downloaded successfully!'),
                  ),
                ],
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          _downloadableLessons[index] = currentLesson.copyWith(
            downloadProgress: newProgress,
          );
        }
      });
    });
  }

  void _downloadAll(StateSetter setState) {
    for (int i = 0; i < _downloadableLessons.length; i++) {
      if (!_downloadableLessons[i].isDownloaded && !_downloadableLessons[i].isDownloading) {
        Future.delayed(Duration(milliseconds: i * 500), () {
          _downloadLesson(i, setState);
        });
      }
    }
  }

  double _getTotalSize() {
    return _downloadableLessons
        .where((lesson) => !lesson.isDownloaded)
        .fold(0.0, (sum, lesson) => sum + lesson.fileSizeMB);
  }

  int _getDownloadedCount() {
    return _downloadableLessons.where((lesson) => !lesson.isDownloaded).length;
  }
}

Widget _buildQuickActon(
  BuildContext context,
  IconData icon,
  String label,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Icon(icon, size: 30, color: Colors.green),
        ),
        SizedBox(height: 8.0),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    ),
  );
}
