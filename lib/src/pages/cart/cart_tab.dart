import 'package:flutter/material.dart';

import '../../../commons/resources/locale_images.dart';
import '../../../commons/resources/translation.dart';
import '../../config/custom_colors.dart';
import '../../models/cart_item_model.dart';
import '../../service/utils_services.dart';
import '../../config/app_data.dart' as appData;
import 'components/cart_tile.dart';

class CartTab extends StatefulWidget {
  CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  ///function remove item from cart
  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translation.of(context).cart),
      ),
      body: Column(
        children: [
          //List of itens the cart
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (_, index) {
                return CartTile(
                  cartItem: appData.cartItems[index],
                  remove: removeItemFromCart,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  Translation.of(context).grandTotal,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.customSwatchColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () async {
                    bool? result = await showOrderConfirmation();
                  },
                  child: Text(
                    Translation.of(context).completeOrder,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Image.asset(
            LocaleImages().iconAlert,
            height: 30,
            width: 30,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            Translation.of(context).textConfirmation,
          ),
          content: Text(
            Translation.of(context).textOptionConfirmation,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                Translation.of(context).notConfirmation,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                Translation.of(context).yesConfirmation,
              ),
            ),
          ],
        );
      },
    );
  }
}
