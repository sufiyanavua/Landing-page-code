// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

class BlogModel {
  Data? data;
  String? msg;

  BlogModel({
    this.data,
    this.msg,
  });

  factory BlogModel.fromRawJson(String str) =>
      BlogModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
      };
}

class Data {
  String? id;
  Content? content;
  DateTime? createdAt;

  Data({
    this.id,
    this.content,
    this.createdAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        content:
            json["Content"] == null ? null : Content.fromJson(json["Content"]),
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Content": content?.toJson(),
        "CreatedAt": createdAt?.toIso8601String(),
      };
}

class Content {
  List<Section>? sections;
  String? mainImage;
  String? articleTitle;
  String? introduction;

  Content({
    this.sections,
    this.mainImage,
    this.articleTitle,
    this.introduction,
  });

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromJson(x))),
        mainImage: json["mainImage"],
        articleTitle: json["articleTitle"],
        introduction: json["introduction"],
      );

  Map<String, dynamic> toJson() => {
        "sections": sections == null
            ? []
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
        "mainImage": mainImage,
        "articleTitle": articleTitle,
        "introduction": introduction,
      };
}

class Section {
  String? image;
  String? title;
  String? content;
  List<SubData>? subdata;
  bool? subheadavailable;

  Section({
    this.image,
    this.title,
    this.content,
    this.subdata,
    this.subheadavailable,
  });

  factory Section.fromRawJson(String str) => Section.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        image: json["image"],
        title: json["title"],
        content: json["content"],
        subdata: json["subdata"] == null
            ? []
            : List<SubData>.from(
                json["subdata"]!.map((x) => SubData.fromJson(x))),
        subheadavailable: json["subheadavailable"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "content": content,
        "subdata": subdata == null
            ? []
            : List<dynamic>.from(subdata!.map((x) => x.toJson())),
        "subheadavailable": subheadavailable,
      };
}

class SubData {
  String? title;
  String? content;

  SubData({
    this.title,
    this.content,
  });

  factory SubData.fromRawJson(String str) => SubData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubData.fromJson(Map<String, dynamic> json) => SubData(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
