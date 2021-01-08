import 'package:bodegabiz/app/data/category_dao.dart';
import 'package:bodegabiz/app/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryController extends ChangeNotifier {
  List<Category> categories = [];
  final categoryDao = Modular.get<CategoryDao>();

  /// Adiciona um [Category].
  addCategory(Category category) async {
    await categoryDao
        .insertCategory(category)
        .then((value) => category.id = value);
    categories.add(category);

    notifyListeners();
  }

  /// Atualiza um [Category].
  updateCategory(Category category) async {
    await categoryDao.updateCategory(category);
    categories[getCategoryIndexById(category.id)]
        .setValues(otherCategory: category);

    notifyListeners();
  }

  /// Remove um [Category].
  removePermanentlyCategory(Category category) async {
    await categoryDao.deleteCategory(category.id);
    categories.remove(category);

    notifyListeners();
  }

  /// Retorna o index de um [Category] dado seu [id].
  getCategoryIndexById(int id) {
    for (var i = 0; i < categories.length; i++) {
      if (categories[i].id == id) {
        return i;
      }
    }
    return -1;
  }
}
