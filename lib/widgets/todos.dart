import 'dart:developer' as developer;
// import 'package:amplify_api/model_mutations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../providers/amplify.dart';
// import '../models/project.dart';

class Todos extends ConsumerWidget {
  const Todos({Key? key}) : super(key: key);

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
