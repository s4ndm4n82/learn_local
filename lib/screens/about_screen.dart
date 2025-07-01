// Import Flutter material design components
import 'package:flutter/material.dart';

/// AboutScreen widget displays app information and features
/// Shows app version, description, feature list, and copyright information
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About'), backgroundColor: Colors.green),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32.0),
            Image.asset(
              'assets/images/logo.png',
              width: 80,
              height: 80,
            ),
            SizedBox(height: 16.0),
            Text(
              'Learn Local',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24.0),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'LearnLocal is a vernacular language learning app designed for travelers and new residents in emerging markets. Learn essential phrases in local languages through interactive lessons, speech recognition, and gamified quizzes.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Features:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeatureItem('📚 Interactive language lessons'),
                _buildFeatureItem('🎤 Speech recognition practice'),
                _buildFeatureItem('🎮 Gamified learning with badges'),
                _buildFeatureItem('📱 Offline mode support'),
                _buildFeatureItem('♿ Accessibility features'),
                _buildFeatureItem('🌍 Multiple local languages'),
              ],
            ),
            Spacer(),
            Text(
              '© 2024 LearnLocal. Made for emerging markets.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper function to build feature list items
/// @param text: Feature description with emoji icon
/// @return: Widget with consistent styling for feature items
Widget _buildFeatureItem(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0), // Spacing between items
    child: Text(text, style: TextStyle(fontSize: 16.0)),
  );
}
