import 'package:flutter/material.dart';
import 'help_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        padding: EdgeInsetsGeometry.all(16.0),
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
                  'Contiue Learning',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Resume your Hindi lessons'),
                onTap: () {
                  // TODO: Navigate to last lesson
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Continue Learning - Coming Soon!')),
                  );
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lessons - Coming Soon!')),
                  );
                }),
                _buildQuickActon(context, Icons.mic, 'Practice', () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Practice - Coming Soon!')),
                  );
                }),
                _buildQuickActon(context, Icons.quiz, 'Quizzes', () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Quizzes - Coming Soon!')),
                  );
                }),
                _buildQuickActon(context, Icons.download, 'Offline', () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Offline Mode - Coming Soon!')),
                  );
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
