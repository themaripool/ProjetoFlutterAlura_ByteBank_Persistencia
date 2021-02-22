import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';

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
              child: Material(
                color: Theme.of(context).primaryColor,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactList(),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: 100,
                    width: 150,
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
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
