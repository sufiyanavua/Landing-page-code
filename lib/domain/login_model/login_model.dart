import 'dart:convert';

class LoginModel {
  String email;
  String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email.trim(),
        "password": password.trim(),
      };
}
