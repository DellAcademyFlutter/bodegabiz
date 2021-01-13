import 'package:bodegabiz/app/controllers/category_controller.dart';
import 'package:bodegabiz/app/controllers/product_controller.dart';
import 'package:bodegabiz/app/modules/crud/crud_module.dart';
import 'package:bodegabiz/app/modules/home/pages/initial_page.dart';
import 'package:bodegabiz/app/modules/sell/sell_module.dart';
import 'package:bodegabiz/app/modules/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/side_menu_widget.dart';
import 'home_controller.dart';

/// View do modulo [Home].
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  final productController = Modular.get<ProductController>();
  final categoryController = Modular.get<CategoryController>();

  @override
  void initState() {
    super.initState();

    productController.initializeProducts();
    categoryController.initializeCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.isInHomePage ? AppBar() : null,
      drawer: SideMenuWidget(),
      body: Consumer<HomeController>(builder: (context, value) {
        return IndexedStack(
          index: controller.index,
          children: [
            RouterOutlet(module: SellModule()),
            InitialPage(),
            RouterOutlet(module: CrudModule()),
            SettingsPage(),
          ],
        );
      }),
    );
  }
}
