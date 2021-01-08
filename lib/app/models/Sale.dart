import 'package:flutter/cupertino.dart';

class Sale {
  Sale(
      {this.id,
      this.totalValue,
      this.discountValue,
      this.discountType,
      this.date,
      this.hour,
      this.wasPaid});

  // Atributos.
  int id;
  double totalValue;
  double discountValue;
  String discountType;
  String date;
  String hour;
  bool wasPaid;

  // Construtor a partir de um map.
  Sale.fromMap({Map<String, dynamic> map}) {
    id = map['id'];
    totalValue = map['totalValue'];
    discountValue = map['discountValue'];
    discountType = map['discountType'];
    date = map['date'];
    hour = map['hour'];
    wasPaid = map['wasPaid'];
  }

  // Codifica este objeto em um map.
  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['totalValue'] = totalValue;
    data['discountValue'] = discountValue;
    data['discountType'] = discountType;
    data['date'] = date;
    data['hour'] = hour;
    data['wasPaid'] = wasPaid;
    return data;
  }

  // Copia os valores de outro objeto, do mesmo tipo, para este objeto.
  setValues({@required Sale otherSale}) {
    id = otherSale.id;
    totalValue = otherSale.totalValue;
    discountValue = otherSale.discountValue;
    discountType = otherSale.discountType;
    date = otherSale.date;
    hour = otherSale.hour;
    wasPaid = otherSale.wasPaid;
  }
}
