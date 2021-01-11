import 'package:bodegabiz/app/controllers/category_controller.dart';
import 'package:bodegabiz/app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../crud_product_controller.dart';

class SelectCategoryWidget extends StatefulWidget {
  @override
  _SelectCategoryWidgetState createState() => _SelectCategoryWidgetState();
}

class _SelectCategoryWidgetState extends State<SelectCategoryWidget> {
  final categoryController = Modular.get<CategoryController>();
  final crudProductController = Modular.get<CrudProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<CategoryController>(
        builder: (context, value) {
          return categoryController.categories != null
              ? DropdownButton(
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  hint: Text('Escolha uma categoria'),
                  value: crudProductController.selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      crudProductController.selectedCategory = newValue;
                    });
                  },
                  items: _buildItemsList(),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  List<DropdownMenuItem<Category>> _buildItemsList() {
    final listItems = categoryController.categories.map((category) {
      return DropdownMenuItem(
        child: Center(child: Center(child: Text(category.name))),
        value: category,
      );
    }).toList();

    listItems.insert(
        0,
        DropdownMenuItem(
          child: Center(child: Center(child: Text('Escolha uma Categoria'))),
          value: null,
        ));

    return listItems;
  }
}
