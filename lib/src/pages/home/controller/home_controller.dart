import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/category_model.dart';
import '../../../models/item_model.dart';
import '../../../service/utils_services.dart';
import '../../../config/app_data.dart' as appData;

class HomeController extends GetxController {
  //final homeRespository = HomeRespository();
  final utilsServices = UtilsServices();

  bool isCategoryLoading = false;
  bool isProductLoading = true;
  List<ItemModel> itemModel = [];
  List<ItemModel> allCategories = [];
  CategoryModel? currentCategory;
  //List<ItemModel> get allProducts => currentCategory?.items ?? [];

  RxString searchTitle = ''.obs;

  Rx<List<ItemModel>> allProducts = Rx<List<ItemModel>>([]);
  TextEditingController itemName = TextEditingController();
  var itemCount = 0.obs;

  List<ItemModel> get items {
    return [...appData.items];
  }

  List<ItemModel> get favouriteItems {
    return appData.items
        .where((productItem) => productItem.isFavourite!)
        .toList();
  }

  ItemModel findProductById(int id) {
    return appData.items.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    update();
  }

  void toggleFavouriteStatus(int id) {
    items[id].isFavourite = !items[id].isFavourite!;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // debounce(
    //   searchTitle,
    //   (_) {
    //     //update();
    //     filterPlayer(searchTitle.string);
    //   },
    //   time: Duration(milliseconds: 600),
    // );

    allProducts.value = appData.items;
  }

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
    itemName.dispose();
  }

  void filterPlayer(String playerName) {
    if (playerName.isEmpty) {
      appData.items.cast<String>().toList();
    } else {
      itemModel = appData.items
          .where((element) => element.unit.toString().contains(playerName))
          .toList();
    }
    //allProducts.value = itemModel;
  }
}
