import 'package:bodegabiz/app/models/product.dart';
import 'package:bodegabiz/app/repositories/local/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class ProductDao {
  /// Insere em registro [Product] em sua tabela, retornando seu id gerado.
  Future<int> insertProduct(Product product) async {
    try {
      final db = await DBHelper.getDatabase();
      int generatedId;

      // Espera inserir, entao retorna o id gerado.
      await db
          .insert(
            DBHelper.TABLE_PRODUCT_NAME,
            product.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          )
          .then((value) => generatedId = value);

      return generatedId;
    } catch (ex) {
      debugPrint("DBEXCEPTION: ${ex}");
    }
  }

  /// Atualiza um registro [Product].
  Future<void> updateProduct(Product product) async {
    final db = await DBHelper.getDatabase();

    await db.update(
      DBHelper.TABLE_PRODUCT_NAME,
      product.toMap(),
      where: "${DBHelper.PRODUCT_ID} = ?",
      whereArgs: [product.id],
    );
  }

  /// Deleta um registro [Product].
  Future<void> deleteProduct(int id) async {
    final db = await DBHelper.getDatabase();

    await db.delete(
      DBHelper.TABLE_PRODUCT_NAME,
      where: "${DBHelper.PRODUCT_ID} = ?",
      whereArgs: [id],
    );
  }

  /// Retorna a lista de todos os [Product]s.
  Future<List<Product>> getProducts() async {
    try {
      final db = await DBHelper.getDatabase();
      final maps = await db.query(DBHelper.TABLE_PRODUCT_NAME);

      final products = <Product>[];

      for (var i = 0; i < maps.length; i++) {
        if (maps[i][DBHelper.PRODUCT_ISDELETED] == 0) {
          products.add(Product.fromMap(map: maps[i]));
        }
      }
      return products;
    } catch (ex) {
      //print(ex);
      return <Product>[];
    }
  }

  /// Retorna a lista de todos os [Product]s filtrados por [Category].
  Future<List<Product>> getProductsByCategory(int categoryId) async {
    try {
      final db = await DBHelper.getDatabase();
      final maps = await db.query(DBHelper.TABLE_PRODUCT_NAME);

      final products = <Product>[];

      for (var i = 0; i < maps.length; i++) {
        if (maps[i][DBHelper.PRODUCT_CATEGORYID] == categoryId) {
          if (maps[i][DBHelper.PRODUCT_ISDELETED] == 0) {
            products.add(Product.fromMap(map: maps[i]));
          }
        }
      }
      return products;
    } catch (ex) {
      //print(ex);
      return <Product>[];
    }
  }
}
