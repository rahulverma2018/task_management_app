import 'package:riverpod/riverpod.dart';
import '../services/hive_service.dart';

final preferencesProvider =
StateNotifierProvider<PreferencesViewModel, AsyncValue<UserPreferences>>(
      (ref) => PreferencesViewModel(),
);

class UserPreferences {
  final bool isDarkMode;
  final String sortOrder;

  UserPreferences({required this.isDarkMode, required this.sortOrder});
}

class PreferencesViewModel extends StateNotifier<AsyncValue<UserPreferences>> {
  PreferencesViewModel() : super(const AsyncLoading()) {
    _loadPreferences();
  }

  final hiveService = HiveService();

  Future<void> _loadPreferences() async {
    try {
      await hiveService.initHive();
      final isDarkMode = hiveService.getThemeMode();
      final sortOrder = hiveService.getSortOrder();
      state = AsyncData(UserPreferences(
        isDarkMode: isDarkMode,
        sortOrder: sortOrder,
      ));
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    await hiveService.saveThemeMode(isDarkMode);
    state = AsyncData(
      UserPreferences(isDarkMode: isDarkMode, sortOrder: state.value!.sortOrder),
    );
  }

  Future<void> setSortOrder(String sortOrder) async {
    await hiveService.saveSortOrder(sortOrder);
    state = AsyncData(
      UserPreferences(isDarkMode: state.value!.isDarkMode, sortOrder: sortOrder),
    );
  }
}
