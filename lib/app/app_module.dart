import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'controllers/category_controller.dart';
import 'controllers/item_sale_controller.dart';
import 'controllers/product_controller.dart';
import 'controllers/sale_controller.dart';
import 'modules/crud/crud_module.dart';
import 'modules/crud/submodules/crud_product/crud_product_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override

  /// Lista de injecoes de dependencia do projeto.
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => ProductController()),
        Bind((i) => CategoryController()),
        Bind((i) => SaleController()),
        Bind((i) => ItemSaleController()),
      ];

  @override

  /// Root Widget.
  Widget get bootstrap => AppWidget();

  @override

  /// Modulos associados a este aplicativo.
  List<ModularRouter> get routers => [
        ModularRouter(HomeModule.routeName, module: HomeModule()),
        ModularRouter(CrudModule.routeName, module: CrudModule()),
        ModularRouter(CrudProductModule.routeName, module: CrudProductModule()),
      ];
}
