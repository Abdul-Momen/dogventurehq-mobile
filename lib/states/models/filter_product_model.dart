// To parse this JSON data, do
//
//     final filterProductModel = filterProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FilterProductModel filterProductModelFromJson(String str) => FilterProductModel.fromJson(json.decode(str));

String filterProductModelToJson(FilterProductModel data) => json.encode(data.toJson());

class FilterProductModel {
  FilterProductModel({
    required this.productMasterId,
    required this.quickSearch,
    required this.page,
    required this.pageSize,
    required this.productShortingTypeId,
    required this.languageId,
    required this.countryId,
    required this.currencyId,
    required this.customerId,
    required this.supplierId,
    required this.priceHighToLow,
    required this.categoryIds,
    required this.categorySubIds,
    required this.brandIds,
    required this.totalRecord,
    required this.viewType,
    required this.sortBy,
    required this.maxPrice,
    required this.minPrice,
    required this.storeId,
    required this.productListRequestModels,
  });

  dynamic productMasterId;
  dynamic quickSearch;
  int page;
  int pageSize;
  dynamic productShortingTypeId;
  int languageId;
  dynamic countryId;
  dynamic currencyId;
  int customerId;
  dynamic supplierId;
  bool priceHighToLow;
  List<dynamic> categoryIds;
  List<dynamic> categorySubIds;
  List<dynamic> brandIds;
  int totalRecord;
  String viewType;
  dynamic sortBy;
  double maxPrice;
  double minPrice;
  dynamic storeId;
  List<ProductListRequestModel> productListRequestModels;

  factory FilterProductModel.fromJson(Map<String, dynamic> json) => FilterProductModel(
    productMasterId: json["productMasterId"]??0,
    quickSearch: json["quickSearch"]??'',
    page: json["page"]??0,
    pageSize: json["pageSize"]??0,
    productShortingTypeId: json["productShortingTypeId"],
    languageId: json["languageId"],
    countryId: json["countryId"],
    currencyId: json["currencyId"]??0,
    customerId: json["customerId"]??0,
    supplierId: json["supplierId"]??0,
    priceHighToLow: json["priceHighToLow"],
    categoryIds: List<dynamic>.from(json["categoryIds"].map((x) => x)),
    categorySubIds: List<dynamic>.from(json["categorySubIds"].map((x) => x)),
    brandIds: List<dynamic>.from(json["brandIds"].map((x) => x)),
    totalRecord: json["totalRecord"],
    viewType: json["viewType"],
    sortBy: json["sortBy"],
    maxPrice: json["maxPrice"]??0,
    minPrice: json["minPrice"]??0,
    storeId: json["storeId"],
    productListRequestModels: List<ProductListRequestModel>.from(json["productListRequestModels"].map((x) => ProductListRequestModel.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "productMasterId": productMasterId,
    "quickSearch": quickSearch,
    "page": page,
    "pageSize": pageSize,
    "productShortingTypeId": productShortingTypeId,
    "languageId": languageId,
    "countryId": countryId,
    "currencyId": currencyId,
    "customerId": customerId,
    "supplierId": supplierId,
    "priceHighToLow": priceHighToLow,
    "categoryIds": List<dynamic>.from(categoryIds.map((x) => x)),
    "categorySubIds": List<dynamic>.from(categorySubIds.map((x) => x)),
    "brandIds": List<dynamic>.from(brandIds.map((x) => x)),
    "totalRecord": totalRecord,
    "viewType": viewType,
    "sortBy": sortBy,
    "maxPrice": maxPrice,
    "minPrice": minPrice,
    "storeId": storeId,
    "productListRequestModels": List<dynamic>.from(productListRequestModels.map((x) => x.toJson())),
  };
}

class ProductListRequestModel {
  ProductListRequestModel({
    required this.productMasterId,
    required this.productName,
    required this.productTypeId,
    required this.productType,
    required this.productDecimal,
    required this.totalRating,
    required this.totalReview,
    required this.storeId,
    required this.supplierId,
    required this.isWished,
    required this.urlKey,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDesceiption,
    required this.guidId,
    required this.productMasterMediaViewModels,
    required this.productSubSkuRequestModels,
  });

  int productMasterId;
  String productName;
  int productTypeId;
  dynamic productType;
  double productDecimal;
  double totalRating;
  double totalReview;
  int storeId;
  int supplierId;
  bool isWished;
  String urlKey;
  String metaTitle;
  String metaKeyword;
  String metaDesceiption;
  String guidId;
  List<ProductMasterMediaViewModel> productMasterMediaViewModels;
  List<ProductSubSkuRequestModel> productSubSkuRequestModels;

  factory ProductListRequestModel.fromJson(Map<String, dynamic> json) => ProductListRequestModel(
    productMasterId: json["productMasterId"]??0,
    productName: json["productName"]??'',
    productTypeId: json["productTypeId"]??0,
    productType: json["productType"]??'',
    productDecimal: json["productDecimal"]??0,
    totalRating: json["totalRating"]??0,
    totalReview: json["totalReview"]??0,
    storeId: json["storeId"]??0,
    supplierId: json["supplierId"]??0,
    isWished: json["isWished"]??false,
    urlKey: json["urlKey"]??'',
    metaTitle: json["metaTitle"]??'',
    metaKeyword: json["metaKeyword"]??'',
    metaDesceiption: json["metaDesceiption"]??'',
    guidId: json["guidId"]??'',
    productMasterMediaViewModels: List<ProductMasterMediaViewModel>.from(json["productMasterMediaViewModels"].map((x) => ProductMasterMediaViewModel.fromJson(x))),
    productSubSkuRequestModels: List<ProductSubSkuRequestModel>.from(json["productSubSkuRequestModels"].map((x) => ProductSubSkuRequestModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "productMasterId": productMasterId,
    "productName": productName,
    "productTypeId": productTypeId,
    "productType": productType,
    "productDecimal": productDecimal,
    "totalRating": totalRating,
    "totalReview": totalReview,
    "storeId": storeId == null ? null : storeId,
    "supplierId": supplierId,
    "isWished": isWished,
    "urlKey": urlKey,
    "metaTitle": metaTitle,
    "metaKeyword": metaKeyword,
    "metaDesceiption": metaDesceiption,
    "guidId": guidId,
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
  double price;
  double quantity;
  String attributeCombination;
  int attributeSetId;
  String largeImage;
  String mediumImage;
  String smallImage;
  String videoEmbade;
  String symbol;
  List<dynamic> productSubSkuDetailsRequestModels;

  factory ProductSubSkuRequestModel.fromJson(Map<String, dynamic> json) => ProductSubSkuRequestModel(
    productSubSkuId: json["productSubSKUId"]??0,
    productMasterId: json["productMasterId"]??0,
    storeId: json["storeId"]??0,
    subSku: json["subSKU"]??'',
    previousPrice: json["previousPrice"]??0,
    price: json["price"].toDouble(),
    quantity: json["quantity"]??0,
    attributeCombination: json["attributeCombination"]??'',
    attributeSetId: json["attributeSetId"]??0,
    largeImage: json["largeImage"]??'',
    mediumImage: json["mediumImage"]??'',
    smallImage: json["smallImage"]??'',
    videoEmbade: json["videoEmbade"]??'',
    symbol: json["symbol"]??'',
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
