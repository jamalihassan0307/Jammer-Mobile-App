// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannerModel {
  int? id;
  String? image;
  int? linkId;
  int? link;
  int? couponId;

  BannerModel({this.id, this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    linkId = json['linkId'];
    link = json['link'];
    couponId = json['couponId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['link'] = this.link;
    data['linkId'] = this.linkId;
    data['couponId'] = this.couponId;
    return data;
  }

  @override
  String toString() {
    return 'BannerModel(id: $id, image: $image, linkId: $linkId, link: $link, couponId: $couponId)';
  }
}
