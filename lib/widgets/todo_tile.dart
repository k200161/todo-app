import 'package:flutter/material.dart';

import '../models/todo.dart';

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
  late bool selected = widget.todo.completed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() => selected = !selected);
      },
      leading: Radio(
        value: selected,
        groupValue: true,
        onChanged: (x) {},
      ),
      title: Text(
        widget.todo.task,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          decoration: selected ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        '${widget.todo.startTime.timeFormated} to ${widget.todo.endTime.timeFormated}',
      ),
      trailing: IconButton(
        iconSize: 25,
        color: Colors.red,
        icon: const Icon(Icons.delete_outline),
        onPressed: () {},
      ),
    );
  }
}

extension on DateTime {
  String get timeFormated {
    final local = toLocal();
    final hr = local.hour;
    final min = local.minute;
    final hrStr = hr.toString().padLeft(2, '0');
    final minStr = min.toString().padLeft(2, '0');
    return '$hrStr:$minStr';
  }
}
