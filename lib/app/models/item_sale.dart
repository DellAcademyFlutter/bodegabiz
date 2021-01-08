import 'package:flutter/cupertino.dart';

class ItemSale {
  ItemSale(this.productId, this.saleId, this.qtt, this.prodCostAtTheTime,
      this.prodSaleAtTheTime);

  // Atributos.
  int productId;
  int saleId;
  int qtt;
  int prodCostAtTheTime; // Valor de custo do produto no momento da compra.
  int prodSaleAtTheTime;// Valor de venda do produto no momento da compra.

  // Construtor a partir de um map.
  ItemSale.fromMap({Map<String, dynamic> map}) {
    productId = map['productId'];
    saleId = map['saleId'];
    qtt = map['qtt'];
    prodCostAtTheTime = map['prodCostAtTheTime'];
    prodSaleAtTheTime = map['prodSaleAtTheTime'];
  }

  // Codifica este objeto em um map.
  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['productId'] = productId;
    data['saleId'] = saleId;
    data['qtt'] = qtt;
    data['prodCostAtTheTime'] = prodCostAtTheTime;
    data['prodSaleAtTheTime'] = prodSaleAtTheTime;
    return data;
  }

  // Copia os valores de outro objeto, do mesmo tipo, para este objeto.
  setValues({@required ItemSale otherItemSale}) {
    productId = otherItemSale.productId;
    saleId = otherItemSale.saleId;
    qtt = otherItemSale.qtt;
    prodCostAtTheTime = otherItemSale.prodCostAtTheTime;
    prodSaleAtTheTime = otherItemSale.prodSaleAtTheTime;
  }
}
