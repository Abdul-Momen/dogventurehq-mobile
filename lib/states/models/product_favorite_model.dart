// To parse this JSON data, do
//
//     final favoriteProductModel = favoriteProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FavoriteProductModel favoriteProductModelFromJson(String str) => FavoriteProductModel.fromJson(json.decode(str));

String favoriteProductModelToJson(FavoriteProductModel data) => json.encode(data.toJson());

class FavoriteProductModel {
  FavoriteProductModel({
    required this.productMasterId,
    required this.productSubSkuId,
    required this.customerId,
    required this.tempId,
    required this.ipAddress,
  });

  int productMasterId;
  int productSubSkuId;
  int customerId;
  String tempId;
  String ipAddress;

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) => FavoriteProductModel(
    productMasterId: json["productMasterId"]??0,
    productSubSkuId: json["productSubSKUId"]??0,
    customerId: json["customerId"]??0,
    tempId: json["tempId"]??'',
    ipAddress: json["ipAddress"]??'',
  );

  Map<String, dynamic> toJson() => {
    "productMasterId": productMasterId,
    "productSubSKUId": productSubSkuId,
    "customerId": customerId,
    "tempId": tempId,
    "ipAddress": ipAddress,
  };
}
