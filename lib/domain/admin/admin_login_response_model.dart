import 'dart:convert';

class AdminLoginResponseModel {
  String? data;
  String? msg;

  AdminLoginResponseModel({
    this.data,
    this.msg,
  });

  factory AdminLoginResponseModel.fromRawJson(String str) =>
      AdminLoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdminLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      AdminLoginResponseModel(
        data: json["data"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "msg": msg,
      };
}
