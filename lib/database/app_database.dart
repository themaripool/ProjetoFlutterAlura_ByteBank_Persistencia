import 'package:bytebank/Models/contacts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY, '
          'name TEXT, '
        'account_number INTEGER)');
    }, 
    version: 1, //da upgrade de versao e dps downgrade para executar o delete
    //remover dados bd
    //onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

//funcao que salva o contato no banco de dados
Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.account_number;
    return db.insert('contacts', contactMap);
  });
}

//funcao que acha todos os contatos
Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = List();
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}