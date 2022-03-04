import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_private/providers/amplify.dart';
import '../models/ModelProvider.dart';
import '../constants/style.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

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
                size: todoItemIconSize),
          ]),
        ),
      ),
    );
  }
}
