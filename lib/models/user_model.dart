// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String id;
  String fullName;
  String email;
  int roleId;
  String passwordHash;
  String image;
  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.roleId,
    required this.passwordHash,
    required this.image,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    int? roleId,
    String? passwordHash,
    String? image,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      roleId: roleId ?? this.roleId,
      passwordHash: passwordHash ?? this.passwordHash,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'roleId': roleId,
      'passwordHash': passwordHash,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      roleId: map['roleId'] as int,
      passwordHash: map['passwordHash'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, roleId: $roleId, passwordHash: $passwordHash, image: $image)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.email == email &&
        other.roleId == roleId &&
        other.passwordHash == passwordHash &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        roleId.hashCode ^
        passwordHash.hashCode ^
        image.hashCode;
  }
}
