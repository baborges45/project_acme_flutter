import 'package:flutter/material.dart';

import '../../models/item_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(itemModel.imgUrl!),
          ),
          Expanded(
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
