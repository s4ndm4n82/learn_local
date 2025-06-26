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
- **Models**: Data classes for Lessons, Phrase, and UserProfile

### Current State
- App has basic navigation structure implemented
- Most features show "Coming Soon" placeholders
- Git status shows deleted `lib/models/models.dart` and new files `lib/models/app_models.dart` and `lib/screens/lesson_detail_screen.dart`

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
- Screen templates created but mostly contain placeholder content
- Data models defined in `lib/models/app_models.dart` (Lessons, Phrase, UserProfile)
- New lesson detail screen created but incomplete (`lib/screens/lesson_detail_screen.dart`)
- Ready for feature implementation in individual screens

### Code Structure Details
- **Models**: `lib/models/app_models.dart` contains three main data classes:
  - `Lessons`: title, description, progress, isUnlocked
  - `Phrase`: localletters, english, local, pronunciation 
  - `UserProfile`: name, lessonsCompleted, currentStreak, totalPoints, badges
- **Navigation Pattern**: Uses StatefulWidget with index-based screen switching via `_selectedIndex`
- **Screen Organization**: 
  - `HomeScreen`: Dashboard with language selection and quick actions
  - `LessonsScreen`: Language dropdown, lesson list with progress tracking
  - `LessonDetailScreen`: Interactive phrase learning with simulated audio features
  - Other screens: Currently show "Coming Soon" placeholders
- **Data Management**: Hardcoded Maps in screen files link languages to lessons and phrases
- **Screen Imports**: All screens imported directly in main.dart
- **Theme Configuration**: Centralized in MaterialApp with green primary swatch and Roboto font

## Important Development Patterns

### Language Support
- Supports 4 languages: Hindi, Yoruba, Swahili, Bengali
- Each language has native script (`localletters`), romanized text (`local`), and English translation
- Language selection managed through dropdown in LessonsScreen

### Progress Tracking
- Lesson progress stored as double (0.0-1.0) in Lessons model
- Visual progress indicators throughout the UI
- Lock/unlock system for lessons based on progress

### Navigation Flow
```
Main App → MainScreen (7-tab BottomNav)
         ├── Home → Language Selection
         ├── Lessons → Language Dropdown → Lesson List → Lesson Detail
         └── Other tabs (placeholders)
```

### Screen State Management
- Uses StatefulWidget pattern for screens with local state
- No global state management solution currently implemented
- Consider implementing Provider/Riverpod for complex state sharing