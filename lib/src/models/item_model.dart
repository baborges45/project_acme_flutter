import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';

class ItemModel {
  ItemModel({
    this.itemName,
    this.imgUrl,
    this.unit,
    this.description,
    this.price,
    this.id,
    this.isFavourite = false,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      itemName: List<String>.from(map['itemName']),
      imgUrl: map['imgUrl'],
      unit: map['unit'],
      description: map['description'],
      price: map['price']?.toDouble(),
    );
  }

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
  List<String>? itemName;
  String? imgUrl;
  String? unit;
  String? description;
  double? price;
  int? id;
  bool? isFavourite;

  ItemModel copyWith({
    List<String>? itemName,
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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (itemName != null) {
      result.addAll({'itemName': itemName});
    }
    if (imgUrl != null) {
      result.addAll({'imgUrl': imgUrl});
    }
    if (unit != null) {
      result.addAll({'unit': unit});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (price != null) {
      result.addAll({'price': price});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ItemModel(itemName: $itemName, imgUrl: $imgUrl, unit: $unit, description: $description, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ItemModel &&
        listEquals(other.itemName, itemName) &&
        other.imgUrl == imgUrl &&
        other.unit == unit &&
        other.description == description &&
        other.price == price;
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
