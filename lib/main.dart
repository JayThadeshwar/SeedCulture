import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'route/Router.dart';
import 'Constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeedCulture',
      onGenerateRoute : MyRouter.generateRoute,
      initialRoute: splashRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

