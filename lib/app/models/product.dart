import 'package:flutter/cupertino.dart';

class Product {
  // Construtor.
  Product(
      {this.id,
      this.name,
      this.currStock,
      this.minStock,
      this.unitCost,
      this.unitSale,
      this.brand,
      this.image,
      this.barcode,
      this.isDeleted,
      this.categoryId});

  // Atributos.
  int id;
  String name;
  int currStock;
  int minStock;
  double unitCost;
  double unitSale;
  String brand;
  String image;
  String barcode;
  bool isDeleted;
  int categoryId;

  // Construtor a partir de um map.
  Product.fromMap({Map<String, dynamic> map}) {
    id = map['id'];
    name = map['name'];
    currStock = map['currStock'];
    minStock = map['minStock'];
    unitCost = map['unitCost'];
    unitSale = map['unitSale'];
    brand = map['brand'];
    image = map['image'];
    barcode = map['barcode'];
    isDeleted = map['isDeleted'] == '1';
    categoryId = map['categoryId'];
  }

  // Codifica este objeto em um map.
  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['currStock'] = currStock;
    data['minStock'] = minStock;
    data['unitCost'] = unitCost;
    data['unitSale'] = unitSale;
    data['brand'] = brand;
    data['image'] = image;
    data['barcode'] = barcode;
    data['isDeleted'] = isDeleted ? 1 : 0;
    data['categoryId'] = categoryId;
    return data;
  }

  // Copia os valores de outro objeto, do mesmo tipo, para este objeto.
  setValues({@required Product otherProduct}) {
    id = otherProduct.id;
    name = otherProduct.name;
    currStock = otherProduct.currStock;
    minStock = otherProduct.minStock;
    unitCost = otherProduct.unitCost;
    unitSale = otherProduct.unitSale;
    brand = otherProduct.brand;
    image = otherProduct.image;
    barcode = otherProduct.barcode;
    isDeleted = otherProduct.isDeleted;
    categoryId = otherProduct.categoryId;
  }
}
