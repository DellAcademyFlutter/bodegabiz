import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'crud_controller.dart';
import 'submodules/crud_category/crud_category_module.dart';
import 'submodules/crud_product/crud_product_module.dart';

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends ModularState<CrudPage, CrudController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: [
          RouterOutlet(
            module: CrudProductModule(),
          ),
          RouterOutlet(
            module: CrudCategoryModule(),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller.pageViewController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            currentIndex: controller.pageViewController?.page?.round() ?? 0,
            onTap: (index) {
              controller.pageViewController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Produto",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Categoria",
              ),
            ],
          );
        },
      ),
    );
  }
}
