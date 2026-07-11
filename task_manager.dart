import 'task.dart';

class TaskManager {
  int _nextId = 1;
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title, bool isUrgent, String category) {
    if (title.trim().isEmpty) return;
    _tasks.add(Task(_nextId++, title, isUrgent, category));
  }

  void deleteTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
  }

  void toggleDone(int id) {
    Task task = _tasks.firstWhere((t) => t.id == id);
    task.isDone = !task.isDone;
  }
}
