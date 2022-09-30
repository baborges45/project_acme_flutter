import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';
import '../../../models/item_model.dart';
import '../../../service/utils_services.dart';
import '../../product/product_screen.dart';

class ItemTile extends StatelessWidget {
  ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel? item;
  final UtilsServices utilsServices = UtilsServices();

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
                Expanded(
                  child: Image.asset(item!.imgUrl!),
                ),
                Text(
                  item!.itemName!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      utilsServices.priceToCurrency(item!.price!),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                    Text(
                      '/${item!.unit}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Positioned _makeButtonShpping() => Positioned(
        top: 4,
        right: 4,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 40,
            height: 35,
            decoration: BoxDecoration(
              color: CustomColors.customSwatchColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(18),
              ),
            ),
            child: Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      );

  void onTap(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return ProductScreen(
            itemModel: item!,
          );
        },
      ),
    );
  }
}
