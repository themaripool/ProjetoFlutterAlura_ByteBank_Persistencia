import 'package:bytebank/Models/contacts.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de contatos"),
      ),
      body: FutureBuilder<List<Contact>>(
        //primero executa esse future e assim que receber resposta
        // executa o codigo do builder aonde esta o callback
        //snapshot -> contem todas as informacoes do future acima dele
        initialData: List(),
        future: findAll(),
        builder: (context, snapshot) {
          //snapshot.connectionState) -> indica atual estado do snapshot
          switch (snapshot.connectionState) {
            case ConnectionState.none: //future ainda n executado
              break;
            case ConnectionState
                .waiting: //verificando se future esta carregando
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text("carregando")],
                ),
              );
              break;
            case ConnectionState
                .active: //tem dado disponivel mas future n acabou
              // carregamento por partes
              break;
            case ConnectionState.done: // future acabou
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text(
              "Erro desconhecido"); //nao sera executado pq o snapshot ja tem todos os casos possiveis
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.account_number.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
