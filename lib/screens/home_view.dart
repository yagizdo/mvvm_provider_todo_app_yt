import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo_yt/models/home_view_model.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAlertDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Todo with Mvvm - Provider'),
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

   showAlertDialog(BuildContext context) {
    // Title Controller
    TextEditingController titleController = TextEditingController();

    // Description Controller
    TextEditingController descController = TextEditingController();

    // Form key
    final formKey = GlobalKey<FormState>();

    // Add Todo button
    Widget addButton = ElevatedButton(onPressed: (){

      // Create todo object
      Todo todo = Todo(titleController.text, descController.text, false);

      // Validation check
      if(formKey.currentState!.validate()) {
        Provider.of<HomeViewModel>(context,listen: false).addTodo(todo);
        titleController.text = '';
        descController.text = '';
        Navigator.pop(context);
      }
    }, child: const Text('Add Todo'));

    // Cancel Button
    Widget cancelButton = TextButton(onPressed: (){
      Navigator.pop(context);
    }, child: const Text('Cancel',style: TextStyle(color: Colors.red),));

    // Alert Dialog
    AlertDialog alert = AlertDialog(
      title: const Text('Add Todo'),
      content: Form(
        key: formKey,
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              // Title
              TextFormField(
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Title')
                ),
                controller: titleController,

                // Validator
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Please write title';
                  }
                },
              ),
              const SizedBox(height: 20,),

              // Description
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Description')
                ),
                controller: descController,
              ),
            ],
          ),
        ),
      ),
      actions: [
        addButton,
        cancelButton,
      ],
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    });
  }
}
