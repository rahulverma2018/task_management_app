# Task Management App

This Flutter app is a Task Management System that helps users manage their tasks efficiently while showcasing Flutter development best practices, 
such as MVVM architecture, Riverpod for state management, SQLite and Hive for data storage, and responsive UI design.


## Features

### 1. Task Management
- Add, edit, delete, and view tasks.
- Mark tasks as "Completed" or "Pending."
- Tasks persist across app launches.

### 2. Data Storage
- SQLite: Stores task-related data securely.
- Hive: Manages user preferences such as theme (light/dark) and task sort order (e.g., by date or priority).

### 3. State Management
- Riverpod: Simplifies app state management for both task and user preference handling.

### 4. MVVM Architecture
- Model: Represents tasks and user preferences.
- ViewModel: Manages business logic and state.
- View: Builds a clean and responsive user interface.

### 5. Responsive Design
- Mobile: Displays tasks in a compact list view.
- Tablet: Uses a split-screen layout for task list and task details.


## Tech Stack

- Flutter: Framework for building the app.
- Riverpod: State management solution.
- SQLite: Persistent storage for task data.
- Hive: Lightweight storage for user preferences.
- Dart: Programming language for Flutter.


## Folder Structure

The app is organized as follows:
```
lib/
├── models/
│   ├── task_model.dart             # Defines the Task data model.
│   └── user_preferences.dart       # Defines the User Preferences data model.
├── view_models/
│   ├── task_view_model.dart        # Business logic for tasks.
│   └── preferences_view_model.dart # Business logic for user preferences.
├── views/
│   ├── task_list_view.dart         # Displays the list of tasks.
│   ├── task_detail_view.dart       # Shows task details.
│   ├── settings_view.dart          # Provides settings for theme and preferences.
│   └── responsive_layout.dart      # Adapts UI for mobile and tablet screens.
├── services/
│   ├── database_service.dart       # Handles SQLite operations.
│   └── hive_service.dart           # Manages Hive storage.
├── utils/
│   ├── app_theme.dart              # Contains theme definitions(light/dark).
│   └── constants.dart              # Holds constant values used across the app.
├── main.dart                       # Entry point of the app.
└── routes.dart                     # Defines app navigation routes.
```


## Setup Instructions

### 1. Prerequisites
- Flutter SDK installed (https://flutter.dev/docs/get-started/install).
- An IDE such as Android Studio or Visual Studio Code.

### 2. Clone the Repository
```bash
git clone https://github.com/rahulverma2018/task_management_app.git
cd task_management_app
```

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Run the App
- Use the following command to launch the app:
```bash
flutter run
```


## Key Functionalities

### Task Management
- Perform CRUD operations on tasks.
- Tasks are stored in SQLite for persistence.

### User Preferences
- Theme settings (light/dark) and task sort order are stored in Hive.
- Preferences persist across app sessions.

### Responsive Design
- Ensures smooth operation on both mobile and tablet devices.
- Uses `responsive_layout.dart` to adapt the UI dynamically.

### State Management
- Riverpod handles state for:
    - Task operations.
    - User preference changes.


## App Highlights
- Light/Dark Mode: Toggle between themes, with user preferences saved in Hive.
- Navigation: Organized and efficient navigation via `routes.dart`.
- MVVM Architecture: Clear separation of concerns with modular components.
- Performance: Optimized SQLite and Hive integration for smooth user experience.


## Contributing
Contributions are welcome! Fork the repository and create a pull request with your proposed changes or features.
