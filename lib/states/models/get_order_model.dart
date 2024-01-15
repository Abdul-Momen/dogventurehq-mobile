// To parse this JSON data, do
//
//     final getOders = getOdersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetOders getOdersFromJson(String str) => GetOders.fromJson(json.decode(str));

String getOdersToJson(GetOders data) => json.encode(data.toJson());

class GetOders {
  GetOders({
    required this.order,
    required this.key,
    required this.clientSecret,
    required this.ephemeralKey,
    required this.customerKey,
    required this.apIKey,
    required this.apISecret,
  });

  Order order;
  dynamic key;
  dynamic clientSecret;
  dynamic ephemeralKey;
  dynamic customerKey;
  dynamic apIKey;
  dynamic apISecret;

  factory GetOders.fromJson(Map<String, dynamic> json) => GetOders(
    order: Order.fromJson(json["order"]),
    key: json["key"],
    clientSecret: json["client_secret"],
    ephemeralKey: json["ephemeralKey"],
    customerKey: json["customerKey"],
    apIKey: json["apI_KEY"],
    apISecret: json["apI_SECRET"],
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
    "key": key,
    "client_secret": clientSecret,
    "ephemeralKey": ephemeralKey,
    "customerKey": customerKey,
    "apI_KEY": apIKey,
    "apI_SECRET": apISecret,
  };
}

class Order {
  Order({
    // required this.invoiceMasterId,
    required this.customerId,
    required this.refNumber,
    required this.invoiceDate,
    // required this.totalAmount,
    // required this.receivedAmt,
    // required this.courierCharge,
    // required this.carryingCost,
    // required this.paymentMethod,
    // required this.remark,
    // required this.discountCode,
    // required this.discountValue,
    // required this.paymentStatus,
    // required this.status,
    // required this.createdAt,
    // required this.countryId,
    // required this.stateId,
    // required this.cityId,
    // required this.invoiceStatusId,
    // required this.supplierId,
    // required this.eventId,
    // required this.invoiceRequestModels,
    // required this.paymentRequestModels,
    // required this.billingShippingAddressRequestModels,
    // required this.inputFieldValueRequestModels,
    // required this.orderFrom,
    // required this.orderSource,
  });

  // int invoiceMasterId;
  int customerId;
  String refNumber;
  DateTime invoiceDate;
  // double totalAmount;
  // int receivedAmt;
  // int courierCharge;
  // int carryingCost;
  // dynamic paymentMethod;
  // dynamic remark;
  // dynamic discountCode;
  // dynamic discountValue;
  // int paymentStatus;
  // String status;
  // DateTime createdAt;
  // dynamic countryId;
  // dynamic stateId;
  // dynamic cityId;
  // int invoiceStatusId;
  // dynamic supplierId;
  // int eventId;
  // List<InvoiceRequestModel> invoiceRequestModels;
  // List<Map<String, int>> paymentRequestModels;
  // List<dynamic> billingShippingAddressRequestModels;
  // List<dynamic> inputFieldValueRequestModels;
  // String orderFrom;
  // String orderSource;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    // invoiceMasterId: json["invoiceMasterId"],
    customerId: json["customerId"],
    refNumber: json["refNumber"],
    invoiceDate: DateTime.parse(json["invoiceDate"]),
    // totalAmount: json["totalAmount"]??0.0,
    // receivedAmt: json["receivedAmt"]??0.0,
    // courierCharge: json["courierCharge"]??0.0,
    // carryingCost: json["carryingCost"],
    // paymentMethod: json["paymentMethod"],
    // remark: json["remark"],
    // discountCode: json["discountCode"],
    // discountValue: json["discountValue"],
    // paymentStatus: json["paymentStatus"],
    // status: json["status"],
    // createdAt: DateTime.parse(json["createdAt"]),
    // countryId: json["countryId"],
    // stateId: json["stateId"],
    // cityId: json["cityId"],
    // invoiceStatusId: json["invoiceStatusId"],
    // supplierId: json["supplierId"],
    // eventId: json["eventId"],
    // invoiceRequestModels: List<InvoiceRequestModel>.from(json["invoiceRequestModels"].map((x) => InvoiceRequestModel.fromJson(x))),
    // paymentRequestModels: List<Map<String, int>>.from(json["paymentRequestModels"].map((x) => Map.from(x).map((k, v) => MapEntry<String, int>(k, v == null ? null : v)))),
    // billingShippingAddressRequestModels: List<dynamic>.from(json["billingShippingAddressRequestModels"].map((x) => x)),
    // inputFieldValueRequestModels: List<dynamic>.from(json["inputFieldValueRequestModels"].map((x) => x)),
    // orderFrom: json["orderFrom"],
    // orderSource: json["orderSource"],
  );

  Map<String, dynamic> toJson() => {
    // "invoiceMasterId": invoiceMasterId,
    "customerId": customerId,
    "refNumber": refNumber,
     "invoiceDate": invoiceDate.toIso8601String(),
    // "totalAmount": totalAmount,
    // "receivedAmt": receivedAmt,
    // "courierCharge": courierCharge,
    // "carryingCost": carryingCost,
    // "paymentMethod": paymentMethod,
    // "remark": remark,
    // "discountCode": discountCode,
    // "discountValue": discountValue,
    // "paymentStatus": paymentStatus,
    // "status": status,
    // "createdAt": createdAt.toIso8601String(),
    // "countryId": countryId,
    // "stateId": stateId,
    // "cityId": cityId,
    // "invoiceStatusId": invoiceStatusId,
    // "supplierId": supplierId,
    // "eventId": eventId,
    // "invoiceRequestModels": List<dynamic>.from(invoiceRequestModels.map((x) => x.toJson())),
    // "paymentRequestModels": List<dynamic>.from(paymentRequestModels.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    // "billingShippingAddressRequestModels": List<dynamic>.from(billingShippingAddressRequestModels.map((x) => x)),
    // "inputFieldValueRequestModels": List<dynamic>.from(inputFieldValueRequestModels.map((x) => x)),
    // "orderFrom": orderFrom,
    // "orderSource": orderSource,
  };
}

class InvoiceRequestModel {
  InvoiceRequestModel({
    required this.invoiceId,
    required this.invoiceMasterId,
    required this.refNumber,
    required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    required this.carryingCost,
    required this.courierCharge,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.remark,
    required this.discountCode,
    required this.discountValue,
    required this.storeId,
    required this.status,
    required this.createdAt,
    required this.supplierId,
    required this.supplierName,
    required this.shopName,
    required this.invoiceStatusId,
    required this.amountToSupplier,
    required this.amountToAdmin,
    required this.supplierCommissionId,
    required this.isService,
    required this.shopLogo,
    required this.isDigitalProduct,
    required this.isQuotationProduct,
    required this.serviceDate,
    required this.serviceDateTime,
    required this.serviceTime,
    required this.serviceTimeString,
    required this.parentInvoiceId,
    required this.ticketBuyForCustomerId,
    required this.customerId,
    required this.invoiceDetailsRequestModels,
    required this.invoiceDetailsViewModels,
    required this.eventPetDetailsRequestModels,
  });

  int invoiceId;
  int invoiceMasterId;
  String refNumber;
  DateTime invoiceDate;
  int totalAmount;
  int receivedAmt;
  int carryingCost;
  int courierCharge;
  int paymentMethod;
  int paymentStatus;
  dynamic remark;
  dynamic discountCode;
  dynamic discountValue;
  int storeId;
  String status;
  dynamic createdAt;
  int supplierId;
  String supplierName;
  String shopName;
  int invoiceStatusId;
  double amountToSupplier;
  double amountToAdmin;
  dynamic supplierCommissionId;
  bool isService;
  String shopLogo;
  dynamic isDigitalProduct;
  dynamic isQuotationProduct;
  dynamic serviceDate;
  dynamic serviceDateTime;
  dynamic serviceTime;
  dynamic serviceTimeString;
  dynamic parentInvoiceId;
  int ticketBuyForCustomerId;
  dynamic customerId;
  List<Map<String, int>> invoiceDetailsRequestModels;
  List<dynamic> invoiceDetailsViewModels;
  List<dynamic> eventPetDetailsRequestModels;

  factory InvoiceRequestModel.fromJson(Map<String, dynamic> json) => InvoiceRequestModel(
    invoiceId: json["invoiceId"],
    invoiceMasterId: json["invoiceMasterId"],
    refNumber: json["refNumber"],
    invoiceDate: DateTime.parse(json["invoiceDate"]),
    totalAmount: json["totalAmount"],
    receivedAmt: json["receivedAmt"],
    carryingCost: json["carryingCost"],
    courierCharge: json["courierCharge"],
    paymentMethod: json["paymentMethod"],
    paymentStatus: json["paymentStatus"],
    remark: json["remark"],
    discountCode: json["discountCode"],
    discountValue: json["discountValue"],
    storeId: json["storeId"],
    status: json["status"],
    createdAt: json["createdAt"],
    supplierId: json["supplierId"],
    supplierName: json["supplierName"],
    shopName: json["shopName"],
    invoiceStatusId: json["invoiceStatusId"],
    amountToSupplier: json["amountToSupplier"].toDouble(),
    amountToAdmin: json["amountToAdmin"].toDouble(),
    supplierCommissionId: json["supplierCommissionId"],
    isService: json["isService"],
    shopLogo: json["shopLogo"],
    isDigitalProduct: json["isDigitalProduct"],
    isQuotationProduct: json["isQuotationProduct"],
    serviceDate: json["serviceDate"],
    serviceDateTime: json["serviceDateTime"],
    serviceTime: json["serviceTime"],
    serviceTimeString: json["serviceTimeString"],
    parentInvoiceId: json["parentInvoiceId"],
    ticketBuyForCustomerId: json["ticketBuyForCustomerId"],
    customerId: json["customerId"],
    invoiceDetailsRequestModels: List<Map<String, int>>.from(json["invoiceDetailsRequestModels"].map((x) => Map.from(x).map((k, v) => MapEntry<String, int>(k, v == null ? null : v)))),
    invoiceDetailsViewModels: List<dynamic>.from(json["invoiceDetailsViewModels"].map((x) => x)),
    eventPetDetailsRequestModels: List<dynamic>.from(json["eventPetDetailsRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "invoiceId": invoiceId,
    "invoiceMasterId": invoiceMasterId,
    "refNumber": refNumber,
    "invoiceDate": invoiceDate.toIso8601String(),
    "totalAmount": totalAmount,
    "receivedAmt": receivedAmt,
    "carryingCost": carryingCost,
    "courierCharge": courierCharge,
    "paymentMethod": paymentMethod,
    "paymentStatus": paymentStatus,
    "remark": remark,
    "discountCode": discountCode,
    "discountValue": discountValue,
    "storeId": storeId,
    "status": status,
    "createdAt": createdAt,
    "supplierId": supplierId,
    "supplierName": supplierName,
    "shopName": shopName,
    "invoiceStatusId": invoiceStatusId,
    "amountToSupplier": amountToSupplier,
    "amountToAdmin": amountToAdmin,
    "supplierCommissionId": supplierCommissionId,
    "isService": isService,
    "shopLogo": shopLogo,
    "isDigitalProduct": isDigitalProduct,
    "isQuotationProduct": isQuotationProduct,
    "serviceDate": serviceDate,
    "serviceDateTime": serviceDateTime,
    "serviceTime": serviceTime,
    "serviceTimeString": serviceTimeString,
    "parentInvoiceId": parentInvoiceId,
    "ticketBuyForCustomerId": ticketBuyForCustomerId,
    "customerId": customerId,
    "invoiceDetailsRequestModels": List<dynamic>.from(invoiceDetailsRequestModels.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    "invoiceDetailsViewModels": List<dynamic>.from(invoiceDetailsViewModels.map((x) => x)),
    "eventPetDetailsRequestModels": List<dynamic>.from(eventPetDetailsRequestModels.map((x) => x)),
  };
}
