// To parse this JSON data, do
//
//     final relatedProductModel = relatedProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<RelatedProductModel> relatedProductModelFromJson(String str) => List<RelatedProductModel>.from(json.decode(str).map((x) => RelatedProductModel.fromJson(x)));

String relatedProductModelToJson(List<RelatedProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RelatedProductModel {
  RelatedProductModel({
    required this.productMasterId,
    required this.productName,
    required this.productType,
    required this.productTypeId,
    required this.productDecimal,
    required this.guidId,
    required this.urlKey,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDesceiption,
    // required this.description,
     required this.shortDescription,
    required this.totalRating,
    required this.totalReview,
    required this.storeId,
    required this.isWished,
    required this.supplierId,
    required this.productMasterMediaViewModels,
    required this.productSubSkuRequestModels,
  });

  int productMasterId;
  String productName;
  String productType;
  int productTypeId;
  int productDecimal;
  String guidId;
  String urlKey;
  String metaTitle;
  String metaKeyword;
  String metaDesceiption;
  // dynamic description;
   dynamic shortDescription;
  int totalRating;
  int totalReview;
  int storeId;
  bool isWished;
  int supplierId;
  List<ProductMasterMediaViewModel> productMasterMediaViewModels;
  List<ProductSubSkuRequestModel> productSubSkuRequestModels;

  factory RelatedProductModel.fromJson(Map<String, dynamic> json) => RelatedProductModel(
    productMasterId: json["productMasterId"]??0,
    productName: json["productName"]??'',
    productType: json["productType"]??'',
    productTypeId: json["productTypeId"]??0,
    productDecimal: json["productDecimal"]??0,
    guidId: json["guidId"]??'',
    urlKey: json["urlKey"]??'',
    metaTitle: json["metaTitle"]??'',
    metaKeyword: json["metaKeyword"]??'',
    metaDesceiption: json["metaDesceiption"],
    // description: json["description"],
    shortDescription: json["shortDescription"]??'',
    totalRating: json["totalRating"]??0,
    totalReview: json["totalReview"]??0,
    storeId: json["storeId"]??0,
    isWished: json["isWished"]??true,
     supplierId: json["supplierId"],
    productMasterMediaViewModels: List<ProductMasterMediaViewModel>.from(json["productMasterMediaViewModels"].map((x) => ProductMasterMediaViewModel.fromJson(x))),
    productSubSkuRequestModels: List<ProductSubSkuRequestModel>.from(json["productSubSkuRequestModels"].map((x) => ProductSubSkuRequestModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "productMasterId": productMasterId,
    "productName": productName,
    "productType": productType,
    "productTypeId": productTypeId,
    "productDecimal": productDecimal,
    "guidId": guidId,
    "urlKey": urlKey,
    "metaTitle": metaTitle,
    "metaKeyword": metaKeyword,
    "metaDesceiption": metaDesceiption,
    // "description": description,
    // "shortDescription": shortDescription,
    "totalRating": totalRating,
    "totalReview": totalReview,
    "storeId": storeId,
    "isWished": isWished,
    "supplierId": supplierId,
    "productMasterMediaViewModels": List<dynamic>.from(productMasterMediaViewModels.map((x) => x.toJson())),
    "productSubSkuRequestModels": List<dynamic>.from(productSubSkuRequestModels.map((x) => x.toJson())),
  };
}

class ProductMasterMediaViewModel {
  ProductMasterMediaViewModel({
    required this.productMasterMediaId,
    required this.productMasterId,
    required this.fileType,
    required this.fileName,
    required this.fileLocation,
    required this.videoEmbade,
    required this.fileKey,
    required this.mediumImage,
    required this.smallImage,
    required this.productSubSkuId,
    required this.isFeatureImage,
  });

  int productMasterMediaId;
  int productMasterId;
  String fileType;
  String fileName;
  String fileLocation;
  String videoEmbade;
  String fileKey;
  dynamic mediumImage;
  dynamic smallImage;
  dynamic productSubSkuId;
  bool isFeatureImage;

  factory ProductMasterMediaViewModel.fromJson(Map<String, dynamic> json) => ProductMasterMediaViewModel(
    productMasterMediaId: json["productMasterMediaId"],
    productMasterId: json["productMasterId"],
    fileType: json["fileType"],
    fileName: json["fileName"],
    fileLocation: json["fileLocation"],
    videoEmbade: json["videoEmbade"],
    fileKey: json["fileKey"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    productSubSkuId: json["productSubSKUId"],
    isFeatureImage: json["isFeatureImage"],
  );

  Map<String, dynamic> toJson() => {
    "productMasterMediaId": productMasterMediaId,
    "productMasterId": productMasterId,
    "fileType": fileType,
    "fileName": fileName,
    "fileLocation": fileLocation,
    "videoEmbade": videoEmbade,
    "fileKey": fileKey,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "productSubSKUId": productSubSkuId,
    "isFeatureImage": isFeatureImage,
  };
}

class ProductSubSkuRequestModel {
  ProductSubSkuRequestModel({
    required this.productSubSkuId,
    required this.productMasterId,
    required this.storeId,
    required this.subSku,
    required this.previousPrice,
    required this.price,
    required this.quantity,
    required this.attributeCombination,
    required this.attributeSetId,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.videoEmbade,
    required this.symbol,
    required this.productSubSkuDetailsRequestModels,
  });

  int productSubSkuId;
  int productMasterId;
  int storeId;
  String subSku;
  dynamic previousPrice;
  int price;
  int quantity;
  dynamic attributeCombination;
  int attributeSetId;
  dynamic largeImage;
  String mediumImage;
  String smallImage;
  String videoEmbade;
  String symbol;
  List<dynamic> productSubSkuDetailsRequestModels;

  factory ProductSubSkuRequestModel.fromJson(Map<String, dynamic> json) => ProductSubSkuRequestModel(
    productSubSkuId: json["productSubSKUId"],
    productMasterId: json["productMasterId"],
    storeId: json["storeId"],
    subSku: json["subSKU"],
    previousPrice: json["previousPrice"],
    price: json["price"],
    quantity: json["quantity"],
    attributeCombination: json["attributeCombination"],
    attributeSetId: json["attributeSetId"],
    largeImage: json["largeImage"],
    mediumImage: json["mediumImage"],
    smallImage: json["smallImage"],
    videoEmbade: json["videoEmbade"],
    symbol: json["symbol"],
    productSubSkuDetailsRequestModels: List<dynamic>.from(json["productSubSkuDetailsRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productSubSKUId": productSubSkuId,
    "productMasterId": productMasterId,
    "storeId": storeId,
    "subSKU": subSku,
    "previousPrice": previousPrice,
    "price": price,
    "quantity": quantity,
    "attributeCombination": attributeCombination,
    "attributeSetId": attributeSetId,
    "largeImage": largeImage,
    "mediumImage": mediumImage,
    "smallImage": smallImage,
    "videoEmbade": videoEmbade,
    "symbol": symbol,
    "productSubSkuDetailsRequestModels": List<dynamic>.from(productSubSkuDetailsRequestModels.map((x) => x)),
  };
}
