import 'dart:developer' as developer;
// import 'package:amplify_api/model_mutations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../providers/amplify.dart';
// import '../models/project.dart';

class AddTodo extends ConsumerWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final amplifyService = ref.watch(amplifyServiceProvider);
    return Center(
        child: ElevatedButton(
            onPressed: () async {
              developer.log('clicked i');
            },
            child: const Text('push me')));
  }
}
/*
class AddTodoForm extends StatefulWidget {
  const AddTodoForm({Key? key}) : super(key: key);

  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _saveTodo() async {
    // get the current text field contents
    String name = _nameController.text;
    String description = _descriptionController.text;

    // create a new Todo from the form values
    // `done` is also required, but should start false in a new Todo
    Todo newTodo = Todo(
        name: name,
        description: description.isNotEmpty ? description : null,
        done: false);

    try {
      // to write data to DataStore, we simply pass an instance of a model to
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(newTodo);

      // after creating a new Todo, close the form
      Navigator.of(context).pop();
    } catch (e) {
      developer.log('An error occurred while saving Todo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildAddTodoPage(context);
  }

  Widget buildAddTodoPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration:
                      const InputDecoration(filled: true, labelText: 'Name')),
              TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      filled: true, labelText: 'Description')),
              ElevatedButton(onPressed: _saveTodo, child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
*/