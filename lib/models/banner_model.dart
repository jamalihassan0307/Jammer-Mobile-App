// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannerModel {
  int? id;
  String? image;

  BannerModel({this.id, this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }

  @override
  String toString() => 'BannerModel(id: $id, image: $image)';
}
