// import 'package:amplify_api/amplify_api.dart';
// import 'package:amplify_datastore/amplify_datastore.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:flutter/material.dart';
// import 'package:ilabs_removal_app/main.dart';
//
// import '../amplifyconfiguration.dart';
// import '../models/ModelProvider.dart';
// import 'TodosPage.dart';
//
//
//
// class authgate extends StatefulWidget {
//   const authgate({Key? key}) : super(key: key);
//
//   @override
//   State<authgate> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<authgate> {
//   @override
//   void initState() {
//     super.initState();
//     _configureAmplify();
//   }
//
//   Future<void> _configureAmplify() async {
//     try {
//       final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
//       final AmplifyDataStore _dataStorePlugin =
//       AmplifyDataStore(modelProvider: ModelProvider.instance);
//       final AmplifyAPI _apiPlugin = AmplifyAPI();
//
//
//
//       await Amplify.addPlugins([_dataStorePlugin, _apiPlugin, _authPlugin]);
//
//
//       // call Amplify.configure to use the initialized categories in your app
//       await Amplify.configure(amplifyconfig);
//     } on Exception catch (e) {
//       print('An error occurred configuring Amplify: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: TodosPage(),
//     );
//   }
// }