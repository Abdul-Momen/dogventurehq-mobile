// To parse this JSON data, do
//
//     final parentCategory = parentCategoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ParentCategory> parentCategoryFromJson(String str) => List<ParentCategory>.from(json.decode(str).map((x) => ParentCategory.fromJson(x)));

String parentCategoryToJson(List<ParentCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParentCategory {
  ParentCategory({
    required this.categoryId,
    required this.name,
    required this.subTitle,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.level,
    required this.guidId,
    // required this.parentId,
    required this.logoClass,
    required this.logoImage,
     required this.isService,
    // required this.isPreferenceCategory,
    // required this.categoryPreferenceId,
    // required this.customerId,
    // required this.details,
    // required this.childCategorys,
  });

  int categoryId;
  String name;
  String subTitle;
  String largeImage;
  String mediumImage;
  String smallImage;
  int level;
  String guidId;
  // dynamic parentId;
  String logoClass;
  String logoImage;
   bool isService;
  // bool isPreferenceCategory;
  // dynamic categoryPreferenceId;
  // dynamic customerId;
  // dynamic details;
  // List<dynamic> childCategorys;

  factory ParentCategory.fromJson(Map<String, dynamic> json) => ParentCategory(
    categoryId: json["categoryId"]??0,
    name: json["name"]??'',
    subTitle: json["subTitle"]??'' ,
    largeImage: json["largeImage"]??'',
    mediumImage: json["mediumImage"]??'',
    smallImage: json["smallImage"]??'',
    level: json["level"]??0,
    guidId: json["guidId"]??'',
    // parentId: json["parentId"]??0,
    logoClass: json["logoClass"],
    logoImage: json["logoImage"],
     isService: json["isService"]??false,
    // isPreferenceCategory: json["isPreferenceCategory"],
    // categoryPreferenceId: json["categoryPreferenceId"],
    // customerId: json["customerId"],
    // details: json["details"],
    // childCategorys: List<dynamic>.from(json["childCategorys"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "name": name,
    "subTitle": subTitle,
    "largeImage": largeImage,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "level": level,
    "guidId": guidId,
    // "parentId": parentId,
    "logoClass": logoClass,
    "logoImage": logoImage,
     "isService": isService,
    // "isPreferenceCategory": isPreferenceCategory,
    // "categoryPreferenceId": categoryPreferenceId,
    // "customerId": customerId,
    // "details": details,
    // "childCategorys": List<dynamic>.from(childCategorys.map((x) => x)),
  };
}
