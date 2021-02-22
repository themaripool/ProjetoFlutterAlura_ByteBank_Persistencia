import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(byteBankApp());
}

// ignore: camel_case_types
class byteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blueGrey[300],
          accentColor: Colors.cyan[50],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueGrey[300],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Dashboard());
  }
}

