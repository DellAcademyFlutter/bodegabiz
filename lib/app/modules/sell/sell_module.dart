import 'package:bodegabiz/app/modules/sell/pages/cart_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sell_controller.dart';
import 'sell_page.dart';

class SellModule extends ChildModule {
  @override
  // Injecoes de dependencia
  List<Bind> get binds => [
        Bind((i) => SellController()),
      ];

  @override
  // Rotas
  List<ModularRouter> get routers => [
        ModularRouter<String>(
          Modular.initialRoute,
          child: (_, args) => SellPage(),
          transition: TransitionType.leftToRight,
        ),
        ModularRouter<String>(
          CartPage.routeName,
          child: (_, args) => CartPage(),
          transition: TransitionType.leftToRight,
        ),
      ];

  static Inject get to => Inject<SellModule>.of();
  static const routeName = '/sale';
}
