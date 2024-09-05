import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetCategoryModel {
  int id;
  String name;
  int? parentId;
  String? image;
  GetCategoryModel({
    required this.id,
    required this.name,
    this.parentId,
    this.image,
  });

  GetCategoryModel copyWith({
    int? id,
    String? name,
    int? parentId,
    String? image,
  }) {
    return GetCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parentId': parentId,
      'image': image,
    };
  }

  factory GetCategoryModel.fromMap(Map<String, dynamic> map) {
    return GetCategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as int : null,
      image: map['imagePath'] != null ? map['imagePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCategoryModel.fromJson(String source) =>
      GetCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetCategoryModel(id: $id, name: $name, parentId: $parentId, image: $image)';
  }

  @override
  bool operator ==(covariant GetCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.parentId == parentId &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ parentId.hashCode ^ image.hashCode;
  }
}
