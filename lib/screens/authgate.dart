import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ilabs_removal_app/screens/TodosPage.dart';

import '../amplifyconfiguration.dart';



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

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Successfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }
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