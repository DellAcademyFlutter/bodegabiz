import 'package:bodegabiz/app/modules/crud/submodules/crud_category/crud_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddCategoryPage extends StatefulWidget {
  static const routeName = '/AddCategory';

  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState
    extends ModularState<AddCategoryPage, CrudCategoryController> {
  TextEditingController nameController = TextEditingController();
  String name;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                child: ListTile(
                  title: TextFormField(
                    controller: nameController,
                    maxLines: null, // Necessario para entrada multilinha
                    keyboardType: TextInputType.multiline,
                    onChanged: (valor) => setState(() => name = valor),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Insira o nome da categoria',
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.save),
                    onPressed: null, //TODO,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
