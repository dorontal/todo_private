import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_private/providers/amplify.dart';
import '../screens/add_todo_item.dart';
import '../widgets/todo_list.dart';

class Todos extends ConsumerWidget {
  const Todos({Key? key}) : super(key: key);

  Widget _buildPage(BuildContext context, Widget body) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Todo List')),
      body: body,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTodoItem()),
          );
        },
        tooltip: 'Add Todo',
        label: Row(
          children: const [Icon(Icons.add), Text('Add todo')],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(todosSnapshotProvider).when(
        data: (snapshot) =>
            _buildPage(context, TodoList(todos: snapshot.items)),
        loading: () => _buildPage(
            context,
            const Center(
              child: CircularProgressIndicator(),
            )),
        error: (_, __) => const Center(
              child: Text('Something went wrong: cannot load data'),
            ));
  }
}
