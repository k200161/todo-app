import 'package:flutter/material.dart';

import '../data/todo_data.dart';
import 'todo_tile.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = getTodoItems();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (_, i) => TodoTile(todo: todos[i]),
      separatorBuilder: (_, i) => const SizedBox(height: 20),
    );
  }
}
