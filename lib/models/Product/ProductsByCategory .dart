// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductsByCategory {
  String id;
  String name;
  String description;
  double price;
  int stockQuantity;
  String categoryId;
  String? categoryName;
  List<String> imagePath;
  String createdAt;
  String updatedAt;
  ProductsByCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.categoryId,
    this.categoryName,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  ProductsByCategory copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? stockQuantity,
    String? categoryId,
    String? categoryName,
    List<String>? imagePath,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProductsByCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stockQuantity': stockQuantity,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'imagePath': imagePath,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ProductsByCategory.fromMap(Map<String, dynamic> map) {
    return ProductsByCategory(
      id: map['id'].toString(),
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      stockQuantity: map['stockQuantity'] as int,
      categoryId: map['categoryId'].toString(),
      categoryName:
          map['categoryName'] != null ? map['categoryName'] as String : null,
      imagePath: List<String>.from((map['imagePath'] as List<dynamic>)),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsByCategory.fromJson(String source) =>
      ProductsByCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsByCategory(id: $id, name: $name, description: $description, price: $price, stockQuantity: $stockQuantity, categoryId: $categoryId, categoryName: $categoryName, imagePath: $imagePath, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ProductsByCategory other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.stockQuantity == stockQuantity &&
        other.categoryId == categoryId &&
        other.categoryName == categoryName &&
        listEquals(other.imagePath, imagePath) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        stockQuantity.hashCode ^
        categoryId.hashCode ^
        categoryName.hashCode ^
        imagePath.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
