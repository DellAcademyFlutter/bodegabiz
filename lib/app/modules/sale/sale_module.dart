import 'package:flutter_modular/flutter_modular.dart';

import 'sale_controller.dart';
import 'sale_page.dart';

class SaleModule extends ChildModule {
  @override
  // Injecoes de dependencia
  List<Bind> get binds => [
        Bind((i) => SaleController()),
      ];

  @override
  // Rotas
  List<ModularRouter> get routers => [
        ModularRouter<String>(
          Modular.initialRoute,
          child: (_, args) => SalePage(),
          transition: TransitionType.leftToRight,
        ),
      ];

  static Inject get to => Inject<SaleModule>.of();
  static const routeName = '/sale';
}
