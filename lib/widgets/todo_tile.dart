import 'package:flutter/material.dart';

import '../utils/datetime_ext.dart';
import '../models/todo.dart';
import '../repo/todo_repo.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  late var todo = widget.todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        final toggledTodo = todo.copyWith(completed: !todo.completed);
        setState(() => todo = toggledTodo);
        TodoRepo.instance.addTodo(toggledTodo);
      },
      leading: Radio(
        value: todo.completed,
        groupValue: true,
        onChanged: (x) {},
      ),
      title: Text(
        widget.todo.task,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          decoration: todo.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        widget.todo.startTime.rangeTill(widget.todo.endTime),
      ),
      trailing: IconButton(
        iconSize: 25,
        color: Colors.red,
        icon: const Icon(Icons.delete_outline),
        onPressed: () => TodoRepo.instance.deletTodo(todo),
      ),
    );
  }
}
