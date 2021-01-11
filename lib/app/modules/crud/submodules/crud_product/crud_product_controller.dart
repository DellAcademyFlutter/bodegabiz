import 'dart:io';

import 'package:bodegabiz/app/controllers/category_controller.dart';
import 'package:bodegabiz/app/controllers/product_controller.dart';
import 'package:bodegabiz/app/models/category.dart';
import 'package:bodegabiz/app/models/product.dart';
import 'package:bodegabiz/app/shared/utils/image_picker_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Classe controller do cadastro de [Product].
class CrudProductController implements Disposable {
  final productController = Modular.get<ProductController>();
  final categoryController = Modular.get<CategoryController>();

  final nameController = TextEditingController();
  final currStockController = TextEditingController();
  final minStockController = TextEditingController();
  final unitCostController = TextEditingController();
  final unitSaleController = TextEditingController();
  final barcodeController = TextEditingController();
  final image = ValueNotifier<File>(null);
  final base64Image = ValueNotifier('');
  Category selectedCategory;

  @override
  void dispose() {
    nameController.dispose();
    currStockController.dispose();
    minStockController.dispose();
    unitCostController.dispose();
    unitSaleController.dispose();
    barcodeController.dispose();
  }

  /// inicializa os valores das variaveis de controle.
  initializeName({@required Product product}) {
    switch (product) {
      case null:
        nameController.text = '';
        currStockController.text = '';
        minStockController.text = '';
        unitCostController.text = '';
        unitSaleController.text = '';
        barcodeController.text = '';
        selectedCategory = null;
        break;
      default:
        nameController.text = product.name;
        currStockController.text = product.currStock.toString();
        minStockController.text = product.minStock.toString();
        unitCostController.text = product.unitCost.toString();
        unitSaleController.text = product.unitSale.toString();
        barcodeController.text = product.barcode;
        base64Image.value = product.image;
        selectedCategory =
            categoryController.getCategoryById(product.categoryId);
    }
  }

  /// Atualiza a imagem inserida.
  void setImageValue({@required File imageFile}) {
    image.value = imageFile;
    base64Image.value =
        ImagePickerUtils.getBase64ImageFromFileImage(pickedFile: imageFile);
  }

  /// Salva o [Product] cadastrado.
  void saveProdut(
      {@required String name,
      @required int currStock,
      @required int minStock,
      @required double unitCost,
      @required double unitSale,
      @required String image,
      @required Product product}) {
    final newProduct = Product(
      id: product?.id,
      name: name,
      currStock: currStock,
      minStock: minStock,
      unitCost: unitCost,
      unitSale: unitSale,
      image: image,
      brand: (product == null) ? '' : product.brand,
      barcode: (product == null) ? '' : product.barcode,
      categoryId: selectedCategory?.id ?? -1,
      isDeleted: false,
    );

    (product == null)
        ? productController.addProduct(newProduct)
        : productController.updateProduct(newProduct);
  }
}
