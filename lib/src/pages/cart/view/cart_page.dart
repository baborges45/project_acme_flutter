import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/resources/locale_images.dart';
import '../../../../commons/resources/translation.dart';
import '../../../config/custom_colors.dart';
import '../../../shared/theme.dart';
import '../controller/cart_controller.dart';
import 'components/cart_card.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor2,
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(24, 30, 24, 0),
        child: Stack(
          children: [
            ListView(
              children: [
                GetX<CartController>(builder: (controller) {
                  return Column(
                      children: cartController.cartItems
                          .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: CartCArd(
                                function1: () {
                                  cartController.increasQty(e);
                                },
                                function2: () {
                                  cartController.decreasqty(cart: e);
                                },
                                product: e,
                              )))
                          .toList());
                }),
                SizedBox(
                  height: 150,
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 5),
                color: greyColor2,
                height: 130,
                child: Column(
                  children: [
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
                          GetBuilder<CartController>(builder: (controller) {
                            return Text(
                              'R\$ ${controller.count2}',
                              style: TextStyle(fontSize: 20),
                            );
                          }),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.customSwatchColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {
                              showOrderConfirmation(context);
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> showOrderConfirmation(BuildContext context) {
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
