import 'package:bodegabiz/app/controllers/user_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'shared/themes/AppThemes.dart';

/// Widget principal do app.
class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserSettingsController>(builder: (context, value) {
      return MaterialApp(
        title: "Bodega Biz",
        theme: ThemeCollection.getAppTheme(),
        darkTheme: ThemeCollection.darkTheme(),
        initialRoute: HomeModule.routeName,
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
