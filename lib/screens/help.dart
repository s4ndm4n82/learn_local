import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help')),
      body: const Padding(
        padding: EdgeInsetsGeometry.all(16.0),
        child: Text(
          'LearnLocal Help\n\n1. Navigate using the Home screen buttons.\n2. Select lessons to learn phrases.\n3. Check progress in Profile.\n4. Contact support at help@learnlocal.com.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
