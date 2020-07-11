import 'package:flutter/material.dart';
import 'Login1.dart';
import 'Registration1.dart';
import 'Login2.dart';
import 'Login3.dart';
import 'Registration2.dart';
import 'Registration3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Login3.id,
      routes: {
        Login1.id: (context) => Login1(),
        Registration1.id: (context) => Registration1(),
        Login2.id: (context) => Login2(),
        Registration2.id: (context) => Registration2(),
        Registration3.id: (context) => Registration3(),
        Login3.id: (context) => Login3(),
    },

    );
  }
}
