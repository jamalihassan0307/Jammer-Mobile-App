// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetCouponsWithProducts {
  Coupon coupon;
  List<Products> products;
  GetCouponsWithProducts({
    required this.coupon,
    required this.products,
  });

  GetCouponsWithProducts copyWith({
    Coupon? coupon,
    List<Products>? products,
  }) {
    return GetCouponsWithProducts(
      coupon: coupon ?? this.coupon,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coupon': coupon.toMap(),
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory GetCouponsWithProducts.fromMap(Map<String, dynamic> map) {
    return GetCouponsWithProducts(
      coupon: Coupon.fromMap(map['coupon'] as Map<String, dynamic>),
      products: List<Products>.from(
        (map['products'] as List<dynamic>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCouponsWithProducts.fromJson(String source) =>
      GetCouponsWithProducts.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GetCouponsWithProducts (coupon: $coupon, products: $products)';

  @override
  bool operator ==(covariant GetCouponsWithProducts other) {
    if (identical(this, other)) return true;

    return other.coupon == coupon && listEquals(other.products, products);
  }

  @override
  int get hashCode => coupon.hashCode ^ products.hashCode;
}

class Coupon {
  int id;
  String code;
  double discount;
  String discountType;
  String expirationDate;
  Coupon({
    required this.id,
    required this.code,
    required this.discount,
    required this.discountType,
    required this.expirationDate,
  });

  Coupon copyWith({
    int? id,
    String? code,
    double? discount,
    String? discountType,
    String? expirationDate,
  }) {
    return Coupon(
      id: id ?? this.id,
      code: code ?? this.code,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'discount': discount,
      'discountType': discountType,
      'expirationDate': expirationDate,
    };
  }

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      id: map['id'] as int,
      code: map['code'] as String,
      discount: map['discount'] as double,
      discountType: map['discountType'] as String,
      expirationDate: map['expirationDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coupon.fromJson(String source) =>
      Coupon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Coupon(id: $id, code: $code, discount: $discount, discountType: $discountType, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(covariant Coupon other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.code == code &&
        other.discount == discount &&
        other.discountType == discountType &&
        other.expirationDate == expirationDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        discount.hashCode ^
        discountType.hashCode ^
        expirationDate.hashCode;
  }
}

class Products {
  int productId;
  String productName;
  String description;
  double price;
  int stockQuantity;
  String couponCode;
  double discount;
  String discountType;
  String expirationDate;
  double discountedPrice;
  List<dynamic> imagePaths;
  Products({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.couponCode,
    required this.discount,
    required this.discountType,
    required this.expirationDate,
    required this.discountedPrice,
    required this.imagePaths,
  });

  Products copyWith({
    int? productId,
    String? productName,
    String? description,
    double? price,
    int? stockQuantity,
    String? couponCode,
    double? discount,
    String? discountType,
    String? expirationDate,
    double? discountedPrice,
    List<dynamic>? imagePaths,
  }) {
    return Products(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      price: price ?? this.price,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      couponCode: couponCode ?? this.couponCode,
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
      'couponCode': couponCode,
      'discount': discount,
      'discountType': discountType,
      'expirationDate': expirationDate,
      'discountedPrice': discountedPrice,
      'imagePaths': imagePaths,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      productId: map['productId'] as int,
      productName: map['productName'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      stockQuantity: map['stockQuantity'] as int,
      couponCode: map['couponCode'] as String,
      discount: map['discount'] as double,
      discountType: map['discountType'] as String,
      expirationDate: map['expirationDate'] as String,
      discountedPrice: map['discountedPrice'] as double,
      imagePaths: List<dynamic>.from((map['imagePaths'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(productId: $productId, productName: $productName, description: $description, price: $price, stockQuantity: $stockQuantity, couponCode: $couponCode, discount: $discount, discountType: $discountType, expirationDate: $expirationDate, discountedPrice: $discountedPrice, imagePaths: $imagePaths)';
  }

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.productName == productName &&
        other.description == description &&
        other.price == price &&
        other.stockQuantity == stockQuantity &&
        other.couponCode == couponCode &&
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
        couponCode.hashCode ^
        discount.hashCode ^
        discountType.hashCode ^
        expirationDate.hashCode ^
        discountedPrice.hashCode ^
        imagePaths.hashCode;
  }
}
