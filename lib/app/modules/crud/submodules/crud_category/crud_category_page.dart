import 'package:bodegabiz/app/modules/crud/submodules/crud_category/pages/add_category.dart';
import 'package:flutter/material.dart';

class CrudCategoryPage extends StatefulWidget {
  @override
  _CrudCategoryPageState createState() => _CrudCategoryPageState();
}

class _CrudCategoryPageState extends State<CrudCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('CRUD categoria'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Navigator.of(context).pushNamed(AddCategoryPage.routeName),
        tooltip: 'Adicionar categoria',
      ),
    );
  }
}
