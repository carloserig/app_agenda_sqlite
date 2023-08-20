import 'package:app_agenda/database/database.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contato.dart';

class ContatoRepository extends DatabaseConection {

  final String table = "contato";

  // Adicionar
  Future<int> addContato(Contato contato) async {
    final Database database = await init();
    return database.insert(
      table,
      contato.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  // Alterar item
  Future<int> updateContato(
      Contato contato) async {
    Database database = await init();
    return await database.update(table, contato.toMap(),
        where: "id = ?", whereArgs: [contato.id]);
  }

  // Deletar
  Future<int> deletarContato(int id) async {
    Database database = await init();
    return await database
        .delete(table, where: "id = ?", whereArgs: [id]);
  }

  // Listar todos
  Future<List<Contato>> buscarTodosContatos() async {
    Database database = await init();
    List listMap = await database.rawQuery("SELECT * FROM $table");
    List<Contato> listContatos = [];
    for (Map<String, dynamic> m in listMap) {
      listContatos.add(Contato.fromMap(m));
    }
    return listContatos;
  }
}
