// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.productMasterId,
    required this.quickSearch,
    required this.page,
    required this.pageSize,
    required this.productShortingTypeId,
    required this.languageId,
    required this.countryId,
    required this.currencyId,
    required this.priceHighToLow,
    required this.categoryIds,
    required this.customerId,
    required this.categorySubIds,
    required this.brandIds,
    required this.totalRecord,
    required this.viewType,
    required this.sortBy,
    required this.maxPrice,
    required this.minPrice,
    required this.priceFrom,
    required this.priceTo,
    required this.pageSizefilter,
    required this.sortById,
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
  bool priceHighToLow;
  List<dynamic> categoryIds;
  int customerId;
  List<dynamic> categorySubIds;
  List<dynamic> brandIds;
  int totalRecord;
  String viewType;
  dynamic sortBy;
  int maxPrice;
  int minPrice;
  int priceFrom;
  int priceTo;
  int pageSizefilter;
  int sortById;
  List<dynamic> productListRequestModels;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    productMasterId: json["ProductMasterId"],
    quickSearch: json["QuickSearch"],
    page: json["Page"],
    pageSize: json["PageSize"],
    productShortingTypeId: json["ProductShortingTypeId"],
    languageId: json["LanguageId"],
    countryId: json["CountryId"],
    currencyId: json["CurrencyId"],
    priceHighToLow: json["PriceHighToLow"],
    categoryIds: List<dynamic>.from(json["CategoryIds"].map((x) => x)),
    customerId: json["CustomerId"],
    categorySubIds: List<dynamic>.from(json["CategorySubIds"].map((x) => x)),
    brandIds: List<dynamic>.from(json["BrandIds"].map((x) => x)),
    totalRecord: json["TotalRecord"],
    viewType: json["ViewType"],
    sortBy: json["SortBy"],
    maxPrice: json["MaxPrice"],
    minPrice: json["MinPrice"],
    priceFrom: json["PriceFrom"],
    priceTo: json["PriceTo"],
    pageSizefilter: json["pageSizefilter"],
    sortById: json["SortById"],
    productListRequestModels: List<dynamic>.from(json["productListRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ProductMasterId": productMasterId,
    "QuickSearch": quickSearch,
    "Page": page,
    "PageSize": pageSize,
    "ProductShortingTypeId": productShortingTypeId,
    "LanguageId": languageId,
    "CountryId": countryId,
    "CurrencyId": currencyId,
    "PriceHighToLow": priceHighToLow,
    "CategoryIds": List<dynamic>.from(categoryIds.map((x) => x)),
    "CustomerId": customerId,
    "CategorySubIds": List<dynamic>.from(categorySubIds.map((x) => x)),
    "BrandIds": List<dynamic>.from(brandIds.map((x) => x)),
    "TotalRecord": totalRecord,
    "ViewType": viewType,
    "SortBy": sortBy,
    "MaxPrice": maxPrice,
    "MinPrice": minPrice,
    "PriceFrom": priceFrom,
    "PriceTo": priceTo,
    "pageSizefilter": pageSizefilter,
    "SortById": sortById,
    "productListRequestModels": List<dynamic>.from(productListRequestModels.map((x) => x)),
  };
}
