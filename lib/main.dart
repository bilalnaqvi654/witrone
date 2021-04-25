import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wiretronoriginal/pages/home.dart';
import 'package:wiretronoriginal/pages/login.dart';

import 'package:wiretronoriginal/pages/register.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Wire Tron',
      // initialRoute:'/',
      // onGenerateRoute:Routes.generate,
      home: HomePage(),
    );
  }
}
