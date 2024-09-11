// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class RandamProduct {
  int productId;
  String productName;
  String description;
  double price;
  int stockQuantity;
  int couponid;
  double discount;
  String discountType;
  String expirationDate;
  double discountedPrice;
  List<String> imagePaths;
  RandamProduct({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.couponid,
    required this.discount,
    required this.discountType,
    required this.expirationDate,
    required this.discountedPrice,
    required this.imagePaths,
  });

  RandamProduct copyWith({
    int? productId,
    String? productName,
    String? description,
    double? price,
    int? stockQuantity,
    int? couponCode,
    double? discount,
    String? discountType,
    String? expirationDate,
    double? discountedPrice,
    List<String>? imagePaths,
  }) {
    return RandamProduct(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      price: price ?? this.price,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      couponid: couponCode ?? this.couponid,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      expirationDate: expirationDate ?? this.expirationDate,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      imagePaths: imagePaths ?? this.imagePaths,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'description': description,
      'price': price,
      'stockQuantity': stockQuantity,
      'couponCode': couponid,
      'discount': discount,
      'discountType': discountType,
      'expirationDate': expirationDate,
      'discountedPrice': discountedPrice,
      'imagePaths': imagePaths,
    };
  }

  factory RandamProduct.fromMap(Map<String, dynamic> map) {
    return RandamProduct(
      productId: map['productId'] as int,
      productName: map['productName'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      stockQuantity: map['stockQuantity'] as int,
      couponid: map['couponid'] as int,
      discount: map['discount'] as double,
      discountType: map['discountType'] as String,
      expirationDate: map['expirationDate'] as String,
      discountedPrice: map['discountedPrice'] as double,
      imagePaths: List<String>.from((map['imagePaths'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory RandamProduct.fromJson(String source) =>
      RandamProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RandamProduct(productId: $productId, productName: $productName, description: $description, price: $price, stockQuantity: $stockQuantity, couponCode: $couponid, discount: $discount, discountType: $discountType, expirationDate: $expirationDate, discountedPrice: $discountedPrice, imagePaths: $imagePaths)';
  }

  @override
  bool operator ==(covariant RandamProduct other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.productName == productName &&
        other.description == description &&
        other.price == price &&
        other.stockQuantity == stockQuantity &&
        other.couponid == couponid &&
        other.discount == discount &&
        other.discountType == discountType &&
        other.expirationDate == expirationDate &&
        other.discountedPrice == discountedPrice &&
        listEquals(other.imagePaths, imagePaths);
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productName.hashCode ^
        description.hashCode ^
        price.hashCode ^
        stockQuantity.hashCode ^
        couponid.hashCode ^
        discount.hashCode ^
        discountType.hashCode ^
        expirationDate.hashCode ^
        discountedPrice.hashCode ^
        imagePaths.hashCode;
  }
}
