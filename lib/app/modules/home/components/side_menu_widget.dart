import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';

class SideMenuWidget extends StatefulWidget {
  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    ClipOval(
                      child: Icon(
                        Icons.add_business,
                        size: 50,
                      ),
                    ),
                    Text("Bodega Biz")
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Colors.blueAccent,
                Colors.lightBlueAccent,
              ]),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              controller.changeIndex(newIndex: 0);
              Modular.to.pop();
            },
            child: Card(
              color: Colors.green,
              child: Column(
                children: [
                  Icon(Icons.monetization_on),
                  Text("Vender"),
                ],
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Página inicial"),
            trailing: Icon(Icons.arrow_right_outlined),
            onTap: () {
              controller.changeIndex(newIndex: 1);
              Modular.to.pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Cadastro"),
            trailing: Icon(Icons.arrow_right_outlined),
            onTap: () {
              controller.changeIndex(newIndex: 2);
              Modular.to.pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.table_rows_outlined),
            title: Text("Histórico de Vendas"),
            trailing: Icon(Icons.arrow_right_outlined),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart_outlined),
            title: Text("Estatísticas"),
            trailing: Icon(Icons.arrow_right_outlined),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configurações"),
            trailing: Icon(Icons.arrow_right_outlined),
            onTap: () {
              controller.changeIndex(newIndex: 3);
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }
}
