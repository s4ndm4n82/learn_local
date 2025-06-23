import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/theme_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ThemeModel>(
          builder: (context, themeModel, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Accessibility',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SwitchListTile(
                  title: const Text('High Contrast Mode'),
                  value: themeModel.isHighContrast,
                  onChanged: (value) => themeModel.toggleHighContrast(),
                ),
                const SizedBox(height: 16.0),
                const Text('Font Size'),
                Slider(
                  value: themeModel.fontSize,
                  min: 12.0,
                  max: 24.0,
                  divisions: 6,
                  label: themeModel.fontSize.round().toString(),
                  onChanged: (value) => themeModel.setFontSize(value),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
