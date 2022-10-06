import 'dart:math';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/resources/translation.dart';
import '../../config/app_data.dart' as appData;

import '../../config/custom_colors.dart';

import '../../models/product.dart';
import '../../service/utils_services.dart';
import '../cart/controller/cart_controller.dart';
import '../cart/view/cart_page.dart';
import '../common_widgets/custom_shimmer.dart';
import '../product/controller/product_controller.dart';
import '../product/product_screen.dart';
import 'components/category_title.dart';

class HomeTab extends StatefulWidget {
  HomeTab({
    Key? key,
    this.itemModel,
  }) : super(key: key);

  final Product? itemModel;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Acessórios';

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  bool isLoading = true;
  final UtilsServices utilsServices = UtilsServices();

  final searchController = TextEditingController();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  final productController = Get.put(ProductController());
  final cartController = Get.put(CartController());

  final random = Random();

  late String item = appData.listName[random.nextInt(appData.listName.length)];

  late int descriptionLentgth = widget.itemModel!.productDescription.length;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: Translation.of(context).nameApp1,
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: Translation.of(context).nameApp2,
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          _makeButtonCart(),
        ],
      ),
      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            _makeSearch(),
            Container(
              padding: EdgeInsets.only(left: 25),
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => CategoryTitle(
                  onPressed: () => _onPressed(index),
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                ),
                separatorBuilder: (_, index) => SizedBox(
                  width: 10,
                ),
                itemCount: appData.categories.length,
              ),
            ),
            Expanded(
              child: !isLoading
                  ? GetBuilder<ProductController>(builder: (controller) {
                      return GridView.builder(
                        padding: EdgeInsets.fromLTRB(16, 5, 16, 16),
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                        ),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return _makeItem(controller, index, context);
                        },
                      );
                    })
                  : GridView.count(
                      padding: EdgeInsets.fromLTRB(16, 5, 16, 16),
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                      children: List.generate(
                        10,
                        (index) => CustomShimmer(
                          height: double.infinity,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeItem(
          ProductController controller, int index, BuildContext context) =>
      Stack(
        children: [
          _makeCard(controller: controller, index: index, context: context),
          _makeButtonShpping(controller, index, context),
          _makeButtonFavorite(controller, index, context)
        ],
      );

  Padding _makeButtonCart() => Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 15,
        ),
        child: GetBuilder<CartController>(
            init: CartController(),
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => CartPage());
                },
                behavior: HitTestBehavior.translucent,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 34.0,
                    minHeight: 34.0,
                  ),
                  child: Badge(
                    badgeColor: CustomColors.customContrastColor,
                    badgeContent: Text(
                      cartController.count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    child: AddToCartIcon(
                      key: globalKeyCartItems,
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                  ),
                ),
              );
            }),
      );

  Widget _makeSearch() => GetBuilder<ProductController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TextFormField(
            controller: searchController,
            onChanged: (value) {
              controller.searchTitle.value = value;
              controller.filterPlayer(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              hintText: Translation.of(context).search,
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: CustomColors.customContrastColor,
                size: 21,
              ),
              suffixIcon: controller.searchTitle.value.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        searchController.clear();
                        controller.searchTitle.value = '';
                        FocusScope.of(context).unfocus();
                      },
                      icon: Icon(Icons.close),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        );
      });

  void _onPressed(int index) {
    setState(() {
      selectedCategory = appData.categories[index];
    });
  }

  GestureDetector _makeCard({
    required BuildContext context,
    required ProductController controller,
    required int index,
  }) =>
      GestureDetector(
        onTap: () {
          Get.to(
            () => ProductScreen(
              controller.products[index].productName,
              controller.products[index].productImage,
              controller.products[index].productDescription,
            ),
          );
        },
        child: Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _makeImageItem(controller, index, context),
                _makeNameItem(controller, index, context),
                _makePrice(controller, index, context),
              ],
            ),
          ),
        ),
      );

  Text _makeNameItem(
          ProductController controller, int index, BuildContext context) =>
      Text(
        //item,
        controller.products[index].productName,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

  Row _makePrice(
          ProductController controller, int index, BuildContext context) =>
      Row(
        children: [
          Text(
            utilsServices.priceToCurrency(
              utilsServices.resultPrice(
                controller.products[index].productName.length,
                controller.products[index].productDescription.length,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColors.customSwatchColor,
            ),
          ),
        ],
      );

  Expanded _makeImageItem(
          ProductController controller, int index, BuildContext context) =>
      Expanded(
        child: Hero(
          tag: controller.products[index].price,
          child: Container(
            //key: imageGk,
            child: Image.network(
              controller.products[index].productImage,
            ),
          ),
        ),
      );

  Positioned _makeButtonShpping(
          ProductController controller, int index, BuildContext context) =>
      Positioned(
        top: 4,
        right: 4,
        child: GetBuilder<CartController>(
            init: CartController(),
            builder: (context) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(18),
                ),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      switchIcon();
                      cartController.addToCart(controller.products[index]);
                      //widget.cartAnimationMethod!(imageGk);
                      //cartController.addItem(item: widget.item!);
                    },
                    child: Ink(
                      width: 40,
                      height: 35,
                      decoration: BoxDecoration(
                        color: CustomColors.customSwatchColor,
                      ),
                      child: Icon(
                        tileIcon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              );
            }),
      );

  Positioned _makeButtonFavorite(
          ProductController controller, int index, BuildContext context) =>
      Positioned(
        top: 4,
        left: 4,
        child: GetBuilder<CartController>(
            init: CartController(),
            builder: (value) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(18),
                ),
                child: Material(
                  child: Ink(
                    width: 40,
                    height: 35,
                    child: IconButton(
                      icon: Icon(
                        controller.products[index].isFavourite == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        //controller.toggleFavouriteStatus(widget.item!.id!);
                      },
                    ),
                  ),
                ),
              );
            }),
      );

  // void onTap(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return ProductScreen(
  //           itemModel: widget.item!,
  //           name: item,
  //         );
  //       },
  //     ),
  //   );
  // }
}
