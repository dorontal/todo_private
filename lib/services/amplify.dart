import 'dart:developer' as developer;
import 'dart:async';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';
import '../models/ModelProvider.dart';
import '../amplifyconfiguration.dart';

/// Service for all things Amplify
class AmplifyService {
  bool amplifyIsConfigured = false;

  final StreamController<AuthUser?> userStreamController =
      StreamController<AuthUser?>();
  late StreamSubscription<QuerySnapshot<Todo>> _subscription;

  // returns whether or not Amplify is configured
  Future<void> startUserStream() async {
    developer.log('startUserStream()');
    AuthUser? cognitoUser = await getCognitoUser();
    userStreamController.add(cognitoUser);
  }

  Future<void> configureAmplify() async {
    developer.log('configureAmplify()');
    if (!amplifyIsConfigured) {
      await Amplify.addPlugins([
        AmplifyDataStore(modelProvider: ModelProvider.instance),
        AmplifyAuthCognito(),
        AmplifyAPI(modelProvider: ModelProvider.instance)
      ]);
      await Amplify.configure(amplifyconfig);
      amplifyIsConfigured = true;
    }
  }

  Future<AuthUser?> getCognitoUser() async {
    try {
      final AuthUser cognitoUser = await Amplify.Auth.getCurrentUser();
      developer.log('*********** getCurrentUser() got one!');
      developer.inspect(cognitoUser);
      return cognitoUser;
      // } on SignedOutException catch (e) {
    } on AuthException catch (e) {
      developer.log('*********** getCurrentUser() - signed out - e: $e');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  /// Amplify Datastore
  //////////////////////////////////////////////////////////////////////////////

  Future<void> dataStoreSave(Model model) async {
    await Amplify.DataStore.save(model);
  }

  Future<void> dataStoreDelete(Model model) async {
    await Amplify.DataStore.delete(model);
  }
}
