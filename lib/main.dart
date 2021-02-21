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
        home: Dashboard());
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ByteBank App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset("images/bytebank_logo.png"),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                height: 100,
                width: 150,
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.people, color: Colors.black, size: 24.0),
                    Text(
                      "Contacts",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
