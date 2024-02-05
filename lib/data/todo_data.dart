import 'dart:math';

import '../models/todo.dart';

List<Todo> getTodoItems() {
  final now = DateTime.now();
  final random = Random(now.millisecondsSinceEpoch);
  final length = random.nextInt(3) + 5;

  return List.generate(
    length,
    (i) {
      final duration = Duration(hours: random.nextInt(24));

      return Todo(
        task: 'This is a todo task $i',
        startTime: now.subtract(duration),
        endTime: now.add(duration),
        completed: random.nextBool(),
      );
    },
  );
}
