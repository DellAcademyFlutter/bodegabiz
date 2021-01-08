import 'package:flutter_modular/flutter_modular.dart';

import 'crud_product_controller.dart';
import 'crud_product_page.dart';

class CrudProductModule extends ChildModule {
  @override
  // Injecoes de dependencia
  List<Bind> get binds => [
        Bind((i) => CrudProductController()),
      ];

  @override
  // Rotas
  List<ModularRouter> get routers => [
        ModularRouter<String>(
          Modular.initialRoute,
          child: (_, args) => CrudProductPage(),
          transition: TransitionType.leftToRight,
        ),
      ];

  static Inject get to => Inject<CrudProductModule>.of();
  static const routeName = '/crudProductModule';
}
