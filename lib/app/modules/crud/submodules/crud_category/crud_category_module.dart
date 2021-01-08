import 'package:bodegabiz/app/modules/crud/submodules/crud_category/pages/add_category.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'crud_category_controller.dart';
import 'crud_category_page.dart';

class CrudCategoryModule extends ChildModule {
  @override
  // Injecoes de dependencia
  List<Bind> get binds => [
        Bind((i) => CrudCategoryController()),
      ];

  @override
  // Rotas
  List<ModularRouter> get routers => [
        ModularRouter<String>(
          Modular.initialRoute,
          child: (_, args) => CrudCategoryPage(),
          transition: TransitionType.leftToRight,
        ),
        ModularRouter<String>(
          AddCategoryPage.routeName,
          child: (_, args) => AddCategoryPage(),
          transition: TransitionType.leftToRight,
        ),
      ];

  static Inject get to => Inject<CrudCategoryModule>.of();
  static const routeName = '/crudCategory';
}
