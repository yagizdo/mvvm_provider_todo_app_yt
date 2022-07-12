import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo_yt/models/home_view_model.dart';
import 'package:mvvm_provider_todo_yt/screens/home_view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: MaterialApp(
        title: 'Todo App',
        home: HomeView(),
      ),
    );
  }
}
