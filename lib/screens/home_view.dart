import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo_yt/models/home_view_model.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo with Mvvm - Provider'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Consumer<HomeViewModel>(
              builder: (context, state,child) {
                return ListView.builder(
                  itemCount: state.allTodos.length,
                  itemBuilder: (context,index) {
                    Todo todo = state.allTodos[index];
                    return ListTile(title: Text(todo.title),subtitle: Text(todo.description ?? ''),);
                  }
                );
              }
            )),
          ],
        ),
      ),
    );
  }
}
