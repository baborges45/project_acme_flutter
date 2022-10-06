import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'cart_item_model.dart';

class OrderModel {
  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      createdDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['createdDataTime']),
      overdueDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['overdueDataTime']),
      items: List<CartItemModel>.from(
          map['items']?.map((x) => CartItemModel.fromMap(x))),
      status: map['status'] ?? '',
      copyAndPaste: map['copyAndPAste'] ?? '',
      total: map['total']?.toDouble() ?? 0.0,
    );
  }
  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel copyWith({
    String? id,
    DateTime? createdDataTime,
    DateTime? overdueDataTime,
    List<CartItemModel>? items,
    String? status,
    String? copyAndPAste,
    double? total,
  }) {
    return OrderModel(
      id: id ?? this.id,
      createdDateTime: createdDataTime ?? this.createdDateTime,
      overdueDateTime: overdueDataTime ?? this.overdueDateTime,
      items: items ?? this.items,
      status: status ?? this.status,
      copyAndPaste: copyAndPAste ?? this.copyAndPaste,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'createdDataTime': createdDateTime.millisecondsSinceEpoch});
    result.addAll({'overdueDataTime': overdueDateTime.millisecondsSinceEpoch});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});
    result.addAll({'status': status});
    result.addAll({'copyAndPAste': copyAndPaste});
    result.addAll({'total': total});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'OrderModel(id: $id, createdDataTime: $createdDateTime, overdueDataTime: $overdueDateTime, items: $items, status: $status, copyAndPAste: $copyAndPaste, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is OrderModel &&
        other.id == id &&
        other.createdDateTime == createdDateTime &&
        other.overdueDateTime == overdueDateTime &&
        listEquals(other.items, items) &&
        other.status == status &&
        other.copyAndPaste == copyAndPaste &&
        other.total == total;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdDateTime.hashCode ^
        overdueDateTime.hashCode ^
        items.hashCode ^
        status.hashCode ^
        copyAndPaste.hashCode ^
        total.hashCode;
  }
}
