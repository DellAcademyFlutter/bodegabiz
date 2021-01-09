import 'package:bodegabiz/app/models/sale.dart';
import 'package:bodegabiz/app/repositories/local/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class SaleDao {
  /// Insere em registro [Sale] em sua tabela, retornando seu id gerado.
  Future<int> insertSale(Sale sale) async {
    try {
      final db = await DBHelper.getDatabase();
      int generatedId;

      // Espera inserir, entao retorna o id gerado.
      await db
          .insert(
            DBHelper.TABLE_SALE_NAME,
            sale.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          )
          .then((value) => generatedId = value);

      return generatedId;
    } catch (ex) {
      debugPrint("DBEXCEPTION: ${ex}");
    }
  }

  /// Atualiza um registro [Sale].
  Future<void> updateSale(Sale sale) async {
    final db = await DBHelper.getDatabase();

    await db.update(
      DBHelper.TABLE_SALE_NAME,
      sale.toMap(),
      where: "${DBHelper.SALE_ID} = ?",
      whereArgs: [sale.id],
    );
  }

  /// Deleta um registro [Sale].
  Future<void> deleteSale(int id) async {
    final db = await DBHelper.getDatabase();

    await db.delete(
      DBHelper.TABLE_SALE_NAME,
      where: "${DBHelper.SALE_ID} = ?",
      whereArgs: [id],
    );
  }

  /// Retorna a lista de todos os [Sale]s.
  Future<List<Sale>> getSales() async {
    try {
      final db = await DBHelper.getDatabase();
      final maps = await db.query(DBHelper.TABLE_SALE_NAME);

      final sales = <Sale>[];

      for (var i = 0; i < maps.length; i++) {
        sales.add(Sale.fromMap(map: maps[i]));
      }
      return sales;
    } catch (ex) {
      //print(ex);
      return <Sale>[];
    }
  }
}
