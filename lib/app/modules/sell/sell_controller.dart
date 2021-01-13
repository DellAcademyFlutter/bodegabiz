import 'package:flutter/cupertino.dart';

class SellController {
  final cartItemsCounter = ValueNotifier<int>(0);
  final monetaryChange = ValueNotifier<double>(0.0);

  /// Atribui valores iniciais.
  initialize() {
    cartItemsCounter.value = 0;
  }

  /// Incrementa o numero de items do carrinho.
  incrementCartItems() {
    cartItemsCounter.value = cartItemsCounter.value + 1;
  }

  /// Atualiza o valor do troco.
  updateMonetaryChange({double newValue}) {
    monetaryChange.value = newValue;
  }
}
