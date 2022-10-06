import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/custom_colors.dart';
import '../../../../models/cart.dart';
import '../../../../shared/theme.dart';
import '../../controller/cart_controller.dart';

class CartCArd extends StatelessWidget {
  CartCArd({
    required this.product,
    required this.function1,
    required this.function2,
  });
  final CartController cartController = Get.find();
  final Cart product;
  final Function() function1;
  final Function() function2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      padding: EdgeInsets.only(left: 6, top: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            height: 82,
            width: 82,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: greyColor2),
            child: Center(
              child: Image.network(product.product!.productImage),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.product!.productName.toString()),
              SizedBox(
                height: 30,
              ),
              GetBuilder<CartController>(builder: (controller) {
                return Text(
                  'R\$ ${controller.sumPrice}',
                  style: TextStyle(fontSize: 15),
                );
              }),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.all(6),
              height: 40,
              decoration: BoxDecoration(
                  color: greyColor2,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: function2,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Center(
                          child: Text(
                        '-',
                        style: TextStyle(fontSize: 24),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 30,
                      width: 30,
                      child: GetBuilder<CartController>(builder: (controller) {
                        return Center(
                            child: Text(
                          product.qty.toString(),
                          style: TextStyle(fontSize: 18),
                        ));
                      })),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: function1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColors.customSwatchColor,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      height: 30,
                      width: 30,
                      child: Center(
                          child: Text(
                        '+',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
