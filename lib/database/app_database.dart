import 'package:bytebank/Models/contacts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  // so eecuta o resto do codigo assim q o await acabar
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1, //da upgrade de versao e dps downgrade para executar o delete
    //remover dados bd
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}

//funcao que salva o contato no banco de dados
Future<int> save(Contact contact) async {
  final Database db = await createDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['id'] = contact.id;
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.account_number;
  return db.insert('contacts', contactMap);
}

//funcao que acha todos os contatos
Future<List<Contact>> findAll() async {
  final Database db = await createDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contact> contacts = List();

  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      row['id'],
      row['name'],
      row['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
}
