import 'package:flutter/material.dart';

class CreateTodoForm extends StatefulWidget {
  const CreateTodoForm({super.key});

  @override
  State<CreateTodoForm> createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends State<CreateTodoForm> {
  final formKey = GlobalKey<FormState>();

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
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InputDatePickerFormField(
                    acceptEmptyDate: false,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    fieldLabelText: 'Start Date',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputDatePickerFormField(
                    acceptEmptyDate: false,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    fieldLabelText: 'End Date',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final isValid = formKey.currentState?.validate() ?? false;
                if (isValid) Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
