import 'package:exercise_ui/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoItem extends StatelessWidget {
  final String todo;

  const ToDoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoProvider>(builder: (context, data, child) {
      final bool isChecked = data.checkedTodos.contains(todo);

      return Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  data.toggleCheckedState(todo);
                },
              ),
              const SizedBox(
                width: 36,
              ),
              Text(
                todo,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration: isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
