import 'package:bytebank/DAO/contact_DAO.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//DAO -> Data Access Object

Future<Database> createDatabase() async {
  // so eecuta o resto do codigo assim q o await acabar
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(contactDAO.tableSQL);
    },
    version: 1, //da upgrade de versao e dps downgrade para executar o delete
    //remover dados bd
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}


