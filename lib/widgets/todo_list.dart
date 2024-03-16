import 'package:flutter/material.dart';

import '../repo/todo_repo.dart';
import 'todo_tile.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: TodoRepo.instance.streamTodos(),
      builder: (context, snap) {
        if (snap.hasError)
          return Center(
            heightFactor: 10,
            child: Text(snap.error.toString()),
          );

        if (!snap.hasData)
          return const Center(
            heightFactor: 5,
            child: CircularProgressIndicator(),
          );

        final todos = snap.data ?? const [];

        if (todos.isEmpty)
          return const Center(
            heightFactor: 10,
            child: Text('No todos found'),
          );

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: todos.length,
          separatorBuilder: (_, i) => const SizedBox(height: 20),
          itemBuilder: (_, i) {
            final todo = todos[i];

            return TodoTile(
              key: ValueKey(todo.id),
              todo: todo,
            );
          },
        );
      },
    );
  }
}
