import 'package:get/get.dart';

class Product {
  Product({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.price,
    this.isFavourite = false,
  });

  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  late final bool isFavourite;

  final isFavorite = false.obs;
}
