import 'package:flutter/cupertino.dart';

/// Classe Controller do modulo [Home].
class HomeController extends ChangeNotifier {
  var index = 0;

  changeIndex({int newIndex}) {
    index = newIndex;

    notifyListeners();
  }
}
