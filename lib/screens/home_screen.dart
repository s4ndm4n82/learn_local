// Import Flutter material design components
import 'package:flutter/material.dart';
// Import async utilities for timers (used in download simulation)
import 'dart:async';
// Import screen widgets for navigation
import 'help_screen.dart';
import 'about_screen.dart';
// Import app data models
import '../models/app_models.dart';

/// HomeScreen widget - the main dashboard of the Learn Local app
/// Displays welcome message, quick actions, and offline download functionality
class HomeScreen extends StatefulWidget {
  // Callback function to navigate to different tabs in main screen
  final Function(int)? onNavigateToTab;
  
  // Constructor with optional navigation callback
  const HomeScreen({super.key, this.onNavigateToTab});

  @override
  // Create state for this stateful widget
  State<HomeScreen> createState() => _HomeScreenState();
}

/// State class for HomeScreen
/// Manages downloadable lessons and handles offline functionality
class _HomeScreenState extends State<HomeScreen> {
  // List of lessons available for offline download
  // This simulates lessons that can be downloaded for offline learning
  final List<DownloadableLesson> _downloadableLessons = [
    // Hindi language lessons
    DownloadableLesson(
      id: 'hindi_basics',              // Unique identifier
      title: 'Hindi Basics',           // Lesson title
      language: 'Hindi',               // Target language
      description: 'Basic greetings and common phrases', // What the lesson covers
      fileSizeMB: 25.3,               // File size for download progress
    ),
    DownloadableLesson(
      id: 'hindi_numbers',
      title: 'Hindi Numbers',
      language: 'Hindi',
      description: 'Learn to count from 1 to 100',
      fileSizeMB: 18.7,
    ),
    // Yoruba language lessons
    DownloadableLesson(
      id: 'yoruba_greetings',
      title: 'Yoruba Greetings',
      language: 'Yoruba',
      description: 'Traditional Yoruba greetings',
      fileSizeMB: 32.1,
    ),
    // Swahili language lessons
    DownloadableLesson(
      id: 'swahili_basics',
      title: 'Swahili Basics',
      language: 'Swahili',
      description: 'Essential Swahili phrases',
      fileSizeMB: 28.9,
    ),
    // Bengali language lessons
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
    // Scaffold provides the basic material design visual layout structure
    return Scaffold(
      // App bar with title and action buttons
      appBar: AppBar(
        title: Text('Learn Local'),  // App title in the top bar
        backgroundColor: Colors.green, // Green theme color
        actions: [
          // Help button - navigates to help screen
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpScreen()),
            ),
          ),
          // Info/About button - navigates to about screen
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            ),
          ),
        ],
      ),
      // Main body content with padding
      body: Padding(
        padding: EdgeInsets.all(16.0), // 16px padding on all sides
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to start (left)
          children: [
            // Welcome title using theme's headline style
            Text(
              'Welcome to Learn Local',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16.0), // Vertical spacing
            
            // App description text
            Text(
              'Learn local languages with interactive lessons, practice pronunciation, and track your progress.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0), // More vertical spacing
            
            // "Continue Learning" card - main call-to-action
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.play_circle_fill,  // Play icon
                  color: Colors.green,     // Green theme color
                  size: 40.0,             // Large icon
                ),
                title: Text(
                  'Continue Learning',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Resume your Hindi lessons'), // Suggests current progress
                onTap: () {
                  // Navigate to Lessons tab (index 1) when tapped
                  widget.onNavigateToTab?.call(1);
                },
              ),
            ),
            SizedBox(height: 16.0),
            
            // Quick Links section title
            Text(
              'Quick Links',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            
            // Row of quick action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
              children: [
                // Lessons quick action - navigates to lessons tab
                _buildQuickActon(context, Icons.school, 'Lessons', () {
                  widget.onNavigateToTab?.call(1); // Navigate to Lessons tab (index 1)
                }),
                // Practice quick action - also goes to lessons for practice
                _buildQuickActon(context, Icons.mic, 'Practice', () {
                  widget.onNavigateToTab?.call(1); // Navigate to Lessons tab for practice
                }),
                // Quizzes quick action - navigates to quiz tab
                _buildQuickActon(context, Icons.quiz, 'Quizzes', () {
                  widget.onNavigateToTab?.call(2); // Navigate to Quizzes tab (index 2)
                }),
                // Offline download quick action - opens download dialog
                _buildQuickActon(context, Icons.download, 'Offline', () {
                  _showDownloadDialog(context); // Show offline download dialog
                }),
              ],
            ),
            SizedBox(height: 24.0),
            
            // Offline mode information banner
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade50,      // Light green background
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: Row(
                children: [
                  // Offline icon
                  Icon(Icons.offline_bolt, color: Colors.greenAccent),
                  SizedBox(width: 12.0),
                  // Information text about offline capability
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

  /// Shows a dialog for downloading lessons for offline use
  /// Uses StatefulBuilder to update download progress in real-time
  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // StatefulBuilder allows the dialog to update its state
        // This is needed to show download progress in real-time
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              // Dialog title with download icon
              title: Row(
                children: [
                  Icon(Icons.download, color: Colors.green), // Download icon
                  SizedBox(width: 8),
                  Text('Download Lessons'), // Dialog title
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

  /// Builds the appropriate download button based on lesson state
  /// @param lesson: The lesson to create a button for
  /// @param index: Index of the lesson in the list
  /// @param setState: Function to update dialog state
  Widget _buildDownloadButton(DownloadableLesson lesson, int index, StateSetter setState) {
    // If lesson is already downloaded, show check mark
    if (lesson.isDownloaded) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 16), // Success icon
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
    } 
    // If lesson is currently downloading, show progress indicator
    else if (lesson.isDownloading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2, // Thin progress ring
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green), // Green color
        ),
      );
    } 
    // If lesson is not downloaded, show download button
    else {
      return ElevatedButton(
        onPressed: () => _downloadLesson(index, setState), // Start download
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,  // Green button
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Compact padding
          minimumSize: Size(0, 28),      // Minimum button height
        ),
        child: Text(
          'Download',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      );
    }
  }

  /// Simulates downloading a lesson with progress updates
  /// @param index: Index of the lesson to download
  /// @param setState: Function to update dialog state
  void _downloadLesson(int index, StateSetter setState) {
    final lesson = _downloadableLessons[index];
    
    // Set lesson state to downloading
    setState(() {
      _downloadableLessons[index] = lesson.copyWith(isDownloading: true);
    });

    // Create a timer that updates progress every 100ms (simulates download)
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        final currentLesson = _downloadableLessons[index];
        // Increase progress by 2% each update (50 updates = 100%)
        final newProgress = currentLesson.downloadProgress + 0.02;
        
        // If download is complete (100%)
        if (newProgress >= 1.0) {
          // Mark lesson as downloaded and stop downloading
          _downloadableLessons[index] = currentLesson.copyWith(
            isDownloading: false,    // Stop downloading animation
            isDownloaded: true,      // Mark as complete
            downloadProgress: 1.0,   // Set to 100%
          );
          timer.cancel(); // Stop the timer
          
          // Show success message to user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white), // Success icon
                  SizedBox(width: 8),
                  Expanded(
                    child: Text('${lesson.title} downloaded successfully!'),
                  ),
                ],
              ),
              backgroundColor: Colors.green,      // Green success color
              duration: Duration(seconds: 3),     // Show for 3 seconds
            ),
          );
        } else {
          // Update progress (not yet complete)
          _downloadableLessons[index] = currentLesson.copyWith(
            downloadProgress: newProgress,
          );
        }
      });
    });
  }

  /// Downloads all lessons that are not yet downloaded
  /// Staggers downloads with 500ms delay between each to avoid overwhelming
  /// @param setState: Function to update dialog state
  void _downloadAll(StateSetter setState) {
    // Loop through all lessons
    for (int i = 0; i < _downloadableLessons.length; i++) {
      // Only download if lesson is not downloaded and not currently downloading
      if (!_downloadableLessons[i].isDownloaded && !_downloadableLessons[i].isDownloading) {
        // Stagger downloads with 500ms delay between each
        // This makes the UI more responsive and realistic
        Future.delayed(Duration(milliseconds: i * 500), () {
          _downloadLesson(i, setState);
        });
      }
    }
  }

  /// Calculates total file size of lessons not yet downloaded
  /// Used to show total download size to user
  /// @return: Total size in MB of undownloaded lessons
  double _getTotalSize() {
    return _downloadableLessons
        .where((lesson) => !lesson.isDownloaded)      // Filter undownloaded lessons
        .fold(0.0, (sum, lesson) => sum + lesson.fileSizeMB); // Sum up file sizes
  }

  /// Counts how many lessons are not yet downloaded
  /// Used to determine if "Download All" button should be enabled
  /// @return: Number of lessons not downloaded
  int _getDownloadedCount() {
    return _downloadableLessons.where((lesson) => !lesson.isDownloaded).length;
  }
}

/// Builds a quick action button widget
/// Creates a tappable button with icon and label for quick navigation
/// @param context: Build context for the widget
/// @param icon: Icon to display in the button
/// @param label: Text label below the icon
/// @param onTap: Callback function when button is tapped
/// @return: Widget representing a quick action button
Widget _buildQuickActon(
  BuildContext context,
  IconData icon,
  String label,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap, // Handle tap events
    child: Column(
      children: [
        // Icon container with rounded background
        Container(
          padding: EdgeInsets.all(16.0),        // Padding around icon
          decoration: BoxDecoration(
            color: Colors.green.shade100,        // Light green background
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          child: Icon(icon, size: 30, color: Colors.green), // Green icon
        ),
        SizedBox(height: 8.0), // Space between icon and label
        // Label text below icon
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    ),
  );
}
