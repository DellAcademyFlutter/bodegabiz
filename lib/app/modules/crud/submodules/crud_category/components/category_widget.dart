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

  TextEditingController nameController = TextEditingController();
  String name;
  bool isEditing;

  @override
  void initState() {
    super.initState();
    nameController.text = categoryController.categories[widget.index].name;
    name = nameController.text;
    isEditing = false;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<CategoryController>(
        builder: (context, value) {
          nameController.text =
              categoryController.categories[widget.index].name;
          name = nameController.text;

          return ListTile(
            leading: Icon(Icons.label),
            title: TextFormField(
              controller: nameController,
              readOnly: !isEditing,
              onChanged: (value) => name = value,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: Icon(isEditing ? Icons.save : Icons.edit),
                    onPressed: () => setState(() => _changeMode())),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteCategory()),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Alterna para o modo edicao.
  _changeMode() {
    if (isEditing) {
      final editedCategory = categoryController.categories[widget.index];
      editedCategory.name = name;
      categoryController.updateCategory(editedCategory);
    }
    isEditing = !isEditing;
  }

  /// Deleta [Category].
  _deleteCategory() {
    categoryController
        .removeCategory(categoryController.categories[widget.index]);
    nameController.text = categoryController.categories[widget.index].name;
  }
}
