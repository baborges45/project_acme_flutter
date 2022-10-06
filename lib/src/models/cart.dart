import 'product.dart';

class Cart {
  Cart({this.id = '', this.product, this.qty = 0});
  String id;
  Product? product;
  int qty;

  Cart copyWith({
    String? id,
    Product? product,
    int? qty,
  }) =>
      Cart(
          id: id ?? this.id,
          product: product ?? this.product,
          qty: qty ?? this.qty);

  // @override
  // List<Object> get props => [id, qty, product];

  void toggleDone() {
    qty++;
  }

  void decreaseDown() {
    qty--;
  }
}
