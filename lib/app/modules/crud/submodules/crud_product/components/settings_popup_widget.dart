import 'package:bodegabiz/app/shared/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import '../crud_product_controller.dart';

class SettingsPopupMenu extends StatefulWidget {
  @override
  _SettingsPopupMenuState createState() => _SettingsPopupMenuState();
}

class _SettingsPopupMenuState extends State<SettingsPopupMenu> {
  final crudProductController = Modular.get<CrudProductController>();
  final options = ['camera', 'arquivo'];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        icon: Icon(Icons.attach_file),
        onSelected: (String result) {
          ImagePickerUtils.getImageFile(
                  imageSource: result == options[0]
                      ? ImageSource.camera
                      : ImageSource.gallery)
              .then((value) {
            crudProductController.setImageValue(imageFile: value);
          });
        },
        itemBuilder: (context) {
          return options.map<PopupMenuItem<String>>((String option) {
            return PopupMenuItem(
              value: option,
              child: ListTile(
                title: Text(
                    (option == options[0]) ? 'Tirar foto' : 'Escolher imagem'),
                leading: Icon(option == options[0]
                    ? Icons.camera_alt_outlined
                    : Icons.filter_outlined),
              ),
            ); //Card(child: Text(listItemValue.title),);
          }).toList();
        });
  }
}
