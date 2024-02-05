class Todo {
  final String task;
  final DateTime startTime;
  final DateTime endTime;
  final bool completed;

  const Todo({
    required this.task,
    required this.startTime,
    required this.endTime,
    required this.completed,
  });
}
