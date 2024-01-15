// To parse this JSON data, do
//
//     final brandsModel = brandsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<BrandsModel> brandsModelFromJson(String str) => List<BrandsModel>.from(json.decode(str).map((x) => BrandsModel.fromJson(x)));

String brandsModelToJson(List<BrandsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandsModel {
  BrandsModel({
    required this.brandId,
    required this.title,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.value,
    required this.guidId,
    required this.urlKey,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDesceiption,
  });

  int brandId;
  String title;
  dynamic largeImage;
  dynamic mediumImage;
  dynamic smallImage;
  String guidId;
  String urlKey;
  bool value;
  String metaTitle;
  dynamic metaKeyword;
  String metaDesceiption;

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
    brandId: json["brandId"]??0,
    title: json["title"]??'',
    largeImage: json["largeImage"]??'',
    mediumImage: json["mediumImage"]??'',
    smallImage: json["smallImage"]??'',
    guidId: json["guidId"]??'',
    value: json["value"]??false,
    urlKey: json["urlKey"] ??'',
    metaTitle: json["metaTitle"]??'',
    metaKeyword: json["metaKeyword"]??'',
    metaDesceiption: json["metaDesceiption"]??'',
  );

  Map<String, dynamic> toJson() => {
    "brandId": brandId,
    "title": title,
    "largeImage": largeImage,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "guidId": guidId,
    "urlKey": urlKey ,
    "value": value ,
    "metaTitle": metaTitle ,
    "metaKeyword": metaKeyword,
    "metaDesceiption": metaDesceiption,
  };
}
