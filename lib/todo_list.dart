import 'package:exercise_ui/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:exercise_ui/todo_item.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoProvider>(builder: (context, data, child) {
      return ListView(
        children: data.todos.map((todo) {
          return ToDoItem(todo: todo);
        }).toList(),
      );
    });
  }
}
