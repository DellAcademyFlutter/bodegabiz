import 'package:bodegabiz/app/controllers/category_controller.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_category/components/category_widget.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_category/pages/add_category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CrudCategoryPage extends StatefulWidget {
  @override
  _CrudCategoryPageState createState() => _CrudCategoryPageState();
}

class _CrudCategoryPageState extends State<CrudCategoryPage> {
  final categoryController = Modular.get<CategoryController>();

  @override
  void initState() {
    super.initState();
    categoryController.initializeCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CategoryController>(builder: (context, value) {
        return categoryController.categories != null
            ? categoryController.categories.isNotEmpty
                ? ListView.separated(
                    itemCount: categoryController.categories.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return CategoryWidget(index: index);
                    },
                  )
                : Center(child: Text('Nenhuma categoria cadastrada'))
            : Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Navigator.of(context).pushNamed(AddCategoryPage.routeName),
        tooltip: 'Adicionar categoria',
      ),
    );
  }
}
