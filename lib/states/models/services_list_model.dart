// To parse this JSON data, do
//
//     final sevicesListModel = sevicesListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ServicesListModel> sevicesListModelFromJson(String str) => List<ServicesListModel>.from(json.decode(str).map((x) => ServicesListModel.fromJson(x)));

String sevicesListModelToJson(List<ServicesListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesListModel {
  ServicesListModel({
    required this.productMasterId,
    required this.productName,
    // required this.productTypeId,
    // required this.productType,
    // required this.productDecimal,
    // required this.totalRating,
    // required this.totalReview,
    // required this.storeId,
    // required this.supplierId,
    // required this.isWished,
    // required this.urlKey,
    // required this.metaTitle,
    // required this.metaKeyword,
    // required this.metaDesceiption,
    // required this.guidId,
    required this.productMasterMediaViewModels,
     required this.productSubSkuRequestModels,
  });

  int productMasterId;
  String productName;
  // int productTypeId;
  // dynamic productType;
  // int productDecimal;
  // int totalRating;
  // int totalReview;
  // int storeId;
  // int supplierId;
  // bool isWished;
  // String urlKey;
  // String metaTitle;
  // String metaKeyword;
  // String metaDesceiption;
  // String guidId;
   List<ProductMasterMediaViewModel> productMasterMediaViewModels;
   List<ProductSubSkuRequestModel> productSubSkuRequestModels;

  factory ServicesListModel.fromJson(Map<String, dynamic> json) => ServicesListModel(
    productMasterId: json["productMasterId"]??0,
    productName: json["productName"]??'',
    // productTypeId: json["productTypeId"],
    // productType: json["productType"],
    // productDecimal: json["productDecimal"],
    // totalRating: json["totalRating"],
    // totalReview: json["totalReview"],
    // storeId: json["storeId"],
    // supplierId: json["supplierId"],
    // isWished: json["isWished"],
    // urlKey: json["urlKey"],
    // metaTitle: json["metaTitle"],
    // metaKeyword: json["metaKeyword"],
    // metaDesceiption: json["metaDesceiption"],
    // guidId: json["guidId"],
    productMasterMediaViewModels: List<ProductMasterMediaViewModel>.from(json["productMasterMediaViewModels"].map((x) => ProductMasterMediaViewModel.fromJson(x))),
     productSubSkuRequestModels: List<ProductSubSkuRequestModel>.from(json["productSubSkuRequestModels"].map((x) => ProductSubSkuRequestModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "productMasterId": productMasterId,
    "productName": productName,
    // "productTypeId": productTypeId,
    // "productType": productType,
    // "productDecimal": productDecimal,
    // "totalRating": totalRating,
    // "totalReview": totalReview,
    // "storeId": storeId,
    // "supplierId": supplierId,
    // "isWished": isWished,
    // "urlKey": urlKey,
    // "metaTitle": metaTitle,
    // "metaKeyword": metaKeyword,
    // "metaDesceiption": metaDesceiption,
    // "guidId": guidId,
    "productMasterMediaViewModels": List<dynamic>.from(productMasterMediaViewModels.map((x) => x.toJson())),
     "productSubSkuRequestModels": List<dynamic>.from(productSubSkuRequestModels.map((x) => x.toJson())),
  };
}

class ProductMasterMediaViewModel {
  ProductMasterMediaViewModel({
    // required this.productMasterMediaId,
    // required this.productMasterId,
    // required this.fileType,
    required this.fileName,
    required this.fileLocation,
    // required this.videoEmbade,
    // required this.fileKey,
    // required this.mediumImage,
    // required this.smallImage,
    // required this.productSubSkuId,
    // required this.isFeatureImage,
  });

  // int productMasterMediaId;
  // int productMasterId;
  // String fileType;
  String fileName;
  String fileLocation;
  // String videoEmbade;
  // String fileKey;
  // dynamic mediumImage;
  // dynamic smallImage;
  // dynamic productSubSkuId;
  // bool isFeatureImage;

  factory ProductMasterMediaViewModel.fromJson(Map<String, dynamic> json) => ProductMasterMediaViewModel(
    // productMasterMediaId: json["productMasterMediaId"],
    // productMasterId: json["productMasterId"],
    // fileType: json["fileType"],
    fileName: json["fileName"]??'',
    fileLocation: json["fileLocation"]??'',
    // videoEmbade: json["videoEmbade"],
    // fileKey: json["fileKey"],
    // mediumImage: json["mediumImage"],
    // smallImage: json["smallImage"],
    // productSubSkuId: json["productSubSKUId"],
    // isFeatureImage: json["isFeatureImage"],
  );

  Map<String, dynamic> toJson() => {
    // "productMasterMediaId": productMasterMediaId,
    // "productMasterId": productMasterId,
    // "fileType": fileType,
    "fileName": fileName,
    "fileLocation": fileLocation,
    // "videoEmbade": videoEmbade,
    // "fileKey": fileKey,
    // "mediumImage": mediumImage,
    // "smallImage": smallImage,
    // "productSubSKUId": productSubSkuId,
    // "isFeatureImage": isFeatureImage,
  };
}

class ProductSubSkuRequestModel {
  ProductSubSkuRequestModel({
    // required this.productSubSkuId,
    // required this.productMasterId,
    // required this.storeId,
    // required this.subSku,
    // required this.previousPrice,
    required this.price,
    // required this.quantity,
    // required this.attributeCombination,
    // required this.attributeSetId,
    // required this.largeImage,
    // required this.mediumImage,
    // required this.smallImage,
    // required this.videoEmbade,
    // required this.symbol,
    // required this.productSubSkuDetailsRequestModels,
  });

  // int productSubSkuId;
  // int productMasterId;
  // int storeId;
  // String subSku;
  // dynamic previousPrice;
  double price;
  //int quantity;
  // String attributeCombination;
  // int attributeSetId;
  // String largeImage;
  // String mediumImage;
  // String smallImage;
  // String videoEmbade;
  // String symbol;
  // List<dynamic> productSubSkuDetailsRequestModels;

  factory ProductSubSkuRequestModel.fromJson(Map<String, dynamic> json) => ProductSubSkuRequestModel(
    // productSubSkuId: json["productSubSKUId"],
    // productMasterId: json["productMasterId"],
    // storeId: json["storeId"],
    // subSku: json["subSKU"],
    // previousPrice: json["previousPrice"],
     price: json["price"]??0,
    //quantity: json["quantity"]??0,
    // attributeCombination: json["attributeCombination"],
    // attributeSetId: json["attributeSetId"],
    // largeImage: json["largeImage"],
    // mediumImage: json["mediumImage"],
    // smallImage: json["smallImage"],
    // videoEmbade: json["videoEmbade"],
    // symbol: json["symbol"],
    // productSubSkuDetailsRequestModels: List<dynamic>.from(json["productSubSkuDetailsRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    // "productSubSKUId": productSubSkuId,
    // "productMasterId": productMasterId,
    // "storeId": storeId,
    // "subSKU": subSku,
    // "previousPrice": previousPrice,
    "price": price,
    //"quantity": quantity,
    // "attributeCombination": attributeCombination,
    // "attributeSetId": attributeSetId,
    // "largeImage": largeImage,
    // "mediumImage": mediumImage,
    // "smallImage": smallImage,
    // "videoEmbade": videoEmbade,
    // "symbol": symbol,
    // "productSubSkuDetailsRequestModels": List<dynamic>.from(productSubSkuDetailsRequestModels.map((x) => x)),
  };
}
