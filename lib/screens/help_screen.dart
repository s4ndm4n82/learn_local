import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help'), backgroundColor: Colors.green),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            child: ExpansionTile(
              title: Text('How to start learning?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Go to the Lessons tab, select your target language, and start with the first lesson. Each lesson contains phrases with audio pronunciation guides.',
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text('How does speech recognition work?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'During lessons, tap the microphone icon to practice pronunciation. The app will analyze your speech and provide a score to help you improve.',
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text('How to use offline mode?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Enable offline mode in Settings and download lessons. You can then access downloaded content without an internet connection.',
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text('Accessibility features'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'The app supports high contrast mode, adjustable font sizes, and voice navigation. Enable these features in Settings > Accessibility.',
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text('Troubleshooting'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'If you experience issues:\n'
                    '• Check your internet connection\n'
                    '• Restart the app\n'
                    '• Update to the latest version\n'
                    '• Contact support if problems persist',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
