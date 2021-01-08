import 'package:bodegabiz/app/modules/crud/crud_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/side_menu_widget.dart';
import 'home_controller.dart';

/// View do modulo [Home].
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SideMenuWidget(),
      body: Consumer<HomeController>(builder: (context, value) {
        return IndexedStack(
          index: controller.index,
          children: [
            Center(
              child: Text(" Welcome"),
            ),
            RouterOutlet(module: CrudModule()),
          ],
        );
      }),
    );
  }
}
