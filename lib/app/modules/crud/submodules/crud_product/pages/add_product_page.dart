import 'package:bodegabiz/app/models/product.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_product/components/crud_page_product_image_widget.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_product/components/select_category_widget.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_product/components/settings_popup_widget.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_product/crud_product_controller.dart';
import 'package:bodegabiz/app/shared/utils/regexps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddProductPageArguments {
  AddProductPageArguments({this.product});
  final Product product;
}

class AddProductPage extends StatefulWidget {
  static const routeName = '/AddProduct';

  AddProductPage({this.product});
  final Product product;

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState
    extends ModularState<AddProductPage, CrudProductController> {
  @override
  void initState() {
    super.initState();

    controller.initializeName(product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de produto'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              controller.saveProdut(
                name: controller.nameController.text,
                unitCost: double.parse(controller.unitCostController.text),
                unitSale: double.parse(controller.unitSaleController.text),
                currStock: int.parse(controller.currStockController.text),
                minStock: int.parse(controller.minStockController.text),
                image: controller.base64Image.value,
                product: widget.product,
              );
              Navigator.of(context).pop();
            },
          ),
          SettingsPopupMenu(),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              CrudPageProductImageWidget(product: widget.product),
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
              )),
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.currStockController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Estoque atual',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              )),
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.minStockController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Estoque mínimo',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              )),
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.unitSaleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor do venda da unidade',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(numTwoDecimalPlaces_regexp)),
                  ],
                ),
              )),
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.unitCostController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor do custo da unidade',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(numTwoDecimalPlaces_regexp)),
                  ],
                ),
              )),
              SelectCategoryWidget(),
            ],
          )),
    );
  }
}
