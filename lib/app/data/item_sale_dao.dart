import 'package:bodegabiz/app/models/item_sale.dart';
import 'package:bodegabiz/app/repositories/local/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class ItemSaleDao {
  /// Insere em registro [ItemSale] em sua tabela.
  Future<void> insertItemSale(ItemSale itemSale) async {
    try {
      final db = await DBHelper.getDatabase();

      await db.insert(
        DBHelper.TABLE_ITEM_SALE_NAME,
        itemSale.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (ex) {
      debugPrint("DBEXCEPTION: ${ex}");
    }
  }

  /// Atualiza um registro [ItemSale].
  Future<void> updateItemSale(ItemSale itemSale) async {
    final db = await DBHelper.getDatabase();

    await db.update(
      DBHelper.TABLE_ITEM_SALE_NAME,
      itemSale.toMap(),
      where:
          "${DBHelper.ITEM_SALE_PRODUCTID} = ? AND ${DBHelper.ITEM_SALE_SALEID} = ?",
      whereArgs: [itemSale.productId, itemSale.saleId],
    );
  }

  /// Deleta um registro [ItemSale].
  Future<void> deleteItemSale(
      {@required int productId, @required int saleId}) async {
    final db = await DBHelper.getDatabase();

    await db.delete(
      DBHelper.TABLE_ITEM_SALE_NAME,
      where:
          "${DBHelper.ITEM_SALE_PRODUCTID} = ? AND ${DBHelper.ITEM_SALE_SALEID} = ?",
      whereArgs: [productId, saleId],
    );
  }

  /// Retorna a lista de todos os [ItemSale]s.
  Future<List<ItemSale>> getItemsSale() async {
    try {
      final db = await DBHelper.getDatabase();
      final maps = await db.query(DBHelper.TABLE_ITEM_SALE_NAME);

      final itemsSale = <ItemSale>[];

      for (var i = 0; i < maps.length; i++) {
        itemsSale.add(ItemSale.fromMap(map: maps[i]));
      }
      return itemsSale;
    } catch (ex) {
      //print(ex);
      return <ItemSale>[];
    }
  }

  /// Retorna a lista de todos os [ItemSale]s.
  Future<List<ItemSale>> getItemsSaleByProduct(int productId) async {
    try {
      final db = await DBHelper.getDatabase();
      final maps = await db.query(DBHelper.TABLE_ITEM_SALE_NAME);

      final itemsSale = <ItemSale>[];

      for (var i = 0; i < maps.length; i++) {
        if (maps[i][DBHelper.ITEM_SALE_PRODUCTID] == productId) {
          itemsSale.add(ItemSale.fromMap(map: maps[i]));
        }
      }
      return itemsSale;
    } catch (ex) {
      //print(ex);
      return <ItemSale>[];
    }
  }
}
