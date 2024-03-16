import 'package:flutter/material.dart';

import 'models/todo.dart';
import 'repo/todo_repo.dart';

class CreateTodoForm extends StatefulWidget {
  const CreateTodoForm({super.key});

  @override
  State<CreateTodoForm> createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends State<CreateTodoForm> {
  final formKey = GlobalKey<FormState>();

  var todo = Todo(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    task: '',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    completed: false,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create Todo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.sentences,
              validator: (x) => x == '' ? 'This is required' : null,
              decoration: const InputDecoration(
                labelText: 'Task',
                hintText: 'What you want to do or accomplish?',
              ),
              onSaved: (x) => todo = todo.copyWith(task: x),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InputDatePickerFormField(
                    acceptEmptyDate: false,
                    initialDate: todo.startTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    fieldLabelText: 'Start Date',
                    onDateSaved: (x) => todo = todo.copyWith(startTime: x),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputDatePickerFormField(
                    acceptEmptyDate: false,
                    initialDate: todo.endTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    fieldLabelText: 'End Date',
                    onDateSaved: (x) => todo = todo.copyWith(endTime: x),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Spacer(),
            ElevatedButton(
              onPressed: save,
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }

  void save() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    formKey.currentState?.save();
    TodoRepo.instance.addTodo(todo);
    Navigator.of(context).pop();
  }
}
