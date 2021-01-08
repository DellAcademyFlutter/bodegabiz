import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CrudController implements Disposable {
  final pageViewController = PageController(); // Herda com ChangeNotifier

  @override
  void dispose() {
    pageViewController.dispose();
  }
}
