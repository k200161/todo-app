import 'package:flutter/material.dart';

import 'create_todo_form.dart';
import 'widgets/flower_image.dart';
import 'widgets/home_header.dart';
import 'widgets/statistics_box.dart';
import 'widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            left: 0,
            top: 0,
            child: FlowerImage(),
          ),
          const Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    HomeHeader(),
                    SizedBox(height: 30),
                    StatisticsBox(),
                    SizedBox(height: 40),
                    Text(
                      'Today Tasks',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TodoList(),
                    SizedBox(height: 40),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: null,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const CreateTodoForm(),
                  );
                },
                child: const Text('Create'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
