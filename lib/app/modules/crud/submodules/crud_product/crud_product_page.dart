import 'package:bodegabiz/app/controllers/product_controller.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_product/pages/add_product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/product_widget.dart';

class CrudProductPage extends StatefulWidget {
  @override
  _CrudProductPageState createState() => _CrudProductPageState();
}

class _CrudProductPageState
    extends ModularState<CrudProductPage, ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductController>(builder: (context, value) {
        return value.products != null
            ? value.products.isNotEmpty
                ? ListView.builder(
                    itemCount: value.products.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(index: index);
                    },
                  )
                : Center(child: Text('Nenhum produto cadastrado'))
            : Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(
            AddProductPage.routeName,
            arguments: AddProductPageArguments(product: null)),
        tooltip: 'Adicionar produto',
      ),
    );
  }
}
