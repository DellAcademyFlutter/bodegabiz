import 'package:bodegabiz/app/models/category.dart';
import 'package:bodegabiz/app/repositories/local/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class CategoryDao {
  /// Insere em registro [Category] em sua tabela, retornando seu id gerado.
  Future<int> insertCategory(Category category) async {
    try {
      final db = await DBHelper.getDatabase();
      int generatedId;

      // Espera inserir, entao retorna o id gerado.
      await db
          .insert(
            DBHelper.TABLE_CATEGORY_NAME,
            category.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          )
          .then((value) => generatedId = value);

      return generatedId;
    } catch (ex) {
      debugPrint("DBEXCEPTION: ${ex}");
    }
  }

  /// Atualiza um registro [Category].
  Future<void> updateCategory(Category category) async {
    final db = await DBHelper.getDatabase();

    await db.update(
      DBHelper.TABLE_CATEGORY_NAME,
      category.toMap(),
      where: "'${DBHelper.CATEGORY_ID}' = ?",
      whereArgs: [category.id],
    );
  }

  /// Deleta um registro [Category].
  Future<void> deleteCategory(int id) async {
    final db = await DBHelper.getDatabase();

    await db.delete(
      DBHelper.TABLE_CATEGORY_NAME,
      where: "'${DBHelper.CATEGORY_ID}' = ?",
      whereArgs: [id],
    );
  }

  /// Retorna a lista de todos os [Category]s.
  Future<List<Category>> getCategories() async {
    try {
      final db = await DBHelper.getDatabase();
      final maps = await db.query(DBHelper.TABLE_CATEGORY_NAME);

      final categorys = <Category>[];

      for (var i = 0; i < maps.length; i++) {
        categorys.add(Category.fromMap(map: maps[i]));
      }
      return categorys;
    } catch (ex) {
      //print(ex);
      return <Category>[];
    }
  }
}
