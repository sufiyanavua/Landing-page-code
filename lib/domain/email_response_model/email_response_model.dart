import 'dart:convert';

class EmailResponseModel {
  String? data;
  String msg;

  EmailResponseModel({
    this.data,
    required this.msg,
  });

  factory EmailResponseModel.fromRawJson(String str) =>
      EmailResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmailResponseModel.fromJson(Map<String, dynamic> json) =>
      EmailResponseModel(
        data: json["data"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "msg": msg,
      };
}
