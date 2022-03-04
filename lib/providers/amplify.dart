import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../models/ModelProvider.dart';
import '../services/amplify.dart';

final amplifyServiceProvider =
    Provider<AmplifyService>((_) => AmplifyService());

final todosSnapshotProvider = StreamProvider((ref) {
  return Amplify.DataStore.observeQuery(Todo.classType);
});
