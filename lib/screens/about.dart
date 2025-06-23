import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'LearnLocal v1.0\n\nDeveloped by Sandaruwan Samaraweera\nA language learning app for travelers in emerging markets.\n© 2025',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
