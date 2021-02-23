import 'dart:math';

import 'package:bytebank/DAO/contact_DAO.dart';
import 'package:bytebank/Models/contacts.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget{

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final contactDAO _dao = contactDAO();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Contact"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nome Completo",
                ),
                style: TextStyle(fontSize: 24.0),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: "Número da conta",
                ),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                  child: RaisedButton(
                  onPressed: (){
                    var rng = new Random();
                    final String name = _nameController.text;
                    final int accountNumber = int.tryParse(_accountNumberController.text);

                    final Contact newContact = Contact(rng.nextInt(1000), name, accountNumber);
                    //salvar info no bd
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                    
                  },
                  child: Text('Criar Contato'),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}