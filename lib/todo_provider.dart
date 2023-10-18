import 'package:flutter/material.dart';

class ToDoProvider extends ChangeNotifier {
  final List<String> _todos = [
    'make coffee',
    'walk dog',
    'do some coding',
    'make errors',
    'play with dog',
    'fix code',
  ];

  final List<String> _checkedTodos = [];

  List<String> get checkedTodos => _checkedTodos;
  List<String> get todos => _todos;

  void toggleCheckedState(String todo) {
    if (_checkedTodos.contains(todo)) {
      _checkedTodos.remove(todo);
    } else {
      _checkedTodos.add(todo);
    }
    notifyListeners();
  }

  void addTodo(String todo) {
    todos.add(todo);
    notifyListeners();
  }
}
