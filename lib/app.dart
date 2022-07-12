import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo_yt/screens/home_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: HomeView(),
    );
  }
}
