import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/ModelProvider.dart';
import '../providers/amplify.dart';

class AddTodo extends ConsumerWidget {
  AddTodo({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amplifyService = ref.watch(amplifyServiceProvider);
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
              ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    String description = _descriptionController.text;
                    Todo newTodo = Todo(
                        name: name,
                        description:
                            description.isNotEmpty ? description : null,
                        done: false);
                    amplifyService.dataStoreSave(newTodo);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
