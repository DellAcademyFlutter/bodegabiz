import 'package:bodegabiz/app/models/product.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_product/crud_product_controller.dart';
import 'package:bodegabiz/app/shared/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CrudPageProductImageWidget extends StatefulWidget {
  CrudPageProductImageWidget({this.product});

  final Product product;

  @override
  _CrudPageProductImageWidgetState createState() =>
      _CrudPageProductImageWidgetState();
}

class _CrudPageProductImageWidgetState
    extends State<CrudPageProductImageWidget> {
  final crudProductController = Modular.get<CrudProductController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: crudProductController.image,
      builder: (BuildContext context, value, Widget child) {
        return _containsImage()
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.product?.image != null
                          ? _getMemoryImage()
                          : _getFileImage(),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink();
      },
    );
  }

  bool _containsImage() {
    return widget.product?.image != null ||
        crudProductController.image.value != null;
  }

  ImageProvider _getMemoryImage() {
    return MemoryImage(
      ImagePickerUtils.getBytesImage(
          base64Image: crudProductController.base64Image.value),
    );
  }

  ImageProvider _getFileImage() {
    return FileImage(
      crudProductController.image.value,
    );
  }
}
