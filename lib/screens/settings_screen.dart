// Import Flutter material design components
import 'package:flutter/material.dart';
// Import ThemeNotifier from main.dart for dark mode functionality
import '../main.dart';

/// SettingsScreen widget displays app configuration options
/// Includes preferences for learning, audio, notifications, appearance, and data
class SettingsScreen extends StatefulWidget {
  final ThemeNotifier themeNotifier; // Theme notifier for dark mode toggle
  
  const SettingsScreen({super.key, required this.themeNotifier});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

/// State class for SettingsScreen
/// Manages all app settings and user preferences
class SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  bool _autoDownloadEnabled = false;
  bool _offlineModeEnabled = true;
  String _selectedLanguage = 'English';
  String _dailyGoal = '15 minutes';
  String _reminderTime = '7:00 PM';
  double _speechVolume = 0.8;
  double _pronunciationSensitivity = 0.7;

  final List<String> _languages = [
    'English',
    'Hindi',
    'Yoruba',
    'Swahili',
    'Bengali',
  ];
  final List<String> _dailyGoals = [
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '30 minutes',
    '45 minutes',
    '1 hour',
  ];
  final List<String> _reminderTimes = [
    '6:00 AM',
    '8:00 AM',
    '12:00 PM',
    '6:00 PM',
    '7:00 PM',
    '8:00 PM',
    '9:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('Learning Preferences'),
          _buildDropdownSetting(
            'App Language',
            _selectedLanguage,
            _languages,
            Icons.language,
            (value) => setState(() => _selectedLanguage = value!),
          ),
          _buildDropdownSetting(
            'Daily Goal',
            _dailyGoal,
            _dailyGoals,
            Icons.flag,
            (value) => setState(() => _dailyGoal = value!),
          ),
          _buildDropdownSetting(
            'Daily Reminder',
            _reminderTime,
            _reminderTimes,
            Icons.notifications_active,
            (value) => setState(() => _reminderTime = value!),
          ),

          SizedBox(height: 24.0),
          _buildSectionHeader('Audio & Speech'),
          _buildSliderSetting(
            'Speech Volume',
            _speechVolume,
            Icons.volume_up,
            (value) => setState(() => _speechVolume = value),
          ),
          _buildSliderSetting(
            'Pronunciation Sensitivity',
            _pronunciationSensitivity,
            Icons.mic,
            (value) => setState(() => _pronunciationSensitivity = value),
          ),
          _buildSwitchSetting(
            'Sound Effects',
            'Play sounds for correct/incorrect answers',
            _soundEnabled,
            Icons.volume_up,
            (value) => setState(() => _soundEnabled = value),
          ),

          SizedBox(height: 24.0),
          _buildSectionHeader('Notifications'),
          _buildSwitchSetting(
            'Push Notifications',
            'Receive daily reminders and progress updates',
            _notificationsEnabled,
            Icons.notifications,
            (value) => setState(() => _notificationsEnabled = value),
          ),
          _buildSwitchSetting(
            'Vibration',
            'Enable vibration for notifications',
            _vibrationEnabled,
            Icons.vibration,
            (value) => setState(() => _vibrationEnabled = value),
          ),

          SizedBox(height: 24.0),
          _buildSectionHeader('Data & Storage'),
          _buildSwitchSetting(
            'Auto-Download Lessons',
            'Automatically download new lessons when available',
            _autoDownloadEnabled,
            Icons.download,
            (value) => setState(() => _autoDownloadEnabled = value),
          ),
          _buildSwitchSetting(
            'Offline Mode',
            'Enable learning without internet connection',
            _offlineModeEnabled,
            Icons.offline_bolt,
            (value) => setState(() => _offlineModeEnabled = value),
          ),
          _buildActionTile(
            'Clear Downloaded Data',
            'Free up storage space by removing downloaded lessons',
            Icons.delete_outline,
            Colors.orange,
            () => _showClearDataDialog(),
          ),

          SizedBox(height: 24.0),
          _buildSectionHeader('Appearance'),
          _buildSwitchSetting(
            'Dark Mode',
            'Use dark theme throughout the app',
            widget.themeNotifier.isDarkMode,
            Icons.dark_mode,
            (value) => widget.themeNotifier.setDarkMode(value),
          ),

          SizedBox(height: 24.0),
          _buildSectionHeader('Account & Data'),
          _buildActionTile(
            'Export Progress',
            'Export your learning progress and statistics',
            Icons.file_download,
            Colors.blue,
            () => _showExportDialog(),
          ),
          _buildActionTile(
            'Reset Progress',
            'Reset all learning progress and start over',
            Icons.refresh,
            Colors.red,
            () => _showResetDialog(),
          ),

          SizedBox(height: 24.0),
          _buildSectionHeader('Support'),
          _buildActionTile(
            'Rate App',
            'Rate Learn Local on your app store',
            Icons.star,
            Colors.amber,
            () => _showRatingDialog(),
          ),
          _buildActionTile(
            'Send Feedback',
            'Share your thoughts and suggestions',
            Icons.feedback,
            Colors.green,
            () => _showFeedbackDialog(),
          ),
          _buildActionTile(
            'Privacy Policy',
            'Read our privacy policy and terms',
            Icons.privacy_tip,
            Colors.grey,
            () => _showPrivacyDialog(),
          ),

          SizedBox(height: 32.0),
          Center(
            child: Text(
              'Learn Local v1.0.0',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade700,
        ),
      ),
    );
  }

  Widget _buildSwitchSetting(
    String title,
    String subtitle,
    bool value,
    IconData icon,
    Function(bool) onChanged,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12.0)),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
      ),
    );
  }

  Widget _buildDropdownSetting(
    String title,
    String value,
    List<String> options,
    IconData icon,
    Function(String?) onChanged,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        trailing: DropdownButton<String>(
          value: value,
          underline: SizedBox(),
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option, style: TextStyle(fontSize: 14.0)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildSliderSetting(
    String title,
    double value,
    IconData icon,
    Function(double) onChanged,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.green),
                SizedBox(width: 12.0),
                Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
                Spacer(),
                Text(
                  '${(value * 100).round()}%',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Slider(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.green,
              inactiveColor: Colors.green.shade100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12.0)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showClearDataDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 8),
            Text('Clear Downloaded Data'),
          ],
        ),
        content: Text(
          'This will remove all downloaded lessons and free up storage space. You can re-download them later.',
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
                  content: Text('Downloaded data cleared successfully'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text('Clear Data', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.file_download, color: Colors.blue),
            SizedBox(width: 8),
            Text('Export Progress'),
          ],
        ),
        content: Text(
          'Your learning progress will be exported as a PDF file. This includes your lesson completions, quiz scores, and achievements.',
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
                  content: Text('Progress exported successfully'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text('Export', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning, color: Colors.red),
            SizedBox(width: 8),
            Text('Reset Progress'),
          ],
        ),
        content: Text(
          'This will permanently reset all your learning progress, including completed lessons, quiz scores, and achievements. This action cannot be undone.',
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
                  content: Text('All progress has been reset'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Reset All', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 8),
            Text('Rate Learn Local'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enjoying Learn Local? Rate us on your app store!'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(Icons.star, color: Colors.amber, size: 32),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Maybe Later'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Thanks for your feedback!')),
              );
            },
            child: Text('Rate Now'),
          ),
        ],
      ),
    );
  }

  void _showFeedbackDialog() {
    final TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.feedback, color: Colors.green),
            SizedBox(width: 8),
            Text('Send Feedback'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('We\'d love to hear your thoughts and suggestions!'),
            SizedBox(height: 16),
            TextField(
              controller: feedbackController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here...',
                border: OutlineInputBorder(),
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Feedback sent successfully! Thank you.'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.privacy_tip, color: Colors.grey),
            SizedBox(width: 8),
            Text('Privacy Policy'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Learn Local Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                'We respect your privacy and are committed to protecting your personal data.',
              ),
              SizedBox(height: 8),
              Text('• We only collect data necessary for app functionality'),
              Text('• Your learning progress is stored locally on your device'),
              Text(
                '• We do not share your personal information with third parties',
              ),
              Text('• Audio recordings are processed locally and not stored'),
              SizedBox(height: 12),
              Text(
                'For the complete privacy policy, visit our website.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
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
}
