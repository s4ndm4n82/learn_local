// Import Flutter's material design package for UI components
import 'package:flutter/material.dart';
// Import all screen widgets used in the app
import 'screens/home_screen.dart';
import 'screens/lessons_screen.dart';
import 'screens/quizzes_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';
import 'screens/about_screen.dart';

/// Entry point of the Flutter application
/// This function is called when the app starts
void main() {
  // runApp() takes the root widget and makes it the root of the widget tree
  runApp(LearnLocal());
}

/// ThemeNotifier class manages the app's theme state (light/dark mode)
/// Extends ChangeNotifier to notify listeners when theme changes
class ThemeNotifier extends ChangeNotifier {
  // Private boolean to track if dark mode is enabled
  bool _isDarkMode = false;

  /// Getter to access the current theme mode state
  /// Returns true if dark mode is enabled, false for light mode
  bool get isDarkMode => _isDarkMode;

  /// Method to toggle between light and dark themes
  /// Changes the current theme and notifies all listeners
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    // Notify all widgets listening to this notifier that the state has changed
    notifyListeners();
  }

  /// Method to explicitly set the theme mode
  /// @param value: true for dark mode, false for light mode
  void setDarkMode(bool value) {
    _isDarkMode = value;
    // Notify all widgets listening to this notifier that the state has changed
    notifyListeners();
  }
}

/// LearnLocal is the root widget of the app
/// StatefulWidget because it needs to manage theme state changes
class LearnLocal extends StatefulWidget {
  // Constructor with optional key parameter for widget identification
  const LearnLocal({super.key});

  @override
  // Create the state object for this widget
  LearnLocalState createState() => LearnLocalState();
}

/// State class for LearnLocal widget
/// Manages the overall app configuration and theme
class LearnLocalState extends State<LearnLocal> {
  // Create a single instance of ThemeNotifier to manage theme throughout the app
  final ThemeNotifier _themeNotifier = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder rebuilds the widget tree when _themeNotifier changes
    // This ensures the app theme updates immediately when user toggles dark mode
    return AnimatedBuilder(
      animation: _themeNotifier, // Listen to theme changes
      builder: (context, child) {
        // MaterialApp is the top-level widget that provides Material Design
        return MaterialApp(
          title: "Learn Local", // App title shown in task switcher
          
          // Light theme configuration
          theme: ThemeData(
            primarySwatch: Colors.green, // Main color scheme (green variants)
            fontFamily: 'Roboto', // Default font family
            brightness: Brightness.light, // Light theme brightness
            // Define text styles for different text elements
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 16), // Large body text
              bodyMedium: TextStyle(fontSize: 14), // Medium body text
              headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Headlines
            ),
          ),
          
          // Dark theme configuration (used when dark mode is enabled)
          darkTheme: ThemeData(
            primarySwatch: Colors.green, // Keep green color scheme in dark mode
            fontFamily: 'Roboto', // Same font family
            brightness: Brightness.dark, // Dark theme brightness
            // Same text styles but adapted for dark theme
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 16),
              bodyMedium: TextStyle(fontSize: 14),
              headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          
          // Determine which theme to use based on ThemeNotifier state
          themeMode: _themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          
          // Set the home screen and pass theme notifier for settings access
          home: MainScreen(themeNotifier: _themeNotifier),
          
          // Hide the debug banner in top-right corner
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

/// MainScreen widget that provides the main navigation structure
/// Contains bottom navigation bar and manages which screen to display
class MainScreen extends StatefulWidget {
  // ThemeNotifier passed from parent to enable theme switching in settings
  final ThemeNotifier themeNotifier;
  
  // Constructor requires themeNotifier to be passed
  const MainScreen({super.key, required this.themeNotifier});

  @override
  // Create state for this stateful widget
  MainScreenState createState() => MainScreenState();
}

/// State class for MainScreen
/// Manages the current selected tab and navigation between screens
class MainScreenState extends State<MainScreen> {
  // Index of currently selected tab (0 = Home, 1 = Lessons, etc.)
  int _selectedIndex = 0;

  /// Method to programmatically navigate to a specific tab
  /// Used by HomeScreen to navigate to other tabs
  /// @param index: The tab index to navigate to
  void _navigateToTab(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index and rebuild UI
    });
  }

  /// Getter that returns list of all screen widgets
  /// Each screen corresponds to a tab in the bottom navigation
  List<Widget> get _screens => [
    // Index 0: Home screen with navigation callback
    HomeScreen(onNavigateToTab: _navigateToTab),
    // Index 1: Lessons screen
    LessonsScreen(),
    // Index 2: Quizzes screen
    QuizzesScreen(),
    // Index 3: Profile screen
    ProfileScreen(),
    // Index 4: Settings screen with theme notifier for dark mode toggle
    SettingsScreen(themeNotifier: widget.themeNotifier),
    // Index 5: Help screen
    HelpScreen(),
    // Index 6: About screen
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic material design visual layout structure
    return Scaffold(
      // Display the screen corresponding to the selected tab
      body: _screens[_selectedIndex],
      
      // Bottom navigation bar with 7 tabs
      bottomNavigationBar: BottomNavigationBar(
        // Fixed type allows more than 3 tabs and keeps all visible
        type: BottomNavigationBarType.fixed,
        // Currently selected tab index
        currentIndex: _selectedIndex,
        // Callback when user taps a tab
        onTap: (index) => setState(() {
          _selectedIndex = index; // Update selected tab and rebuild
        }),
        // Styling for the bottom navigation bar
        backgroundColor: Colors.white, // Background color
        selectedItemColor: Colors.green, // Color for selected tab
        unselectedItemColor: Colors.grey, // Color for unselected tabs
        
        // Define all navigation tabs
        items: [
          // Home tab
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // Lessons tab
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Lessons'),
          // Quizzes tab
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quizzes'),
          // Profile tab
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          // Settings tab
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          // Help tab
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
          // About tab
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
