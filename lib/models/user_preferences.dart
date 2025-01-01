import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserPreferencesPage extends StatelessWidget {
  const UserPreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final preferencesBox = Hive.box('preferences');

    return ValueListenableBuilder(
      valueListenable: preferencesBox.listenable(),
      builder: (context, Box box, _) {
        final isDarkMode = box.get('isDarkMode', defaultValue: false);
        final sortOrder = box.get('sortOrder', defaultValue: 'title');

        // It set's the theme based on the preference
        final ThemeData themeData = isDarkMode
            ? ThemeData.dark().copyWith(
          primaryColor: Colors.deepPurple,
          hintColor: Colors.amber,
        )
            : ThemeData.light().copyWith(
          primaryColor: Colors.blue,
          hintColor: Colors.green,
        );

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: const Text('User Preferences',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: const Text('Dark Mode'),
                      trailing: Switch(
                        value: isDarkMode,
                        onChanged: (value) {
                          box.put('isDarkMode', value);
                        },
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: const Text('Sort Order'),
                      subtitle: Text(
                        sortOrder == 'title' ? 'Sort by Title' : 'Sort by Due Date',
                      ),
                      trailing: DropdownButton<String>(
                        value: sortOrder,
                        items: const [
                          DropdownMenuItem(
                            value: 'title',
                            child: Text('Sort by Title'),
                          ),
                          DropdownMenuItem(
                            value: 'dueDate',
                            child: Text('Sort by Due Date'),
                          ),
                        ],
                        onChanged: (value) {
                          box.put('sortOrder', value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
