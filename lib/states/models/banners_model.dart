// To parse this JSON data, do
//
//     final bannersModel = bannersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<BannersModel> bannersModelFromJson(String str) => List<BannersModel>.from(json.decode(str).map((x) => BannersModel.fromJson(x)));

String bannersModelToJson(List<BannersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannersModel {
  BannersModel({
    required this.bannerId,
    required this.title,
    required this.subTitle,
    required this.categoryId,
    required this.largeImage,
    required this.smallImage,
    required this.buttonLink,
    required this.buttonText,
    required this.smallDetails,
    required this.bigDetails,
    required this.slug,
    required this.bannerKey,
    required this.languageId,
  });

  int bannerId;
  String title;
  String subTitle;
  int categoryId;
  String largeImage;
  String smallImage;
  String buttonLink;
  String buttonText;
  String smallDetails;
  String bigDetails;
  String slug;
  String bannerKey;
  int languageId;

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
    bannerId: json["bannerId"],
    title: json["title"],
    subTitle: json["subTitle"],
    categoryId: json["categoryId"],
    largeImage: json["largeImage"],
    smallImage: json["smallImage"],
    buttonLink: json["buttonLink"],
    buttonText: json["buttonText"],
    smallDetails: json["smallDetails"],
    bigDetails: json["bigDetails"],
    slug: json["slug"],
    bannerKey: json["bannerKey"],
    languageId: json["languageId"],
  );

  Map<String, dynamic> toJson() => {
    "bannerId": bannerId,
    "title": title,
    "subTitle": subTitle,
    "categoryId": categoryId,
    "largeImage": largeImage,
    "smallImage": smallImage,
    "buttonLink": buttonLink,
    "buttonText": buttonText,
    "smallDetails": smallDetails,
    "bigDetails": bigDetails,
    "slug": slug,
    "bannerKey": bannerKey,
    "languageId": languageId,
  };
}
