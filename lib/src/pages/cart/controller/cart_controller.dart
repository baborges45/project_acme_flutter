import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/cart_item_model.dart';
import '../../../models/item_model.dart';
import '../../../models/order_model.dart';
import '../../../service/utils_services.dart';
import '../../common_widgets/payment_dialog.dart';
import '../cart_result/cart_result.dart';
import '../repository/cart_repository.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  //final authController = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];

  bool isCheckoutLoading = false;
  Map<int, CartItemModel> _items = {};

  Map<int, CartItemModel> get items {
    return {..._items};
  }

  ItemModel? itemModel;

  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int getItemIndex(ItemModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.item.id == item.id);
  }

  void addItem({required ItemModel item, int quantity = 1}) {
    int itemIndex = getItemIndex(item);
    if (_items.containsKey(itemIndex)) {
      _items.update(
          itemIndex,
          (existingCartItem) => CartItemModel(
              id: existingCartItem.id,
              item: existingCartItem.item,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
      update();
    } else {
      _items.putIfAbsent(
        itemIndex,
        () => CartItemModel(
          id: DateTime.now().toString(),
          item: itemModel!,
          price: 0,
          quantity: 1,
        ),
      );
    }
    update();
  }

  void removeitem(int productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
