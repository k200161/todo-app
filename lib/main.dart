import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'theme.dart';

void main() {
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
