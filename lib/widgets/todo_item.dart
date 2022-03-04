import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_private/providers/amplify.dart';
import '../models/ModelProvider.dart';

class TodoItem extends ConsumerWidget {
  final double iconSize = 24.0;
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  void _deleteTodo(BuildContext context) async {
    try {
      // to delete data from DataStore, we pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(todo);
    } catch (e) {
      developer.log('An error occurred while deleting Todo: $e');
    }
  }

  Future<void> _toggledone() async {
    // copy the Todo we wish to update, but with updated properties
    Todo updatedTodo = todo.copyWith(done: todo.done);
    try {
      // to update data in DataStore, we again pass an instance of a model to
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      developer.log('An error occurred while saving Todo: $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amplifyService = ref.watch(amplifyServiceProvider);
    return Card(
      child: InkWell(
        onTap: () {
          amplifyService.dataStoreSave(todo.copyWith(done: todo.done));
        },
        onLongPress: () {
          amplifyService.dataStoreDelete(todo);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(todo.description ?? 'No description'),
                ],
              ),
            ),
            Icon(todo.done! ? Icons.check_box : Icons.check_box_outline_blank,
                size: iconSize),
          ]),
        ),
      ),
    );
  }
}
