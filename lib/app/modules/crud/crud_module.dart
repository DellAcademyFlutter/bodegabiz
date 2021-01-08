import 'package:flutter_modular/flutter_modular.dart';

import 'crud_controller.dart';
import 'crud_page.dart';

class CrudModule extends ChildModule {
  @override
  // Injecoes de dependencia
  List<Bind> get binds => [
        Bind((i) => CrudController()),
      ];

  @override
  // Rotas
  List<ModularRouter> get routers => [
        ModularRouter<String>(
          Modular.initialRoute,
          child: (_, args) => CrudPage(),
          transition: TransitionType.leftToRight,
        ),
      ];

  static Inject get to => Inject<CrudModule>.of();
  static const routeName = '/crudModule';
}
