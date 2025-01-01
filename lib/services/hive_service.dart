import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _boxName = 'preferences';

  Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  Future<void> saveThemeMode(bool isDarkMode) async {
    final box = Hive.box(_boxName);
    await box.put('isDarkMode', isDarkMode);
  }

  bool getThemeMode() {
    final box = Hive.box(_boxName);
    return box.get('isDarkMode', defaultValue: false);
  }

  Future<void> saveSortOrder(String sortOrder) async {
    final box = Hive.box(_boxName);
    await box.put('sortOrder', sortOrder);
  }

  String getSortOrder() {
    final box = Hive.box(_boxName);
    return box.get('sortOrder', defaultValue: 'date');
  }
}
