import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ilabs_removal_app/screens/TodosPage.dart';

import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';
import '../models/Todo.dart';



class authgate extends StatefulWidget {
  const authgate({Key? key}) : super(key: key);

  @override
  State<authgate> createState() => _authgateState();
}

class _authgateState extends State<authgate> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  // void _configureAmplify() async {
  //   try {
  //     await Amplify.addPlugin(AmplifyAuthCognito());
  //     await Amplify.configure(amplifyconfig);
  //     print('Successfully configured');
  //   } on Exception catch (e) {
  //     print('Error configuring Amplify: $e');
  //   }
  // }
  final _dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
  final _authPlugin = AmplifyAuthCognito();
  final _apiPlugin = AmplifyAPI(modelProvider: ModelProvider.instance);

  Future<void> _configureAmplify() async {

    try {

      // add Amplify plugins
      await Amplify.addPlugins([_authPlugin, _dataStorePlugin, _apiPlugin,]);

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } catch (e) {

      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }

    // to be filled in a later step
  }


  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        home:  TodosPage(),
      ),
    );
  }
}





