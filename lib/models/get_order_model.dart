// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetOrderModel {
  int? orderId;
  double? totalAmount;
  String? status;
  List<Items>? items;

  GetOrderModel({this.orderId, this.totalAmount, this.status, this.items});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    totalAmount = json['totalAmount'];
    status = json['status'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['totalAmount'] = this.totalAmount;
    data['status'] = this.status;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'GetOrderModel(orderId: $orderId, totalAmount: $totalAmount, status: $status, items: $items)';
  }
}

class Items {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  double? price;
  String? productName;
  String? productImagePath;

  Items(
      {this.id,
      this.orderId,
      this.productId,
      this.quantity,
      this.price,
      this.productName,
      this.productImagePath});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    productId = json['productId'];
    quantity = json['quantity'];
    price = json['price'];
    productName = json['productName'];
    productImagePath = json['productImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['productName'] = this.productName;
    data['productImagePath'] = this.productImagePath;
    return data;
  }

  @override
  String toString() {
    return 'Items(id: $id, orderId: $orderId, productId: $productId, quantity: $quantity, price: $price, productName: $productName, productImagePath: $productImagePath)';
  }
}
