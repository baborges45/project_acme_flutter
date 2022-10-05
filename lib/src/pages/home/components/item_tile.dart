import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_data.dart' as appData;
import '../../../config/custom_colors.dart';
import '../../../models/item_model.dart';
import '../../../service/utils_services.dart';
import '../../cart/controller/cart_controller.dart';
import '../../product/product_screen.dart';
import '../repository/list_verbos.dart';

class ItemTile extends StatefulWidget {
  ItemTile({
    Key? key,
    required this.item,
    this.cartAnimationMethod,
    this.listVerbos,
  }) : super(key: key);

  final ItemModel? item;
  final void Function(GlobalKey)? cartAnimationMethod;
  final ListVerbos? listVerbos;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final UtilsServices utilsServices = UtilsServices();

  final GlobalKey imageGk = GlobalKey();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  final random = Random();

  late String item =
      widget.item!.itemName![random.nextInt(widget.item!.itemName!.length)];

  late int descriptionLentgth = widget.item!.description!.length;

  late int finalPrice;

  final cartController = Get.put(CartController());

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _makeCard(context),
        _makeButtonShpping(),
      ],
    );
  }

  GestureDetector _makeCard(BuildContext context) => GestureDetector(
        onTap: () => onTap(context),
        child: Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _makeImageItem(),
                _makeNameItem(),
                _makePrice(),
              ],
            ),
          ),
        ),
      );

  Text _makeNameItem() => Text(
        //widget.item!.itemName!,
        item,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

  Row _makePrice() => Row(
        children: [
          Text(
            utilsServices.priceToCurrency(
              utilsServices.resultPrice(
                  widget.item!.itemName!.length, descriptionLentgth),
            ),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColors.customSwatchColor,
            ),
          ),
          Text(
            '/${widget.item!.unit}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      );

  Expanded _makeImageItem() => Expanded(
        child: Hero(
          tag: widget.item!.imgUrl!,
          child: Container(
            key: imageGk,
            child: Image.network(
              widget.item!.imgUrl!,
            ),
          ),
        ),
      );

  Positioned _makeButtonShpping() => Positioned(
        top: 4,
        right: 4,
        child: GetBuilder<CartController>(
            init: CartController(),
            builder: (context) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(18),
                ),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      switchIcon();
                      widget.cartAnimationMethod!(imageGk);
                      cartController.addItem(item: widget.item!);
                    },
                    child: Ink(
                      width: 40,
                      height: 35,
                      decoration: BoxDecoration(
                        color: CustomColors.customSwatchColor,
                      ),
                      child: Icon(
                        tileIcon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              );
            }),
      );

  void onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProductScreen(
            itemModel: widget.item!,
            name: item,
          );
        },
      ),
    );
  }
}
