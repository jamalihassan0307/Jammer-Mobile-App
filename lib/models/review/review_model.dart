import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReviewModel {
  int id;
  int productId;
  int userId;
  String createdAt;
  String message;
  double points;
  String fullname;
  String image;
  ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.createdAt,
    required this.message,
    required this.points,
    required this.fullname,
    required this.image,
  });

  ReviewModel copyWith({
    int? id,
    int? productId,
    int? userId,
    String? createdAt,
    String? message,
    double? points,
    String? fullname,
    String? image,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      message: message ?? this.message,
      points: points ?? this.points,
      fullname: fullname ?? this.fullname,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'userId': userId,
      'createdAt': createdAt,
      'message': message,
      'points': points,
      'fullname': fullname,
      'image': image,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: map['id'] as int,
      productId: map['productId'] as int,
      userId: map['userId'] as int,
      createdAt: map['createdAt'] as String,
      message: map['message'] as String,
      points: map['points'] as double,
      fullname: map['fullname'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReviewModel(id: $id, productId: $productId, userId: $userId, createdAt: $createdAt, message: $message, points: $points, fullname: $fullname, image: $image)';
  }

  @override
  bool operator ==(covariant ReviewModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productId == productId &&
        other.userId == userId &&
        other.createdAt == createdAt &&
        other.message == message &&
        other.points == points &&
        other.fullname == fullname &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productId.hashCode ^
        userId.hashCode ^
        createdAt.hashCode ^
        message.hashCode ^
        points.hashCode ^
        fullname.hashCode ^
        image.hashCode;
  }
}
