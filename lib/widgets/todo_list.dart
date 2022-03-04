import 'package:flutter/material.dart';
import '../models/ModelProvider.dart';
import './todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return todos.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.all(8),
            children: todos.map((todo) => TodoItem(todo: todo)).toList())
        : const Center(child: Text('Tap button below to add a todo!'));
  }
}
