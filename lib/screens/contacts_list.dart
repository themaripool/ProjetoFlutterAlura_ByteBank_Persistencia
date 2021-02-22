import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de contatos"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text("Alex",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text("Conta: 122345-1", style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactForm(),
          )).then((newContact) => debugPrint(newContact.toString()),);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
