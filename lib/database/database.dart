import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class DatabaseConection {
  String databaseName = "contato.db";
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, databaseName);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE contato (id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "nome TEXT, "
          "celular TEXT, "
          "email TEXT, "
          "foto TEXT)");
    });
  }

}
