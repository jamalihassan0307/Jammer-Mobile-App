// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  String? id;
  String? userId;
  String? city;
  String? street;
  String? postalCode;
  String? region;

  AddressModel(
      {this.id,
      this.userId,
      this.city,
      this.street,
      this.postalCode,
      this.region});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    city = json['city'];
    street = json['street'];
    postalCode = json['postalCode'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['city'] = this.city;
    data['street'] = this.street;
    data['postalCode'] = this.postalCode;
    data['region'] = this.region;
    return data;
  }

  @override
  String toString() {
    return 'AddressModel(id: $id, userId: $userId, city: $city, street: $street, postalCode: $postalCode, region: $region)';
  }
}
