# Learn Local 🌍

A comprehensive Flutter mobile application designed to help users learn local languages through interactive lessons, practice exercises, and engaging quizzes. The app focuses on making language learning accessible and enjoyable with features like pronunciation practice, progress tracking, and offline capabilities.

## 📱 Features

### 🏠 **Home Dashboard**
- Language selection interface with support for 4 languages
- Quick access to recent lessons and progress overview
- Offline lesson download management with progress indicators
- Achievement tracking and daily streak monitoring

### 📚 **Interactive Lessons**
- **Supported Languages**: Hindi, Yoruba, Swahili, Bengali
- Native script display with romanized transliterations
- Audio pronunciation guides with playback controls
- Speech practice with pronunciation scoring (75-100% accuracy range)
- Progress tracking with visual indicators
- Lesson locking/unlocking system based on completion

### 🧠 **Comprehensive Quizzes**
- Multiple difficulty levels (Easy, Medium, Hard)
- Question count and estimated time indicators
- Performance tracking with best scores and attempt history
- Detailed explanations for correct answers
- Statistics dashboard for learning insights

### 👤 **User Profile & Progress**
- Personal learning statistics and achievements
- Lesson completion tracking
- Streak counters and point systems
- Badge collection system

### ⚙️ **Settings & Customization**
- Dark/Light theme toggle
- User preferences configuration
- Help documentation and support

### 📴 **Offline Capabilities**
- Download lessons for offline learning
- Progress synchronization when back online
- File size management and storage optimization

## 🏗️ **Architecture**

### **Navigation Structure**
- **7-Tab Bottom Navigation**: Home, Lessons, Quizzes, Profile, Settings, Help, About
- **StatefulWidget Pattern**: Local state management for individual screens
- **Theme Management**: Custom ThemeNotifier for dark/light mode switching

### **Data Models**
- `Lessons`: Title, description, progress tracking, unlock states
- `Phrase`: Multi-format phrase storage (native script, romanized, English, pronunciation)
- `UserProfile`: Statistics, achievements, streaks, and badges
- `Quiz`: Metadata, difficulty, performance tracking
- `QuizQuestion`: Multiple choice with explanations
- `DownloadableLesson`: Offline content with download states
- `Achievement`: Progress tracking with emoji representations

### **Screen Organization**
```
Main App → 7-Tab Navigation
├── HomeScreen: Dashboard + Quick Actions + Downloads
├── LessonsScreen: Language Selection → Lesson List → Interactive Detail
├── QuizzesScreen: Quiz Management → Performance Tracking
├── ProfileScreen: User Stats + Achievements (Coming Soon)
├── SettingsScreen: Theme Toggle + Preferences (Coming Soon)
├── HelpScreen: Documentation (Coming Soon)
└── AboutScreen: App Information (Coming Soon)
```

## 🚀 **Getting Started**

### **Prerequisites**
- Flutter SDK ^3.8.1
- Dart SDK
- Android Studio / VS Code
- Android emulator or physical device

### **Installation**
```bash
# Clone the repository
git clone [repository-url]
cd learn_local_s24013191_sandaruwan_samaraweera

# Install dependencies
flutter pub get

# Generate app icons and splash screens
flutter pub run flutter_launcher_icons:main
flutter pub run flutter_native_splash:create

# Run the application
flutter run
```

### **Development Commands**
```bash
# Run in development mode
flutter run

# Run tests
flutter test

# Analyze code quality
flutter analyze

# Clean build artifacts
flutter clean

# Build APK for Android
flutter build apk

# Build for iOS
flutter build ios
```

## 🎨 **Design System**

### **Color Scheme**
- **Primary**: Green (#4CAF50) - Learning and growth theme
- **Secondary**: Various green shades for consistency
- **Supports**: Both light and dark themes

### **Typography**
- **Font Family**: Roboto (system default)
- **Hierarchy**: Consistent text styles across all screens

### **Icons & Branding**
- Custom logo integration across all platforms
- Material Design icons throughout the interface
- Consistent visual language

## 🧪 **Current Implementation Status**

### **✅ Fully Implemented**
- Navigation structure with 7 tabs
- Home screen with language selection and offline downloads
- Lessons system with interactive learning and progress tracking
- Quiz system with comprehensive management and statistics
- Theme switching capabilities
- Data models and app architecture

### **🚧 In Development**
- Quiz detail screen implementation
- Enhanced user profile features
- Advanced settings options
- Help documentation system
- About page content

### **📋 Future Enhancements**
- Cloud synchronization
- Social features and leaderboards
- Advanced pronunciation analysis
- More language support
- Gamification elements

## 🛠️ **Technical Details**

### **Dependencies**
- `flutter`: Core framework
- `cupertino_icons`: iOS-style icons
- `flutter_lints`: Code quality analysis
- `flutter_launcher_icons`: App icon generation
- `flutter_native_splash`: Splash screen configuration

### **Testing**
- Widget tests available (needs updating for current functionality)
- Test files located in `test/` directory
- Run `flutter test` to execute all tests

## 📄 **License**

This project is developed as part of an educational assignment.

## 🤝 **Contributing**

This is a student project for language learning application development. The codebase demonstrates modern Flutter development practices and clean architecture principles.
