// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

class BlogListModel {
  Data? data;
  String? msg;

  BlogListModel({
    this.data,
    this.msg,
  });

  factory BlogListModel.fromRawJson(String str) =>
      BlogListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogListModel.fromJson(Map<String, dynamic> json) => BlogListModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
      };
}

class Data {
  Metadata? metadata;
  List<Blog>? blog;

  Data({
    this.metadata,
    this.blog,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        metadata: json["Metadata"] == null
            ? null
            : Metadata.fromJson(json["Metadata"]),
        blog: json["Blog"] == null
            ? []
            : List<Blog>.from(json["Blog"]!.map((x) => Blog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Metadata": metadata?.toJson(),
        "Blog": blog == null
            ? []
            : List<dynamic>.from(blog!.map((x) => x.toJson())),
      };
}

class Blog {
  String? id;
  Content? content;
  DateTime? createdAt;

  Blog({
    this.id,
    this.content,
    this.createdAt,
  });

  factory Blog.fromRawJson(String str) => Blog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
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
  List<Subdatum>? subdata;
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
            : List<Subdatum>.from(
                json["subdata"]!.map((x) => Subdatum.fromJson(x))),
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

class Subdatum {
  String? title;
  String? content;

  Subdatum({
    this.title,
    this.content,
  });

  factory Subdatum.fromRawJson(String str) =>
      Subdatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subdatum.fromJson(Map<String, dynamic> json) => Subdatum(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}

class Metadata {
  int? currentPage;
  int? pageSize;
  int? firstPage;
  int? lastPage;
  int? totalRecords;

  Metadata({
    this.currentPage,
    this.pageSize,
    this.firstPage,
    this.lastPage,
    this.totalRecords,
  });

  factory Metadata.fromRawJson(String str) =>
      Metadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentPage: json["CurrentPage"],
        pageSize: json["PageSize"],
        firstPage: json["FirstPage"],
        lastPage: json["LastPage"],
        totalRecords: json["TotalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "CurrentPage": currentPage,
        "PageSize": pageSize,
        "FirstPage": firstPage,
        "LastPage": lastPage,
        "TotalRecords": totalRecords,
      };
}
