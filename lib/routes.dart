import 'package:flutter/material.dart';
import 'package:task_management_app/views/task_list_view.dart';
import 'package:task_management_app/views/task_detail_view.dart';
import 'package:task_management_app/models/user_preferences.dart';

class AppRoutes {
  static const String taskList = '/task-list';
  static const String taskDetail = '/task-detail';
  static const String userPreferences = '/user-preferences';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case taskList:
        return MaterialPageRoute<Widget>(builder: (_) => const TaskListView());
      case taskDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute<Widget>(
          builder: (_) => TaskDetailView(task: args['task']),
        );
      case userPreferences:
        return MaterialPageRoute<Widget>(builder: (_) => const UserPreferencesPage());
      default:
        return MaterialPageRoute<Widget>(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page not found"),
            ),
          ),
        );
    }
  }
}
