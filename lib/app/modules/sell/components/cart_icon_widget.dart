import 'package:badges/badges.dart';
import 'package:bodegabiz/app/modules/sell/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../sell_controller.dart';

class CartIconWidget extends StatefulWidget {
  @override
  _CartIconWidgetState createState() => _CartIconWidgetState();
}

class _CartIconWidgetState extends State<CartIconWidget> {
  final controller = Modular.get<SellController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: ValueListenableBuilder(
          valueListenable: controller.cartItemsCounter,
          builder: (context, value, child) {
            return Badge(
              badgeContent: Text('${controller.cartItemsCounter.value}'),
              child: Icon(Icons.shopping_cart),
              position: BadgePosition.topStart(
                  start: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.03 * -1),
              animationType: BadgeAnimationType.slide,
            );
          },
        ),
        onPressed: () {
          controller.incrementCartItems();
          Navigator.of(context).pushNamed(CartPage.routeName);
        });
  }
}
