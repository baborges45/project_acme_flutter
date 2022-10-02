import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';
import '../../../models/cart_item_model.dart';
import '../../../service/utils_services.dart';
import '../../common_widgets/quantity_widget.dart';

class CartTile extends StatefulWidget {
  CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          widget.cartItem.item.imgUrl!,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItem.item.itemName!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(
            widget.cartItem.totalPrice(),
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColors.customSwatchColor,
          ),
        ),
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit!,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              //remove item from cart
              if (quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
