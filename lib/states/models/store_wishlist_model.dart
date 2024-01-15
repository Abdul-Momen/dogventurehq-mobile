// To parse this JSON data, do
//
//     final storeWishListModel = storeWishListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<StoreWishListModel> storeWishListModelFromJson(String str) => List<StoreWishListModel>.from(json.decode(str).map((x) => StoreWishListModel.fromJson(x)));

String storeWishListModelToJson(List<StoreWishListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreWishListModel {
  StoreWishListModel({
   required this.wishListId,
   required this.productMasterId,
   required this.guidId,
   required this.productTypeId,
   required this.productName,
   required this.fileLocation,
   required this.mediumImage,
   required this.smallImage,
   required this.productSubSkuId,
   required this.customerId,
   required this.tempId,
   required this.ipAddress,
   required this.productPrice,
   required this.price,
   required this.stockIn,
   required this.status,
   required this.createdAt,
   required this.updatedAt,
   required this.isDelete,
   required this.storeId,
   required this.supplierId,
  });

  int wishListId;
  int productMasterId;
  String guidId;
  int productTypeId;
  String productName;
  String fileLocation;
  String mediumImage;
  String smallImage;
  int productSubSkuId;
  int customerId;
  dynamic tempId;
  dynamic ipAddress;
  double productPrice;
  double price;
  dynamic stockIn;
  dynamic status;
  String createdAt;
  String updatedAt;
  bool isDelete;
  dynamic storeId;
  int supplierId;

  factory StoreWishListModel.fromJson(Map<String, dynamic> json) => StoreWishListModel(
    wishListId: json["wishListId"],
    productMasterId: json["productMasterId"],
    guidId: json["guidId"],
    productTypeId: json["productTypeId"],
    productName: json["productName"],
    fileLocation: json["fileLocation"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    productSubSkuId: json["productSubSKUId"],
    customerId: json["customerId"],
    tempId: json["tempId"],
    ipAddress: json["ipAddress"],
    productPrice: json["productPrice"],
    price: json["price"],
    stockIn: json["stockIn"],
    status: json["status"],
    createdAt:json["createdAt"],
    updatedAt:json["updatedAt"],
    isDelete: json["isDelete"],
    storeId: json["storeId"],
    supplierId: json["supplierId"],
  );

  Map<String, dynamic> toJson() => {
    "wishListId": wishListId,
    "productMasterId": productMasterId,
    "guidId": guidId,
    "productTypeId": productTypeId,
    "productName": productName,
    "fileLocation": fileLocation,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "productSubSKUId": productSubSkuId,
    "customerId": customerId,
    "tempId": tempId,
    "ipAddress": ipAddress,
    "productPrice": productPrice,
    "price": price,
    "stockIn": stockIn,
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "isDelete": isDelete,
    "storeId": storeId,
    "supplierId": supplierId,
  };
}
