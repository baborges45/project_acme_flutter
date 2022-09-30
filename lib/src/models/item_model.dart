import 'dart:convert';

class ItemModel {
  factory ItemModel.fromJson(String source) => ItemModel.fromMap(
        json.decode(source),
      );
  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      itemName: map['itemName'],
      imgUrl: map['imgUrl'],
      unit: map['unit'],
      description: map['description'],
      price: map['price'],
    );
  }
  ItemModel({
    this.itemName,
    this.imgUrl,
    this.unit,
    this.description,
    this.price,
  });
  String? itemName;
  String? imgUrl;
  String? unit;
  String? description;
  double? price;

  ItemModel copyWith({
    String? itemName,
    String? imgUrl,
    String? unit,
    String? description,
    double? price,
  }) {
    return ItemModel(
      itemName: itemName ?? this.itemName,
      imgUrl: imgUrl ?? this.imgUrl,
      unit: unit ?? this.unit,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  ItemModel merge(ItemModel model) {
    return ItemModel(
      itemName: model.itemName ?? this.itemName,
      imgUrl: model.imgUrl ?? this.imgUrl,
      unit: model.unit ?? this.unit,
      description: model.description ?? this.description,
      price: model.price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'imgUrl': imgUrl,
      'unit': unit,
      'description': description,
      'price': price,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ItemModel(itemName: $itemName, imgUrl: $imgUrl, unit: $unit,'
        'description: $description, price: $price,)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is ItemModel &&
        o.itemName == itemName &&
        o.imgUrl == imgUrl &&
        o.unit == unit &&
        o.description == description &&
        o.price == price;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
        imgUrl.hashCode ^
        unit.hashCode ^
        description.hashCode ^
        price.hashCode;
  }
}
