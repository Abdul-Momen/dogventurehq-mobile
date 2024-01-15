// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'dart:convert';

ProductDetailsModel productDetailsFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    required this.productMasterId,
    required this.productName,
    required this.guidId,
    required this.urlKey,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDesceiption,
    required this.description,
    required this.shortDescription,
    required this.productTypeId,
    required this.storeId,
    required this.productType,
    required this.productDecimal,
    required this.totalRating,
    required this.totalReview,
    required this.isWished,
    // required this.quotationProductPriceRange,
    required this.productMasterMediaViewModels,
    // required this.brandRequestModel,
    required this.supplierRequestModel,
    required this.productDetailsRequestModel,
    required this.categoryRequestModels,
    required this.productSubSkuRequestModels,
    required this.attributeRequestModels,
    required this.inputFieldListRequestModel,
    required this.dealOfTheDayViewModels,
  });

  int productMasterId;
  String productName;
  String guidId;
  String urlKey;
  String metaTitle;
  String metaKeyword;
  String metaDesceiption;
  String description;
  String shortDescription;
  int productTypeId;
  int storeId;
  String productType;
  double productDecimal;
  double totalRating;
  double totalReview;
  bool isWished;
  // dynamic quotationProductPriceRange;
  List<ProductMasterMediaViewModel> productMasterMediaViewModels;
  // Map<String, int> brandRequestModel;
  SupplierRequestModel supplierRequestModel;
  ProductDetailsRequestModel productDetailsRequestModel;
  List<CategoryRequestModel> categoryRequestModels;
  List<ProductSubSkuRequestModel> productSubSkuRequestModels;
  List<dynamic> attributeRequestModels;
  InputFieldListRequestModel inputFieldListRequestModel;
  List<dynamic> dealOfTheDayViewModels;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    productMasterId: json["productMasterId"]??0,
    productName: json["productName"]??'',
    guidId: json["guidId"]??0,
    urlKey: json["urlKey"]??'',
    metaTitle: json["metaTitle"]??'',
    metaKeyword: json["metaKeyword"]??'',
    metaDesceiption: json["metaDesceiption"]??'',
    description: json["description"]??'',
    shortDescription: json["shortDescription"]??'',
    productTypeId: json["productTypeId"]??0,
    storeId: json["storeId"]??0,
    productType: json["productType"]??0,
    productDecimal: json["productDecimal"]??0,
    totalRating: json["totalRating"]??0,
    totalReview: json["totalReview"]??0,
    isWished: json["isWished"]??false,
    // quotationProductPriceRange: json["quotationProductPriceRange"],
    productMasterMediaViewModels: List<ProductMasterMediaViewModel>.from(json["productMasterMediaViewModels"].map((x) => ProductMasterMediaViewModel.fromJson(x))),
    // brandRequestModel: Map.from(json["brandRequestModel"]).map((k, v) => MapEntry<String, int>(k, v == null ? null : v))as Map,
    supplierRequestModel: SupplierRequestModel.fromJson(json["supplierRequestModel"]),
    productDetailsRequestModel: ProductDetailsRequestModel.fromJson(json["productDetailsRequestModel"]),
    categoryRequestModels: List<CategoryRequestModel>.from(json["categoryRequestModels"].map((x) => CategoryRequestModel.fromJson(x))),
    productSubSkuRequestModels: List<ProductSubSkuRequestModel>.from(json["productSubSkuRequestModels"].map((x) => ProductSubSkuRequestModel.fromJson(x))),
    attributeRequestModels: List<dynamic>.from(json["attributeRequestModels"].map((x) => x)),
    inputFieldListRequestModel: InputFieldListRequestModel.fromJson(json["inputFieldListRequestModel"]),
    dealOfTheDayViewModels: List<dynamic>.from(json["dealOfTheDayViewModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productMasterId": productMasterId,
    "productName": productName,
    "guidId": guidId,
    "urlKey": urlKey,
    "metaTitle": metaTitle,
    "metaKeyword": metaKeyword,
    "metaDesceiption": metaDesceiption,
    "description": description,
    "shortDescription": shortDescription,
    "productTypeId": productTypeId,
    "storeId": storeId,
    "productType": productType,
    "productDecimal": productDecimal,
    "totalRating": totalRating,
    "totalReview": totalReview,
    "isWished": isWished,
    // "quotationProductPriceRange": quotationProductPriceRange,
    "productMasterMediaViewModels": List<dynamic>.from(productMasterMediaViewModels.map((x) => x.toJson())),
    // "brandRequestModel": Map.from(brandRequestModel).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
    "supplierRequestModel": supplierRequestModel.toJson(),
    "productDetailsRequestModel": productDetailsRequestModel.toJson(),
    "categoryRequestModels": List<dynamic>.from(categoryRequestModels.map((x) => x.toJson())),
    "productSubSkuRequestModels": List<dynamic>.from(productSubSkuRequestModels.map((x) => x.toJson())),
    "attributeRequestModels": List<dynamic>.from(attributeRequestModels.map((x) => x)),
    "inputFieldListRequestModel": inputFieldListRequestModel.toJson(),
    "dealOfTheDayViewModels": List<dynamic>.from(dealOfTheDayViewModels.map((x) => x)),
  };
}

class CategoryRequestModel {
  CategoryRequestModel({
    required this.productCategoryId,
    required this.productMasterId,
    required this.categoryId,
    required this.categoryName,
  });

  int productCategoryId;
  int productMasterId;
  int categoryId;
  String categoryName;

  factory CategoryRequestModel.fromJson(Map<String, dynamic> json) => CategoryRequestModel(
    productCategoryId: json["productCategoryId"],
    productMasterId: json["productMasterId"],
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
  );

  Map<String, dynamic> toJson() => {
    "productCategoryId": productCategoryId,
    "productMasterId": productMasterId,
    "categoryId": categoryId,
    "categoryName": categoryName,
  };
}

class InputFieldListRequestModel {
  InputFieldListRequestModel({
    required this.inputFieldListId,
    required this.listName,
    required this.inputFieldRequestModels,
  });

  int inputFieldListId;
  dynamic listName;
  List<dynamic> inputFieldRequestModels;

  factory InputFieldListRequestModel.fromJson(Map<String, dynamic> json) => InputFieldListRequestModel(
    inputFieldListId: json["inputFieldListId"],
    listName: json["listName"],
    inputFieldRequestModels: List<dynamic>.from(json["inputFieldRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "inputFieldListId": inputFieldListId,
    "listName": listName,
    "inputFieldRequestModels": List<dynamic>.from(inputFieldRequestModels.map((x) => x)),
  };
}

class ProductDetailsRequestModel {
  ProductDetailsRequestModel({
    required this.productDetailsId,
    required this.productMasterId,
    required this.sku,
    required this.weight,
    required this.stockAvailability,
    required this.visibility,
    required this.taxClassId,
    required this.manufactureCountryId,
    required this.serviceDetails,
    required this.serviceDateTime,
    required this.digitalProductUrl,
    required this.digitalProductDetails,
    required this.distributorCompanyId,
    required this.visibilityName,
    required this.taxClassName,
    required this.productDetailsMediaRequestModels,
  });

  int productDetailsId;
  int productMasterId;
  String sku;
  double weight;
  int stockAvailability;
  dynamic visibility;
  int taxClassId;
  dynamic manufactureCountryId;
  String serviceDetails;
  dynamic serviceDateTime;
  String digitalProductUrl;
  String digitalProductDetails;
  dynamic distributorCompanyId;
  dynamic visibilityName;
  String taxClassName;
  List<dynamic> productDetailsMediaRequestModels;

  factory ProductDetailsRequestModel.fromJson(Map<String, dynamic> json) => ProductDetailsRequestModel(
    productDetailsId: json["productDetailsId"],
    productMasterId: json["productMasterId"],
    sku: json["sku"],
    weight: json["weight"]??0,
    stockAvailability: json["stockAvailability"],
    visibility: json["visibility"],
    taxClassId: json["taxClassId"],
    manufactureCountryId: json["manufactureCountryId"],
    serviceDetails: json["serviceDetails"],
    serviceDateTime: json["serviceDateTime"],
    digitalProductUrl: json["digitalProductUrl"],
    digitalProductDetails: json["digitalProductDetails"],
    distributorCompanyId: json["distributorCompanyId"],
    visibilityName: json["visibilityName"],
    taxClassName: json["taxClassName"],
    productDetailsMediaRequestModels: List<dynamic>.from(json["productDetailsMediaRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productDetailsId": productDetailsId,
    "productMasterId": productMasterId,
    "sku": sku,
    "weight": weight,
    "stockAvailability": stockAvailability,
    "visibility": visibility,
    "taxClassId": taxClassId,
    "manufactureCountryId": manufactureCountryId,
    "serviceDetails": serviceDetails,
    "serviceDateTime": serviceDateTime,
    "digitalProductUrl": digitalProductUrl,
    "digitalProductDetails": digitalProductDetails,
    "distributorCompanyId": distributorCompanyId,
    "visibilityName": visibilityName,
    "taxClassName": taxClassName,
    "productDetailsMediaRequestModels": List<dynamic>.from(productDetailsMediaRequestModels.map((x) => x)),
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
  String mediumImage;
  String smallImage;
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
  dynamic symbol;
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

class SupplierRequestModel {
  SupplierRequestModel({
    required this.supplierId,
    required this.supplierName,
  });

  int supplierId;
  String supplierName;

  factory SupplierRequestModel.fromJson(Map<String, dynamic> json) => SupplierRequestModel(
    supplierId: json["supplierId"],
    supplierName: json["supplierName"],
  );

  Map<String, dynamic> toJson() => {
    "supplierId": supplierId,
    "supplierName": supplierName,
  };
}
