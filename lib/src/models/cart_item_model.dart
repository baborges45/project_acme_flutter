import 'dart:convert';

import 'item_model.dart';

class CartItemModel {
  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source));

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      item: ItemModel.fromMap(map['item']),
      quantity: map['quantity']?.toInt() ?? 0,
      id: map['id'] ?? '',
      price: map['quantity']?.tod() ?? 0,
    );
  }
  CartItemModel({
    required this.item,
    required this.quantity,
    required this.id,
    required this.price,
  });
  ItemModel item;
  int quantity;
  String id;
  final double price;

  CartItemModel copyWith({
    ItemModel? item,
    int? quantity,
    String? id,
  }) {
    return CartItemModel(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
      price: price,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'item': item.toMap()});
    result.addAll({'quantity': quantity});
    result.addAll({'id': id});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CartItemModel(item: $item, quantity: $quantity, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is CartItemModel &&
        other.item == item &&
        other.quantity == quantity &&
        other.id == id;
  }

  @override
  int get hashCode => item.hashCode ^ quantity.hashCode ^ id.hashCode;

  double totalPrice() => item.price! * quantity;

  //static fromMap(Map<String, dynamic> x) {}

  // toMap() {}

  // @override
  // String toString() =>
  //     'CartItemModel(item: $item, id: $id, quantity: $quantity)';
}

  // CartItemModel({
  //   required this.item,
  //   required this.quantity,
  //   required this.id,
  // });
  // ItemModel item;
  // int quantity;
  // String id;


