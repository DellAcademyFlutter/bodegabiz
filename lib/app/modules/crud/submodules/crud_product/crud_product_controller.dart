import 'package:bodegabiz/app/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Classe controller do cadastro de [Product].
class CrudProductController implements Disposable {
  final nameController = TextEditingController();
  final currStockController = TextEditingController();
  final minStockController = TextEditingController();
  final unitCostController = TextEditingController();
  final unitSaleController = TextEditingController();
  final brandController = TextEditingController();
  final imageController = TextEditingController();
  final barcodeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    currStockController.dispose();
    minStockController.dispose();
    unitCostController.dispose();
    unitSaleController.dispose();
    brandController.dispose();
    imageController.dispose();
    barcodeController.dispose();
  }

  /// inicializa o [name].
  initializeName({@required Product product}) {
    switch (product) {
      case null:
        nameController.text = '';
        currStockController.text = '';
        minStockController.text = '';
        unitCostController.text = '';
        unitSaleController.text = '';
        brandController.text = '';
        imageController.text = '';
        barcodeController.text = '';
        break;
      default:
        nameController.text = product.name;
        currStockController.text = product.currStock.toString();
        minStockController.text = product.minStock.toString();
        unitCostController.text = product.unitCost.toString();
        unitSaleController.text = product.unitSale.toString();
        brandController.text = product.brand;
        imageController.text = product.image;
        barcodeController.text = product.barcode;
    }
  }
}
