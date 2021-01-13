import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/CartPage';

  @override
  _CartPageState createState() => _CartPageState();
}

// TODO: cart page: appBar - ListView de Items_Venda, row Dinheiro e Troco e botao finalizar.
class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Finalizar venda'),
        icon: Icon(Icons.monetization_on),
        backgroundColor: Colors.green,
        onPressed: null,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
