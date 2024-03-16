import 'dart:convert';
import 'dart:io';

import '../models/todo.dart';

class TodoRepo {
  late final File file;

  TodoRepo._singleton();

  static final instance = TodoRepo._singleton();

  set todosFile(File newFile) => file = newFile;

  Future<void> addTodo(Todo todo) async {
    final todos = readTodos();
    final index = todos.indexOf(todo);
    if (index == -1)
      todos.add(todo);
    else {
      todos.removeAt(index);
      todos.insert(index, todo);
    }
    setTodos(todos);
  }

  Future<void> deletTodo(Todo todo) async {
    final todos = readTodos()..remove(todo);
    setTodos(todos.toSet().toList());
  }

  void setTodos(List<Todo> todos) {
    final data = todos.map((t) => t.toMap()).toList();
    file.writeAsStringSync(json.encode(data));
  }

  Stream<List<Todo>> streamTodos() async* {
    yield readTodos();

    await for (final event in file.watch()) {
      if (event.type == FileSystemEvent.modify) //
        yield readTodos();
    }
  }

  List<Todo> readTodos() {
    final data = List.from(json.decode(file.readAsStringSync()));
    return data.map(Todo.fromMap).toList();
  }
}
