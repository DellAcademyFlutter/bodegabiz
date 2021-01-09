import 'package:flutter/cupertino.dart';

/// Classe Controller do modulo [Home].
class HomeController extends ChangeNotifier {
  var index = 0;
  bool isInHomePage = true;

  changeIndex({int newIndex}) {
    index = newIndex;
    isInHomePage = index == 0;

    notifyListeners();
  }
}
