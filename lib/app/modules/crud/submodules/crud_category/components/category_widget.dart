import 'package:bodegabiz/app/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({this.index});
  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final categoryController = Modular.get<CategoryController>();

  final _nameController = TextEditingController();
  bool _isEditing;

  @override
  void initState() {
    super.initState();
    _nameController.text = categoryController.categories[widget.index].name;
    _isEditing = false;
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = categoryController.categories[widget.index].name;

    return ListTile(
      leading: Icon(Icons.label),
      title: TextFormField(
        controller: _nameController,
        readOnly: !_isEditing,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: Icon(_isEditing ? Icons.save : Icons.edit),
              onPressed: () => setState(() => _changeMode())),
          IconButton(
              icon: Icon(Icons.delete), onPressed: () => _deleteCategory()),
        ],
      ),
    );
  }

  /// Alterna para o modo edicao.
  _changeMode() {
    if (_isEditing) {
      final editedCategory = categoryController.categories[widget.index];
      editedCategory.name = _nameController.text;
      categoryController.updateCategory(editedCategory);
    }
    _isEditing = !_isEditing;
  }

  /// Deleta [Category].
  _deleteCategory() {
    categoryController
        .removeCategory(categoryController.categories[widget.index]);
    _nameController.text = categoryController.categories[widget.index].name;
  }
}
