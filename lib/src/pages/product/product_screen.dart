import 'package:flutter/material.dart';

import '../../../commons/resources/translation.dart';
import '../../config/custom_colors.dart';
import '../../models/item_model.dart';
import '../../service/utils_services.dart';
import '../common_widgets/quantity_widget.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key? key,
    required this.itemModel,
    required this.name,
  }) : super(key: key);

  final ItemModel itemModel;
  final String name;
  //final String price;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              _makeImage(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          _makeName(),
                          _makeQuantity(),
                        ],
                      ),
                      _makePrice(),
                      _makeDescription(),
                      _makeButtonAdd(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  QuantityWidget _makeQuantity() => QuantityWidget(
        suffixText: widget.itemModel.unit!,
        value: cartItemQuantity,
        result: (quantity) {
          setState(() {
            cartItemQuantity = quantity;
          });
        },
      );

  Expanded _makeImage() => Expanded(
        child: Hero(
          tag: widget.itemModel.imgUrl!,
          child: Image.network(
            widget.itemModel.imgUrl!,
            fit: BoxFit.cover,
          ),
        ),
      );

  Expanded _makeName() => Expanded(
        child: Text(
          widget.name.toString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Text _makePrice() => Text(
        utilsServices.priceToCurrency(widget.itemModel.price!),
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: CustomColors.customSwatchColor,
        ),
      );

  Expanded _makeDescription() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: SingleChildScrollView(
            child: Text(
              (widget.itemModel.description!),
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  SizedBox _makeButtonAdd() => SizedBox(
        height: 45,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          label: Text(
            Translation.of(context).addToCart,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
        ),
      );
}
