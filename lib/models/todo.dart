class Todo {
  final String id;
  final String task;
  final DateTime startTime;
  final DateTime endTime;
  final bool completed;

  const Todo({
    required this.id,
    required this.task,
    required this.startTime,
    required this.endTime,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'completed': completed,
    };
  }

  factory Todo.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return Todo(
      id: map['id'],
      task: map['task'],
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime']),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime']),
      completed: map['completed'],
    );
  }

  Todo copyWith({
    String? id,
    String? task,
    DateTime? startTime,
    DateTime? endTime,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      completed: completed ?? this.completed,
    );
  }

  @override
  bool operator ==(covariant Todo other) {
    return identical(this, other) || id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
