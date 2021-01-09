import 'package:bodegabiz/app/modules/settings/settings_controller.dart';
import 'package:bodegabiz/app/modules/settings/settings_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SettingsController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => SettingsPage(),
        ),
      ];

  static Inject get to => Inject<SettingsModule>.of();
  static const routeName = '/settings';
}
