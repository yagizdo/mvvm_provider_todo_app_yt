import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo_yt/models/todo.dart';

class HomeViewModel extends ChangeNotifier {
  // Todo list
  List<Todo> todos = [];

  // get todos list

  // All todos
  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos);

  // Completed todos
  UnmodifiableListView<Todo> get completedTodos => UnmodifiableListView(todos.where((todo) => todo.completed));

  // Uncompleted todos
  UnmodifiableListView<Todo> get unCompletedTodos => UnmodifiableListView(todos.where((todo) => !todo.completed));

  // Add Todo
  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void removeTodos(Todo todo) {
    // find todo index
    int index = todos.indexOf(todo);
    print(index);

    // delete todo
    todos.removeAt(index);
    notifyListeners();
  }

}