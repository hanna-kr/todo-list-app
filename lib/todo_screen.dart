import 'package:exercise_ui/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:exercise_ui/todo_list.dart';
import 'package:provider/provider.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
              child: ToDoList(),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String newTodo = '';

                    return AlertDialog(
                      title: const Text('Neues Todo hinzufügen'),
                      content: TextField(
                        onChanged: (value) {
                          newTodo = value;
                        },
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('cancel')),
                        const SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<ToDoProvider>(context, listen: false)
                                .addTodo(newTodo);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Hinzufügen'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Update Todos'),
            ),
          ],
        ),
      ),
    );
  }
}
