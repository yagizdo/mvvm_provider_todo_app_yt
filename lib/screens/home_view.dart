import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo with Mvvm - Provider'),
      ),
      body: Column(
        children: [
          Text('Todos'),
        ],
      ),
    );
  }
}
