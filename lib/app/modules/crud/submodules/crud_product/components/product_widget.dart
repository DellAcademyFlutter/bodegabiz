import 'package:bodegabiz/app/controllers/product_controller.dart';
import 'package:bodegabiz/app/modules/crud/submodules/crud_product/pages/add_product_page.dart';
import 'package:bodegabiz/app/shared/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget({this.index});
  final int index;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final productController = Modular.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          getImageAvatar(
              productController: productController, index: widget.index),
          Flexible(
              child: FractionallySizedBox(
            widthFactor: 0.10,
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productController.products[widget.index].name),
              Text(_getProfitText()),
              Text(_getSaleText()),
              Text(_getCostText()),
              IncDec_Widget(
                  productController: productController, index: widget.index),
            ],
          ),
        ]),
      ),
      actions: [
        EditWidget(
          productController: productController,
          index: widget.index,
        ),
        RemoveWidget(
          productController: productController,
          index: widget.index,
        ),
      ],
    );
  }

  String _getProfitText() =>
      'Lucro: ${productController.getProductProfitPercent(productController.products[widget.index])}%';
  String _getSaleText() =>
      'Venda: R\$ ${productController.products[widget.index].unitSale}';
  String _getCostText() =>
      'Custo: R\$: ${productController.products[widget.index].unitCost}';
}

/// Imagem do [Product] em forma de avatar.
class getImageAvatar extends StatelessWidget {
  const getImageAvatar({
    Key key,
    @required this.productController,
    @required this.index,
  }) : super(key: key);

  final ProductController productController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.15,
      backgroundImage: productController.products[index].image != ''
          ? ImagePickerUtils.getMemoryImageProvider(
              base64Image: productController.products[index].image)
          : null,
      backgroundColor: productController.products[index].image != ''
          ? null
          : Colors.lightBlueAccent,
    );
  }
}

/// Increment e Decrement.
class IncDec_Widget extends StatelessWidget {
  const IncDec_Widget({
    Key key,
    @required this.productController,
    @required this.index,
  }) : super(key: key);

  final ProductController productController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Estoque:'),
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () async =>
                productController.increment(productController.products[index])),
        Consumer<ProductController>(builder: (context, value) {
          return Container(
            child: Text(productController.products[index].currStock.toString()),
          );
        }),
        IconButton(
            icon: Icon(Icons.remove),
            onPressed: () async =>
                productController.decrement(productController.products[index])),
      ],
    );
  }
}

/// Editar em Sliding.
class EditWidget extends StatelessWidget {
  const EditWidget(
      {Key key, @required this.productController, @required this.index})
      : super(key: key);

  final ProductController productController;
  final index;

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
      caption: 'Editar',
      icon: Icons.edit,
      color: Colors.green,
      onTap: () {
        Navigator.of(context).pushNamed(AddProductPage.routeName,
            arguments: AddProductPageArguments(
                product: productController.products[index]));
      },
    );
  }
}

/// Remover em Sliding.
class RemoveWidget extends StatelessWidget {
  const RemoveWidget({
    Key key,
    @required this.productController,
    @required this.index,
  }) : super(key: key);

  final ProductController productController;
  final index;

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
      caption: 'Excluir',
      icon: Icons.delete,
      color: Colors.red,
      onTap: () async {
        final productName = productController.products[index].name;
        await productController
            .removeProduct(productController.products[index]);
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Atenção!"),
                content:
                    Text("Produto ${productName} foi deletado com sucesso!"),
                actions: [
                  FlatButton(
                    child: Text("Ok!"),
                    onPressed: () {
                      Modular.to.pop();
                    },
                  ),
                ],
              );
            });
      },
    );
  }
}
