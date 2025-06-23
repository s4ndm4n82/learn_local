import 'package:flutter/material.dart';
import '../services/notification_service.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationService = NotificationService();
    notificationService.initialize();

    return Scaffold(
      appBar: AppBar(title: const Text('Learn Local'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              text: 'Start Learning',
              onPressed: () => Navigator.pushNamed(context, '/lessons'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Take a Quiz',
              onPressed: () => Navigator.pushNamed(context, '/quizzes'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'View Profile',
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Settings',
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Help',
              onPressed: () => Navigator.pushNamed(context, '/help'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'About',
              onPressed: () => Navigator.pushNamed(context, '/about'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Test Notification',
              onPressed: () => notificationService.showDailyReminder(),
            ),
          ],
        ),
      ),
    );
  }
}
