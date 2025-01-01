import 'package:flutter/material.dart';
import 'package:task_management_app/view_models/preferences_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: preferences.when(
        data: (prefs) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Theme",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                title: const Text("Dark Mode"),
                value: prefs.isDarkMode,
                onChanged: (value) {
                  ref.read(preferencesProvider.notifier).setDarkMode(value);
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "Default Sort Order",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: prefs.sortOrder,
                onChanged: (value) {
                  if (value != null) {
                    ref.read(preferencesProvider.notifier).setSortOrder(value);
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: "date",
                    child: Text("By Date"),
                  ),
                  DropdownMenuItem(
                    value: "priority",
                    child: Text("By Priority"),
                  ),
                ],
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text("Error: ${error.toString()}")),
      ),
    );
  }
}
