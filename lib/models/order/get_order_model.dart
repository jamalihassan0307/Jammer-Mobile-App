// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetOrderModel {
  int? orderId;
  double? totalAmount;
  String? status;
  String? orderDate;
  String? phoneNumber;
  String? city;
  String? street;
  String? postalCode;
  String? region;
  List<Items>? items;

  GetOrderModel(
      {this.orderId,
      this.totalAmount,
      this.status,
      this.orderDate,
      this.phoneNumber,
      this.city,
      this.street,
      this.postalCode,
      this.region,
      this.items});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    totalAmount = json['totalAmount'];
    status = json['status'];
    orderDate = json['orderDate'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    street = json['street'];
    postalCode = json['postalCode'];
    region = json['region'];
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
    data['orderDate'] = this.orderDate;
    data['phoneNumber'] = this.phoneNumber;
    data['city'] = this.city;
    data['street'] = this.street;
    data['postalCode'] = this.postalCode;
    data['region'] = this.region;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'GetOrderModel(orderId: $orderId, totalAmount: $totalAmount, status: $status, orderDate: $orderDate, phoneNumber: $phoneNumber, city: $city, street: $street, postalCode: $postalCode, region: $region, items: $items)';
  }
}

class Items {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  double? price;
  String? productURL;
  String? productName;
  String? productImagePath;

  Items(
      {this.id,
      this.orderId,
      this.productId,
      this.quantity,
      this.price,
      this.productURL,
      this.productName,
      this.productImagePath});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    productId = json['productId'];
    quantity = json['quantity'];
    price = json['price'];
    productURL = json['productURL'];
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
    data['productURL'] = this.productURL;
    data['productName'] = this.productName;
    data['productImagePath'] = this.productImagePath;
    return data;
  }
}
