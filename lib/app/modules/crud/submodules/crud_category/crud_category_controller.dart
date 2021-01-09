import 'package:bodegabiz/app/controllers/category_controller.dart';
import 'package:bodegabiz/app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Classe controller.
class CrudCategoryController implements Disposable {
  final categoryController = Modular.get<CategoryController>();

  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
  }

  /// inicializa o [name].
  initializeName() {
    nameController.text = '';
  }

  /// Salva uma [Category].
  saveCategory({String name}) {
    final category = Category(name: name);
    categoryController.addCategory(category);
  }

  /// Atualiza uma [Category].
  updateCategory({Category category}) {
    categoryController.updateCategory(category);
  }
}
