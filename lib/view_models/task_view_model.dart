import 'package:riverpod/riverpod.dart';
import '../services/database_service.dart';
import 'package:task_management_app/models/task_models.dart';

// Provider definition
final taskProvider = StateNotifierProvider<TaskViewModel, List<Task>>((ref) {
  return TaskViewModel();
});

class TaskViewModel extends StateNotifier<List<Task>> {
  TaskViewModel() : super([]);

  final dbService = DatabaseService.instance;

  // Add task
  Future<void> addTask(Task task) async {
    await dbService.insertTask(task);
    await fetchTasks();
  }

  // Update task(edit or mark as completed)
  Future<void> updateTask(Task task) async {
    await dbService.updateTask(task);
    await fetchTasks();
  }

  // Delete task
  Future<void> deleteTask(int id) async {
    await dbService.deleteTask(id);
    await fetchTasks();
  }

  // Fetch tasks
  Future<void> fetchTasks() async {
    final tasks = await dbService.fetchTasks();
    state = tasks;
  }

  // Mark task as completed
  Future<void> markAsComplete(int taskId) async {
    final task = state.firstWhere((task) => task.id == taskId);
    final updatedTask = task.copyWith(isCompleted: true);
    await updateTask(updatedTask);
  }
}

