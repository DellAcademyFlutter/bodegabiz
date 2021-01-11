import 'package:bodegabiz/app/controllers/user_settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'controllers/category_controller.dart';
import 'controllers/item_sale_controller.dart';
import 'controllers/product_controller.dart';
import 'controllers/sale_controller.dart';
import 'data/category_dao.dart';
import 'data/item_sale_dao.dart';
import 'data/product_dao.dart';
import 'data/sale_dao.dart';
import 'modules/crud/crud_module.dart';
import 'modules/crud/submodules/crud_category/crud_category_module.dart';
import 'modules/crud/submodules/crud_product/crud_product_module.dart';
import 'modules/home/home_module.dart';
import 'modules/sale/sale_module.dart';
import 'modules/settings/settings_module.dart';

class AppModule extends MainModule {
  @override

  /// Lista de injecoes de dependencia do projeto.
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => ProductController()),
        Bind((i) => CategoryController()),
        Bind((i) => SaleController()),
        Bind((i) => ItemSaleController()),
        Bind((i) => UserSettingsController()),
        Bind((i) => ProductDao()),
        Bind((i) => CategoryDao()),
        Bind((i) => SaleDao()),
        Bind((i) => ItemSaleDao()),
      ];

  @override

  /// Root Widget.
  Widget get bootstrap => AppWidget();

  @override

  /// Modulos associados a este aplicativo.
  List<ModularRouter> get routers => [
        ModularRouter(HomeModule.routeName, module: HomeModule()),
        ModularRouter(CrudModule.routeName, module: CrudModule()),
        ModularRouter(CrudCategoryModule.routeName,
            module: CrudCategoryModule()),
        ModularRouter(CrudProductModule.routeName, module: CrudProductModule()),
        ModularRouter(SaleModule.routeName, module: SaleModule()),
        ModularRouter(SettingsModule.routeName, module: SettingsModule()),
      ];
}
