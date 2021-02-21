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
        primaryColor: Colors.cyan[50],
        accentColor: Colors.blueGrey[300],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueGrey[300],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("ByteBank App"),),
        body: Text("My Body"),
      ),
    );
  }
}






