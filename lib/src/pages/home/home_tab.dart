import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import '../../../commons/resources/translation.dart';
import '../../config/app_data.dart' as appData;

import '../../config/custom_colors.dart';
import '../../models/item_model.dart';
import '../cart/cart_tab.dart';
import '../cart/controller/cart_controller.dart';
import '../common_widgets/custom_shimmer.dart';
import 'components/category_title.dart';
import 'components/item_tile.dart';
import 'controller/home_controller.dart';

class HomeTab extends StatefulWidget {
  HomeTab({
    Key? key,
    this.itemModel,
  }) : super(key: key);

  final ItemModel? itemModel;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  bool isLoading = true;

  final searchController = TextEditingController();

  final controller = Get.put(HomeController());
  final cartController = Get.put(CartController());

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
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
                  ? GridView.builder(
                      padding: EdgeInsets.fromLTRB(16, 5, 16, 16),
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                      ),
                      itemCount: appData.items.length,
                      itemBuilder: (context, index) {
                        return GetBuilder<CartController>(
                            init: CartController(),
                            builder: (context) {
                              return ItemTile(
                                  item: appData.items[index],
                                  cartAnimationMethod:
                                      itemSelectedCartAnimations);
                            });
                      },
                    )
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
                  Get.to(() => CartTab());
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
                      '2',
                      style: TextStyle(
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

  GetBuilder<HomeController> _makeSearch() =>
      GetBuilder<HomeController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TextFormField(
            controller: searchController,
            onChanged: (value) {
              //controller.searchTitle.value = value;
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
}
