import 'package:flutter/cupertino.dart';

class Category {
  // Construtor.
  Category({this.id, this.name});

  // Atributos.
  int id;
  String name;

  // Construtor a partir de um map.
  Category.fromMap({Map<String, dynamic> map}) {
    id = map['id'];
    name = map['name'];
  }

  // Codifica este objeto em um map.
  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  // Copia os valores de outro objeto, do mesmo tipo, para este objeto.
  setValues({@required Category otherCategory}) {
    id = otherCategory.id;
    name = otherCategory.name;
  }
}
