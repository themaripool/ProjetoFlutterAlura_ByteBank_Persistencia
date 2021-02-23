import 'package:bytebank/Models/contacts.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

// ignore: camel_case_types
class contactDAO {

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account = 'account_number';

  static const String tableSQL = 'CREATE TABLE $_tableName('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER)';

  

//funcao que salva o contato no banco de dados
  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = toMap(contact);
    return db.insert('contacts', contactMap);
  }

  Map<String, dynamic> toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_id] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_account] = contact.account_number;
    return contactMap;
  }

//funcao que acha todos os contatos
  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = toList(result);
    return contacts;
  }

  List<Contact> toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_account],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
