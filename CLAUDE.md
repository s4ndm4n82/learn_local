# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter mobile application called "Learn Local" for learning local languages through interactive lessons, practice, and quizzes. The app is designed to help users learn languages with features like pronunciation practice, progress tracking, and offline capabilities.

## Development Commands

### Core Flutter Commands
- `flutter run` - Run the app in development mode
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build for iOS
- `flutter test` - Run unit and widget tests
- `flutter analyze` - Run static analysis and linting
- `flutter clean` - Clean build artifacts
- `flutter pub get` - Install dependencies
- `flutter pub upgrade` - Upgrade dependencies

### Testing
- `flutter test` - Run all tests
- `flutter test test/widget_test.dart` - Run specific test file
- Tests are located in the `test/` directory
- **Note**: Current widget test needs updating as it tests counter functionality that doesn't exist in the app

## Architecture

### App Structure
- **Main Entry**: `lib/main.dart` contains the app initialization and main navigation structure
- **Screen-Based Architecture**: Each major feature is organized as a separate screen in `lib/screens/`
- **Data Models**: Located in `lib/models/` with core data structures for lessons, phrases, and user profiles
- **Navigation**: Uses bottom navigation bar with 7 main sections (Home, Lessons, Quizzes, Profile, Settings, Help, About)

### Key Components
- **MainScreen**: Central navigation hub with BottomNavigationBar
- **Screens**: Individual feature screens (HomeScreen, LessonsScreen, etc.)
- **Models**: Data classes for Lessons, Phrase, UserProfile, Quiz, QuizQuestion, DownloadableLesson, and Achievement

### Current State
- App has basic navigation structure implemented
- Most features show "Coming Soon" placeholders except Home, Lessons, and Quizzes which have full implementations
- Lessons feature includes interactive lesson detail screens with simulated audio and speech practice
- Quizzes feature includes comprehensive quiz management with progress tracking
- Home screen includes offline lesson download functionality

### Theme & Design
- Primary color: Green (Colors.green)
- Font family: Roboto
- Material Design components
- Consistent green color scheme throughout

## Development Notes

### Dependencies
- Uses Flutter SDK ^3.8.1 (from pubspec.yaml)
- cupertino_icons: ^1.0.8 for iOS-style icons
- flutter_lints: ^5.0.0 for code analysis and linting
- No additional third-party packages currently integrated

### Current Implementation Status
- Navigation structure complete with 7-tab bottom navigation
- **Home Screen**: Dashboard with language selection, quick actions, and offline download management
- **Lessons Screen**: Language dropdown, lesson list with progress tracking, and interactive lesson details
- **Quizzes Screen**: Comprehensive quiz system with statistics and progress tracking
- **Other Screens**: Profile, Settings, Help, About screens show "Coming Soon" placeholders
- Data models defined in `lib/models/app_models.dart` with comprehensive class structure

### Code Structure Details
- **Models**: `lib/models/app_models.dart` contains seven main data classes:
  - `Lessons`: title, description, progress, isUnlocked
  - `Phrase`: localletters, english, local, pronunciation 
  - `UserProfile`: name, lessonsCompleted, currentStreak, totalPoints, badges
  - `Quiz`: title, description, questionCount, estimatedTime, difficulty, isUnlocked, bestScore, attempts
  - `QuizQuestion`: question, options, correctAnswer, explanation
  - `DownloadableLesson`: id, title, language, description, fileSizeMB, download states
  - `Achievement`: title, description, current, target, emoji
- **Navigation Pattern**: Uses StatefulWidget with index-based screen switching via `_selectedIndex`
- **Screen Organization**: 
  - `HomeScreen`: Dashboard with language selection, quick actions, and sophisticated offline download dialog
  - `LessonsScreen`: Language dropdown, lesson list with progress tracking and locked/unlocked states
  - `LessonDetailScreen`: Interactive phrase learning with simulated audio, speech practice, and pronunciation scoring
  - `QuizzesScreen`: Quiz management with statistics, difficulty indicators, and attempt tracking
  - `QuizDetailScreen`: Referenced but not yet implemented
  - Other screens: Currently show "Coming Soon" placeholders
- **Data Management**: Hardcoded Maps in screen files link languages to lessons, phrases, and quizzes
- **Screen Imports**: All screens imported directly in main.dart
- **Theme Configuration**: Centralized in MaterialApp with green primary swatch and Roboto font

## Important Development Patterns

### Language Support
- Supports 4 languages: Hindi, Yoruba, Swahili, Bengali
- Each language has native script (`localletters`), romanized text (`local`), and English translation
- Language selection managed through dropdown in LessonsScreen and QuizzesScreen
- Extensive phrase data with pronunciation guides for lesson content

### Progress Tracking
- Lesson progress stored as double (0.0-1.0) in Lessons model
- Visual progress indicators throughout the UI
- Lock/unlock system for lessons and quizzes based on progress
- Quiz attempts and best scores tracked per quiz

### Interactive Features
- Simulated audio playback for phrase pronunciation
- Speech practice with mock pronunciation scoring (75-100% range)
- Offline lesson downloads with progress indicators and file size management
- Quiz statistics and performance tracking

### Navigation Flow
```
Main App → MainScreen (7-tab BottomNav)
         ├── Home → Language Selection → Offline Downloads
         ├── Lessons → Language Dropdown → Lesson List → Lesson Detail → Interactive Learning
         ├── Quizzes → Language Dropdown → Quiz List → Quiz Detail (not implemented)
         └── Other tabs (placeholders)
```

### Screen State Management
- Uses StatefulWidget pattern for screens with local state
- No global state management solution currently implemented
- Consider implementing Provider/Riverpod for complex state sharing across features
- Timer-based progress simulation for downloads and interactive features