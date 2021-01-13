import 'package:bodegabiz/app/shared/utils/image_picker_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductToCartWidget extends StatefulWidget {
  ProductToCartWidget({this.product});

  final product;

  @override
  _ProductToCartWidgetState createState() => _ProductToCartWidgetState();
}

class _ProductToCartWidgetState extends State<ProductToCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(children: [
          Container(
            child: widget.product.image != ''
                ? Image.memory(
                    ImagePickerUtils.getBytesImage(
                        base64Image: widget.product.image),
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.10,
                    fit: BoxFit.fill)
                : Icon(Icons.shopping_bag),
          ),
        ]),
        TableRow(
          children: [
            Padding(
              padding: myTextPadding(),
              child: Text('${widget.product.name}'),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: myTextPadding(),
              child: Text('R\$: ${widget.product.unitSale}'),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: myTextPadding(),
              child: Text('Qtd.: ${widget.product.currStock}'),
            ),
          ],
        ),
      ],
    );
  }

  EdgeInsets myTextPadding() => const EdgeInsets.fromLTRB(8, 0, 0, 0);
}
