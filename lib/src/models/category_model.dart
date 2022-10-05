import 'item_model.dart';

class CategoryModel {
  CategoryModel({
    required this.title,
    required this.id,
    required this.items,
  });
  String title;
  String id;

  List<ItemModel> items;

  @override
  String toString() {
    return 'CategoryModel(title: $title, id: $id, items: $items,)';
  }
}
