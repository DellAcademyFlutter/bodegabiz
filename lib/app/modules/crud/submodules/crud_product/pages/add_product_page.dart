import 'package:bodegabiz/app/models/product.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              //TODO;
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira o nome do produto',
                  ),
                ),
              )),
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.currStockController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o estoque atual do produto',
                  ),
                ),
              )),
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.minStockController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o estoque mínimo do produto',
                  ),
                ),
              )),
              Container(
                  child: ListTile(
                title: TextFormField(
                  controller: controller.unitCostController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o valor do custo da unidade do produto',
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
                  controller: controller.unitSaleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o valor do preço de venda do produto',
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
                  controller: controller.brandController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite a marca do produto',
                  ),
                ),
              )),
            ],
          )),
    );
  }
}

// TODO: double.parse(valor)), pega o valor
