import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'constants/style.dart';
import 'providers/amplify.dart';
import 'screens/todos.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amplifyService = ref.watch(amplifyServiceProvider);
    amplifyService.configureAmplify();
    return Authenticator(
      child: MaterialApp(
          title: 'Todo List',
          theme: appTheme,
          builder: Authenticator.builder(),
          home: const Todos()),
    );
  }
}
