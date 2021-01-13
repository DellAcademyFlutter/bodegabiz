import 'package:bodegabiz/app/controllers/product_controller.dart';
import 'package:bodegabiz/app/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/cart_icon_widget.dart';
import 'components/product_to_cart_widget.dart';
import 'sell_controller.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends ModularState<SellPage, SellController> {
  final productController = Modular.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductController>(
        builder: (context, value) {
          return GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            mainAxisSpacing: 0,
            crossAxisSpacing: 8,
            children: productController.products
                .map<ProductToCartWidget>(
                    (Product product) => ProductToCartWidget(product: product))
                .toList(),
          );
        },
      ),
      floatingActionButton: CartIconWidget(),
    );
  }
}
