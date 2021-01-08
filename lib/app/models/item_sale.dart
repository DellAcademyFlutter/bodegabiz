import 'package:flutter/cupertino.dart';

class ItemSale {
  ItemSale(this.productId, this.saleId, this.qtt, this.prodCostValue,
      this.prodSaleValue);

  // Atributos.
  int productId;
  int saleId;
  int qtt;
  int prodCostValue; // Valor do produto no momento da compra.
  int prodSaleValue;

  // Construtor a partir de um map.
  ItemSale.fromMap({Map<String, dynamic> map}) {
    productId = map['productId'];
    saleId = map['saleId'];
    qtt = map['qtt'];
    prodCostValue = map['prodCostValue'];
    prodSaleValue = map['prodSaleValue'];
  }

  // Codifica este objeto em um map.
  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['productId'] = productId;
    data['saleId'] = saleId;
    data['qtt'] = qtt;
    data['prodCostValue'] = prodCostValue;
    data['prodSaleValue'] = prodSaleValue;
    return data;
  }

  // Copia os valores de outro objeto, do mesmo tipo, para este objeto.
  setValues({@required ItemSale otherItemSale}) {
    productId = otherItemSale.productId;
    saleId = otherItemSale.saleId;
    qtt = otherItemSale.qtt;
    prodCostValue = otherItemSale.prodCostValue;
    prodSaleValue = otherItemSale.prodSaleValue;
  }
}
