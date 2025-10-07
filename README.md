# Radhe Radhe 🙏✨

A mindful Flutter app for daily manifestations and gratitude journaling.

## About

Radhe Radhe is a simple yet powerful journaling app designed to help you cultivate gratitude and manifest your dreams. Write your daily affirmations, track your journey, and maintain a positive mindset—all in a clean, distraction-free interface.

## Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/4c60c686-ea06-42f5-a9ee-577bc85106c6" alt="Home Screen" width="250"/>
  <img src="https://github.com/user-attachments/assets/06960c5b-6a5b-459e-ba04-ecd79da03827" alt="Entries View" width="250"/>
  <img src="https://github.com/user-attachments/assets/2232a8ef-da02-450b-8974-047e373c62ef" alt="Dark Mode" width="250"/>
</p>

## Features

### Core Functionality
- ✍️ **Write & Save** - Create manifestation and gratitude entries
- 📅 **Timeline View** - Browse past entries with timestamps
- 🗑️ **Flexible Deletion** - Clear individual entries or all at once
- 💭 **Daily Affirmations** - Inspirational messages to start your day

### Customization
- 🌓 **Theme Options** - System, light, and dark mode support
- 🎨 **Clean UI** - Distraction-free, peaceful design

## Getting Started

### Prerequisites

- Flutter SDK (v3.35+)
- Dart (v3.9+)
- VS Code or Android Studio
- Android Emulator, iOS Simulator, or physical device

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/radhe-radhe.git
cd radhe-radhe
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

### Platform-Specific Commands

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

**Check available devices:**
```bash
flutter devices
```

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Local Storage:** SharedPreferences / Hive (for data persistence)
- **State Management:** Provider / GetX (specify yours)
- **UI:** Material Design 3

## Project Structure

```
lib/
├── models/          # Data models
├── screens/         # UI screens
├── widgets/         # Reusable components
├── services/        # Local storage & business logic
├── utils/           # Helpers & constants
└── main.dart        # App entry point
```

## Usage

1. **Create Entry** - Tap the add button to write your manifestation or gratitude
2. **View History** - Scroll through your past entries on the home screen
3. **Delete Entries** - Swipe or tap to remove individual entries
4. **Change Theme** - Access settings to toggle between themes
5. **Daily Inspiration** - Check your daily affirmation message

## Roadmap

Future enhancements planned:

- 📖 Daily quotes and inspirational tips page
- 🔔 Notification reminders for daily journaling
- ☁️ Cloud backup and sync support
- 📊 Mood tracking and insights
- 🔍 Search functionality for entries
- 🏷️ Tags and categories

## Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS IPA:**
```bash
flutter build ios --release
```

## License

© 2025 Deephang Thegim. All rights reserved.

