import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes.dart';
import 'package:task_management_app/view_models/preferences_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialized Hive
  await Hive.initFlutter();
  await Hive.openBox('preferences');
  await Hive.openBox('tasks');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      theme: preferences.when(
        data: (prefs) => ThemeData(
          brightness: prefs.isDarkMode ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.blue,
        ),
        loading: () => ThemeData.light(),
        error: (e, _) => ThemeData.light(),
      ),
      initialRoute: AppRoutes.taskList,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
