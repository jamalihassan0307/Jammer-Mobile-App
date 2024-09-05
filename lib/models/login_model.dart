import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  String message;
  String token;
  LoginModel({
    required this.message,
    required this.token,
  });

  LoginModel copyWith({
    String? message,
    String? token,
  }) {
    return LoginModel(
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'token': token,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      message: map['message'] as String,
      token: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Login(message: $message, token: $token)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.message == message && other.token == token;
  }

  @override
  int get hashCode => message.hashCode ^ token.hashCode;
}
