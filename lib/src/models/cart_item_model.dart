import 'item_model.dart';

class CartItemModel {
  CartItemModel({
    required this.item,
    required this.quantity,
  });
  ItemModel item;
  int quantity;

  double totalPrice() => item.price! * quantity;
}
