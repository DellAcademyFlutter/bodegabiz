import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // Nomes das tabelas.
  static const DATABASE_NAME = "bodegabiz.db";
  static const TABLE_PRODUCT_NAME = 'product';
  static const TABLE_CATEGORY_NAME = 'category';
  static const TABLE_SALE_NAME = 'sale';
  static const TABLE_ITEM_SALE_NAME = 'item_sale';

  // Atributos de [TABLE_PRODUCT_NAME].
  static const PRODUCT_ID = 'id';
  static const PRODUCT_NAME = 'name';
  static const PRODUCT_CURRSTOCK = 'currStock';
  static const PRODUCT_MINSTOCK = 'minStock';
  static const PRODUCT_UNITCOST = 'unitCost';
  static const PRODUCT_UNITSALE = 'unitSale';
  static const PRODUCT_BRAND = 'brand';
  static const PRODUCT_IMAGE = 'image';
  static const PRODUCT_BARCODE = 'barcode';
  static const PRODUCT_ISDELETED = 'isDeleted';
  static const PRODUCT_CATEGORYID = 'categoryId';

  // Atributos de [TABLE_CATEGORY_NAME].
  static const CATEGORY_ID = 'id';
  static const CATEGORY_NAME = 'name';

  // Atributos de [TABLE_SALE_NAME].
  static const SALE_ID = 'id';
  static const SALE_TOTALVALUE = 'totalValue';
  static const SALE_DISCOUNTVALUE = 'discountValue';
  static const SALE_DISCOUNTTYPE = 'discountType';
  static const SALE_DATE = 'date';
  static const SALE_HOUR = 'hour';
  static const SALE_WASPAID = 'wasPaid';

  // Atributos de [TABLE_ITEM_SALE_NAME].
  static const ITEM_SALE_PRODUCTID = ' productId';
  static const ITEM_SALE_SALEID = 'saleId';
  static const ITEM_SALE_QTT = 'qtt';
  static const ITEM_SALE_PRODCOSTATTHETIME = 'prodCostAtTheTime';
  static const ITEM_SALE_PRODSALEATTHETIME = 'prodSaleAtTheTime';

  // Scripts de criacao das tabelas.
  static const SCRIPT_CREATE_TABLE_PRODUCT_SQL =
      "CREATE TABLE IF NOT EXISTS '$TABLE_PRODUCT_NAME' ("
      "'$PRODUCT_ID' INTEGER NOT NULL,"
      "'$PRODUCT_NAME' TEXT NOT NULL,"
      "'$PRODUCT_CURRSTOCK' INTEGER NOT NULL,"
      "'$PRODUCT_MINSTOCK' INTEGER NOT NULL,"
      "'$PRODUCT_UNITCOST' REAL NOT NULL,"
      "'$PRODUCT_UNITSALE' REAL NOT NULL,"
      "'$PRODUCT_BRAND' TEXT,"
      "'$PRODUCT_IMAGE' TEXT,"
      "'$PRODUCT_BARCODE' TEXT,"
      "'$PRODUCT_ISDELETED BLOB NOT NULL,"
      "'$PRODUCT_CATEGORYID' INTEGER NOT NULL,"
      "PRIMARY KEY('$PRODUCT_ID' AUTOINCREMENT),"
      "FOREIGN KEY('$PRODUCT_CATEGORYID') REFERENCES '$TABLE_CATEGORY_NAME'('$CATEGORY_ID'))";

  static const SCRIPT_CREATE_TABLE_CATEGORY_SQL =
      "CREATE TABLE IF NOT EXISTS '$TABLE_CATEGORY_NAME' ("
      "'$CATEGORY_ID' INTEGER NOT NULL,"
      "'$CATEGORY_NAME' TEXT NOT NULL,"
      "PRIMARY KEY('$CATEGORY_ID' AUTOINCREMENT))";

  static const SCRIPT_CREATE_TABLE_SALE_SQL =
      "CREATE TABLE IF NOT EXISTS '$TABLE_SALE_NAME' ("
      "'$SALE_ID' INTEGER NOT NULL,"
      "'$SALE_TOTALVALUE' REAL NOT NULL,"
      "'$SALE_DATE' TEXT NOT NULL,"
      "'$SALE_HOUR' TEXT NOT NULL,"
      "'$SALE_DISCOUNTVALUE' REAL NOT NULL,"
      "'$SALE_DISCOUNTTYPE' TEXT NOT NULL,"
      "'$SALE_WASPAID' BLOB NOT NULL,"
      "PRIMARY KEY('$SALE_ID' AUTOINCREMENT))";

  static const SCRIPT_CREATE_TABLE_ITEM_SALE_SQL =
      "CREATE TABLE IF NOT EXISTS '$TABLE_ITEM_SALE_NAME' ("
      "'$ITEM_SALE_PRODUCTID' INTEGER NOT NULL,"
      "'$ITEM_SALE_SALEID' INTEGER NOT NULL,"
      "'$ITEM_SALE_QTT' INTEGER NOT NULL,"
      "'$ITEM_SALE_PRODCOSTATTHETIME' REAL NOT NULL,"
      "'$ITEM_SALE_PRODSALEATTHETIME' REAL NOT NULL,"
      "FOREIGN KEY('$ITEM_SALE_PRODUCTID') REFERENCES '$TABLE_PRODUCT_NAME'('$PRODUCT_ID'),"
      "FOREIGN KEY('$ITEM_SALE_SALEID') REFERENCES '$TABLE_SALE_NAME'('$SALE_ID'))";

  // Execucao dos scripts na inicializacao do banco.
  static Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) async {
        await db.execute(SCRIPT_CREATE_TABLE_PRODUCT_SQL);
        await db.execute(SCRIPT_CREATE_TABLE_CATEGORY_SQL);
        await db.execute(SCRIPT_CREATE_TABLE_SALE_SQL);
        await db.execute(SCRIPT_CREATE_TABLE_ITEM_SALE_SQL);
      },
      version: 1,
    );
  }
}
