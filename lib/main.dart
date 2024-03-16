import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'repo/todo_repo.dart';
import 'theme.dart';
import 'utils/todos_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final file = await TodosFile.init();
  TodoRepo.instance.todosFile = file;
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: AppTheme().appTheme,
      home: const HomeScreen(),
    );
  }
}
