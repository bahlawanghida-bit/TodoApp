class Task {
  final int id;
  final String title;
  final bool isUrgent;
  final String category;
  bool isDone; // NEW

  Task(
    this.id,
    this.title,
    this.isUrgent,
    this.category, {
    this.isDone = false,
  });
}
