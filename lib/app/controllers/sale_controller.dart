import 'package:bodegabiz/app/data/sale_dao.dart';
import 'package:bodegabiz/app/models/sale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SaleController extends ChangeNotifier {
  List<Sale> sales = [];
  final saleDao = Modular.get<SaleDao>();

  /// Adiciona um [Sale].
  addSale(Sale sale) async {
    await saleDao.insertSale(sale).then((value) => sale.id = value);
    sales.add(sale);

    notifyListeners();
  }

  /// Atualiza um [Sale].
  updateSale(Sale sale) async {
    await saleDao.updateSale(sale);
    sales[getSaleIndexById(sale.id)].setValues(otherSale: sale);

    notifyListeners();
  }

  /// Remove um [Sale].
  removePermanentlySale(Sale sale) async {
    await saleDao.deleteSale(sale.id);
    sales.remove(sale);

    notifyListeners();
  }

  /// Retorna o index de um [Sale] dado seu [id].
  getSaleIndexById(int id) {
    for (var i = 0; i < sales.length; i++) {
      if (sales[i].id == id) {
        return i;
      }
    }
    return -1;
  }
}
