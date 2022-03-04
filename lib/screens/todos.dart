import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_private/providers/amplify.dart';
import '../widgets/todo_list.dart';

class Todos extends ConsumerWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(todosSnapshotProvider).when(
        data: (snapshot) => TodoList(todos: snapshot.items),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (_, __) => const Center(
              child: Text('Something went wrong: cannot load data'),
            ));
  }
}
