// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CartModel {
  int id;
  int productId;
  String productName;
  String price;
  int quantity;
  int couponId;
  String createdAt;
  List<String>? productImages;
  CartModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.couponId,
    required this.createdAt,
    this.productImages,
  });

  CartModel copyWith({
    int? id,
    int? productId,
    String? productName,
    String? price,
    int? quantity,
    int? couponId,
    String? createdAt,
    List<String>? productImages,
  }) {
    return CartModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      couponId: couponId ?? this.couponId,
      createdAt: createdAt ?? this.createdAt,
      productImages: productImages ?? this.productImages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'productName': productName,
      'price': price,
      'quantity': quantity,
      'couponId': couponId,
      'createdAt': createdAt,
      'productImages': productImages,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      productId: map['productId'] as int,
      productName: map['productName'] as String,
      price: map['price'] as String,
      quantity: map['quantity'] as int,
      couponId: map['couponId'] as int,
      createdAt: map['createdAt'] as String,
      productImages: map['productImages'] != null
          ? List<String>.from((map['productImages'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(id: $id, productId: $productId, productName: $productName, price: $price, quantity: $quantity, couponId: $couponId, createdAt: $createdAt, productImages: $productImages)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productId == productId &&
        other.productName == productName &&
        other.price == price &&
        other.quantity == quantity &&
        other.couponId == couponId &&
        other.createdAt == createdAt &&
        listEquals(other.productImages, productImages);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productId.hashCode ^
        productName.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        couponId.hashCode ^
        createdAt.hashCode ^
        productImages.hashCode;
  }
}
