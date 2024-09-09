// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReviewModel {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? message;
  int? points;
  String? fullname;
  String? image;

  ReviewModel(
      {this.id,
      this.productId,
      this.userId,
      this.createdAt,
      this.message,
      this.points,
      this.fullname,
      this.image});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    message = json['message'];
    points = json['points'];
    fullname = json['fullname'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['message'] = this.message;
    data['points'] = this.points;
    data['fullname'] = this.fullname;
    data['image'] = this.image;
    return data;
  }

  @override
  String toString() {
    return 'ReviewModel(id: $id, productId: $productId, userId: $userId, createdAt: $createdAt, message: $message, points: $points, fullname: $fullname, image: $image)';
  }
}
