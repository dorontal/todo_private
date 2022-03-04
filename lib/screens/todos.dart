import 'dart:developer' as developer;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import '../models/ModelProvider.dart';

class Todos extends HookWidget {
  Todos({Key? key}) : super(key: key);

  final _isLoadingNotifier = useState(false);
  final _todosNotifier = useState<List<Todo>>([]);

  @override
  Widget build(BuildContext context) {
    // final amplifyService = ref.watch(amplifyServiceProvider);
    return Center(
        child: ElevatedButton(
            onPressed: () async {
              developer.log('clicked i');
            },
            child: const Text('push me')));
  }
}
