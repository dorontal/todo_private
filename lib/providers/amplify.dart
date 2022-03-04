import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../models/ModelProvider.dart';
import '../services/amplify.dart';

final amplifyServiceProvider =
    Provider<AmplifyService>((_) => AmplifyService());

final authUserStreamProvider = StreamProvider<AuthUser?>((ref) {
  final amplifyService = ref.watch(amplifyServiceProvider);
  return amplifyService.userStreamController.stream;
});

final todosSnapshotProvider = StreamProvider((ref) {
  return Amplify.DataStore.observeQuery(Todo.classType);
});
