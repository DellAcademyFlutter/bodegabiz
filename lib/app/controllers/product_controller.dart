import 'package:bodegabiz/app/data/product_dao.dart';
import 'package:bodegabiz/app/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductController extends ChangeNotifier {
  List<Product> products = [];
  final productDao = Modular.get<ProductDao>();

  /// Adiciona um [Product].
  addProduct(Product product) async {
    await productDao.insertProduct(product).then((value) => product.id = value);
    products.add(product);

    notifyListeners();
  }

  /// Atualiza um [Product].
  updateProduct(Product product) async {
    await productDao.updateProduct(product);
    products[getProductIndexById(product.id)].setValues(otherProduct: product);

    notifyListeners();
  }

  /// Remove um [Product] o marcando como removido.
  removeProduct(Product product) async {
    product.isDeleted = true;
    await productDao.updateProduct(product);
    products.remove(product);

    notifyListeners();
  }

  /// Remove permanentemente um [Product].
  removePermanentlyProduct(Product product) async {
    await productDao.deleteProduct(product.id);
    products.remove(product);

    notifyListeners();
  }

  /// Retorna o index de um [Product] dado seu [id].
  getProductIndexById(int id) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].id == id) {
        return i;
      }
    }
    return -1;
  }
}
