import 'package:bodegabiz/app/data/product_dao.dart';
import 'package:bodegabiz/app/models/product.dart';
import 'package:bodegabiz/app/shared/utils/math_utils.dart';
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

  /// Remove [Product]s marcados por removido.
  removeProductCategory(int categoryId) async {
    // Certifica-se de obter todos os produtos.
    List<Product> productsAux;
    await productDao.getProducts().then((value) => productsAux = value);

    for (var i = 0; i < productsAux.length; i++) {
      if (productsAux[i].categoryId == categoryId) {
        productsAux[i].categoryId = -1;
        await updateProduct(productsAux[i]);
      }
    }
  }

  /// Remove permanentemente um [Product].
  removePermanentlyProduct(Product product) async {
    await productDao.deleteProduct(product.id);
    products.remove(product);

    notifyListeners();
  }

  /// Inicializa com todos [Product]s.
  initializeProducts() async {
    await productDao.getProducts().then((value) => products = value);

    notifyListeners();
  }

  /// Incrementa a quantidade de um [Product].
  increment(Product product) async {
    product.currStock++;
    await updateProduct(product);
  }

  /// Decrementa a quantidade de um [Product].
  decrement(Product product) async {
    if (product.currStock > 0) {
      product.currStock--;
      await updateProduct(product);
    }
  }

  /// Retorna o valor do lucro de um produto.
  getProductProfit(Product product) {
    return MathUtils.round(
        number: product.unitSale - product.unitCost, decimalPlaces: 2);
  }

  /// Retorna o percentual do lucro de um produto.
  getProductProfitPercent(Product product) {
    return MathUtils.round(
        number: (getProductProfit(product) * 100) / product.unitCost,
        decimalPlaces: 2);
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
