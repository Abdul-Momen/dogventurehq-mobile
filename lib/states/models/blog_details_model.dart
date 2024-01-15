// To parse this JSON data, do
//
//     final blogDetailsModel = blogDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BlogDetailsModel blogDetailsModelFromJson(String str) => BlogDetailsModel.fromJson(json.decode(str));

String blogDetailsModelToJson(BlogDetailsModel data) => json.encode(data.toJson());

class BlogDetailsModel {
  BlogDetailsModel({
    required this.blogId,
    required this.blogKey,
    required this.blogCategoryId,
    required this.title,
    required this.slug,
    required this.subTitle,
    required this.smallDetails,
    required this.bigDetails,
    required this.thumbImage,
    required this.mediumImage,
    required this.largeImage,
    required this.video,
    required this.status,
    required this.authorId,
    required this.postedBy,
    required this.postedAt,
    required this.lastModified,
    required this.metaTitle,
    required this.keyword,
    required this.metaDescription,
    required this.publishDate,
    required this.isDeleted,
    required this.languageId,
    required this.blogLanguageId,
    required this.tags,
    required this.blogAuthor,
  });

  int blogId;
  dynamic blogKey;
  int blogCategoryId;
  String title;
  String slug;
  String subTitle;
  String smallDetails;
  String bigDetails;
  String thumbImage;
  String mediumImage;
  String largeImage;
  dynamic video;
  bool status;
  int authorId;
  dynamic postedBy;
  DateTime postedAt;
  DateTime lastModified;
  String metaTitle;
  String keyword;
  dynamic metaDescription;
  DateTime publishDate;
  dynamic isDeleted;
  int languageId;
  int blogLanguageId;
  dynamic tags;
  BlogAuthor blogAuthor;

  factory BlogDetailsModel.fromJson(Map<String, dynamic> json) => BlogDetailsModel(
    blogId: json["blogId"],
    blogKey: json["blogKey"],
    blogCategoryId: json["blogCategoryId"],
    title: json["title"],
    slug: json["slug"],
    subTitle: json["subTitle"],
    smallDetails: json["smallDetails"],
    bigDetails: json["bigDetails"],
    thumbImage: json["thumbImage"],
    mediumImage: json["mediumImage"],
    largeImage: json["largeImage"],
    video: json["video"],
    status: json["status"],
    authorId: json["authorId"],
    postedBy: json["postedBy"],
    postedAt: DateTime.parse(json["postedAt"]),
    lastModified: DateTime.parse(json["lastModified"]),
    metaTitle: json["metaTitle"],
    keyword: json["keyword"],
    metaDescription: json["metaDescription"],
    publishDate: DateTime.parse(json["publishDate"]),
    isDeleted: json["isDeleted"],
    languageId: json["languageId"],
    blogLanguageId: json["blogLanguageId"],
    tags: json["tags"],
    blogAuthor: BlogAuthor.fromJson(json["blogAuthor"]),
  );

  Map<String, dynamic> toJson() => {
    "blogId": blogId,
    "blogKey": blogKey,
    "blogCategoryId": blogCategoryId,
    "title": title,
    "slug": slug,
    "subTitle": subTitle,
    "smallDetails": smallDetails,
    "bigDetails": bigDetails,
    "thumbImage": thumbImage,
    "mediumImage": mediumImage,
    "largeImage": largeImage,
    "video": video,
    "status": status,
    "authorId": authorId,
    "postedBy": postedBy,
    "postedAt": postedAt.toIso8601String(),
    "lastModified": lastModified.toIso8601String(),
    "metaTitle": metaTitle,
    "keyword": keyword,
    "metaDescription": metaDescription,
    "publishDate": publishDate.toIso8601String(),
    "isDeleted": isDeleted,
    "languageId": languageId,
    "blogLanguageId": blogLanguageId,
    "tags": tags,
    "blogAuthor": blogAuthor.toJson(),
  };
}

class BlogAuthor {
  BlogAuthor({
    required this.authorId,
    required this.authorName,
    required this.smallDetails,
    required this.aboutAuthor,
    required this.autorImage,
    required this.status,
    required this.createAt,
    required this.isDeleted,
  });

  int authorId;
  String authorName;
  dynamic smallDetails;
  dynamic aboutAuthor;
  String autorImage;
  dynamic status;
  dynamic createAt;
  dynamic isDeleted;

  factory BlogAuthor.fromJson(Map<String, dynamic> json) => BlogAuthor(
    authorId: json["authorId"],
    authorName: json["authorName"],
    smallDetails: json["smallDetails"],
    aboutAuthor: json["aboutAuthor"],
    autorImage: json["autorImage"],
    status: json["status"],
    createAt: json["createAt"],
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "authorId": authorId,
    "authorName": authorName,
    "smallDetails": smallDetails,
    "aboutAuthor": aboutAuthor,
    "autorImage": autorImage,
    "status": status,
    "createAt": createAt,
    "isDeleted": isDeleted,
  };
}
