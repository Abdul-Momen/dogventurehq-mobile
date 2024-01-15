// To parse this JSON data, do
//
//     final storeOrderModel = storeOrderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StoreOrderModel storeOrderModelFromJson(String str) => StoreOrderModel.fromJson(json.decode(str));

String storeOrderModelToJson(StoreOrderModel data) => json.encode(data.toJson());

class StoreOrderModel {
  StoreOrderModel({
    required this.invoiceMasterId,
    required this.customerId,
    required this.refNumber,
    required this.invoiceDate,
    required this.invoiceStatusId,
    required this.totalAmount,
    required this.receivedAmt,
    required this.courierCharge,
    required this.carryingCost,
    required this.paymentMethod,
    required this.remark,
    required this.discountCode,
    required this.discountValue,
    required this.paymentStatus,
    required this.status,
    required this.orderFrom,
    required this.orderSource,
    required this.createdAt,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.eventId,
    required this.membershipId,
    required this.membershipFacilitiesId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
    required this.postalCode,
    required this.createAccount,
    required this.password,
    required this.userName,
    required this.newPassword,
    required this.paymentMethodId,
    required this.addressType,
    required this.buildingName,
    required this.flatNo,
    required this.customerAddressId,
    required this.packageId,
    required this.invoiceRequestModels,
    required this.paymentRequestModels,
    required this.billingShippingAddressRequestModels,
    required this.inputFieldValueRequestModels,
  });

  int invoiceMasterId;
  int customerId;
  dynamic refNumber;
  dynamic invoiceDate;
  int invoiceStatusId;
  double totalAmount;
  double receivedAmt;
  double courierCharge;
  double carryingCost;
  dynamic paymentMethod;
  dynamic remark;
  dynamic discountCode;
  dynamic discountValue;
  dynamic paymentStatus;
  String status;
  String orderFrom;
  String orderSource;
  dynamic createdAt;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic eventId;
  dynamic membershipId;
  dynamic membershipFacilitiesId;
  dynamic firstName;
  dynamic lastName;
  dynamic phone;
  dynamic email;
  dynamic address;
  dynamic postalCode;
  bool createAccount;
  dynamic password;
  dynamic userName;
  dynamic newPassword;
  dynamic paymentMethodId;
  dynamic addressType;
  dynamic buildingName;
  dynamic flatNo;
  int customerAddressId;
  dynamic packageId;
  List<InvoiceRequestModel> invoiceRequestModels;
  List<PaymentRequestModel> paymentRequestModels;
  List<BillingShippingAddressRequestModel> billingShippingAddressRequestModels;
  List<dynamic> inputFieldValueRequestModels;

  factory StoreOrderModel.fromJson(Map<String, dynamic> json) => StoreOrderModel(
    invoiceMasterId: json["InvoiceMasterId"],
    customerId: json["CustomerId"],
    refNumber: json["RefNumber"],
    invoiceDate: json["InvoiceDate"],
    invoiceStatusId: json["InvoiceStatusId"],
    totalAmount: json["TotalAmount"],
    receivedAmt: json["ReceivedAmt"],
    courierCharge: json["CourierCharge"],
    carryingCost: json["CarryingCost"],
    paymentMethod: json["PaymentMethod"],
    remark: json["Remark"],
    discountCode: json["DiscountCode"],
    discountValue: json["DiscountValue"],
    paymentStatus: json["PaymentStatus"],
    status: json["Status"],
    orderFrom: json["OrderFrom"],
    orderSource: json["OrderSource"],
    createdAt: json["CreatedAt"],
    countryId: json["CountryId"],
    stateId: json["StateId"],
    cityId: json["CityId"],
    eventId: json["EventId"],
    membershipId: json["MembershipId"],
    membershipFacilitiesId: json["MembershipFacilitiesId"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    phone: json["Phone"],
    email: json["Email"],
    address: json["Address"],
    postalCode: json["PostalCode"],
    createAccount: json["CreateAccount"],
    password: json["Password"],
    userName: json["UserName"],
    newPassword: json["NewPassword"],
    paymentMethodId: json["PaymentMethodId"],
    addressType: json["AddressType"],
    buildingName: json["BuildingName"],
    flatNo: json["FlatNo"],
    customerAddressId: json["CustomerAddressId"],
    packageId: json["PackageId"],
    invoiceRequestModels: List<InvoiceRequestModel>.from(json["InvoiceRequestModels"].map((x) => InvoiceRequestModel.fromJson(x))),
    paymentRequestModels: List<PaymentRequestModel>.from(json["PaymentRequestModels"].map((x) => PaymentRequestModel.fromJson(x))),
    billingShippingAddressRequestModels: List<BillingShippingAddressRequestModel>.from(json["BillingShippingAddressRequestModels"].map((x) => BillingShippingAddressRequestModel.fromJson(x))),
    inputFieldValueRequestModels: List<dynamic>.from(json["InputFieldValueRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "InvoiceMasterId": invoiceMasterId,
    "CustomerId": customerId,
    "RefNumber": refNumber,
    "InvoiceDate": invoiceDate,
    "InvoiceStatusId": invoiceStatusId,
    "TotalAmount": totalAmount,
    "ReceivedAmt": receivedAmt,
    "CourierCharge": courierCharge,
    "CarryingCost": carryingCost,
    "PaymentMethod": paymentMethod,
    "Remark": remark,
    "DiscountCode": discountCode,
    "DiscountValue": discountValue,
    "PaymentStatus": paymentStatus,
    "Status": status,
    "OrderFrom": orderFrom,
    "OrderSource": orderSource,
    "CreatedAt": createdAt,
    "CountryId": countryId,
    "StateId": stateId,
    "CityId": cityId,
    "EventId": eventId,
    "MembershipId": membershipId,
    "MembershipFacilitiesId": membershipFacilitiesId,
    "FirstName": firstName,
    "LastName": lastName,
    "Phone": phone,
    "Email": email,
    "Address": address,
    "PostalCode": postalCode,
    "CreateAccount": createAccount,
    "Password": password,
    "UserName": userName,
    "NewPassword": newPassword,
    "PaymentMethodId": paymentMethodId,
    "AddressType": addressType,
    "BuildingName": buildingName,
    "FlatNo": flatNo,
    "CustomerAddressId": customerAddressId,
    "PackageId": packageId,
    "InvoiceRequestModels": List<dynamic>.from(invoiceRequestModels.map((x) => x.toJson())),
    "PaymentRequestModels": List<dynamic>.from(paymentRequestModels.map((x) => x.toJson())),
    "BillingShippingAddressRequestModels": List<dynamic>.from(billingShippingAddressRequestModels.map((x) => x.toJson())),
    "InputFieldValueRequestModels": List<dynamic>.from(inputFieldValueRequestModels.map((x) => x)),
  };
}

class BillingShippingAddressRequestModel {
  BillingShippingAddressRequestModel({
    required this.billingShippingAddressId,
    required this.invoiceMasterId,
    required this.customerId,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.name,
    required this.addressLine,
    required this.addressLine2,
    required this.landMark,
    required this.deleveryNote,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.zipCode,
    required this.email,
    required this.phoneNumber,
    required this.isDefault,
    required this.latitued,
    required this.longitued,
    required this.deleveryTime,
    required this.isBilingAddress,
    required this.isShippingAddress,
    required this.customerAddressId,
  });

  int billingShippingAddressId;
  dynamic invoiceMasterId;
  dynamic customerId;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic name;
  dynamic addressLine;
  dynamic addressLine2;
  dynamic landMark;
  dynamic deleveryNote;
  String status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic zipCode;
  dynamic email;
  dynamic phoneNumber;
  dynamic isDefault;
  dynamic latitued;
  dynamic longitued;
  dynamic deleveryTime;
  bool isBilingAddress;
  bool isShippingAddress;
  int customerAddressId;

  factory BillingShippingAddressRequestModel.fromJson(Map<String, dynamic> json) => BillingShippingAddressRequestModel(
    billingShippingAddressId: json["BillingShippingAddressId"],
    invoiceMasterId: json["InvoiceMasterId"],
    customerId: json["CustomerId"],
    countryId: json["CountryId"],
    stateId: json["StateId"],
    cityId: json["CityId"],
    name: json["Name"],
    addressLine: json["AddressLine"],
    addressLine2: json["AddressLine2"],
    landMark: json["LandMark"],
    deleveryNote: json["DeleveryNote"],
    status: json["Status"],
    createdAt: json["CreatedAt"],
    updatedAt: json["UpdatedAt"],
    zipCode: json["ZipCode"],
    email: json["Email"],
    phoneNumber: json["PhoneNumber"],
    isDefault: json["IsDefault"],
    latitued: json["Latitued"],
    longitued: json["Longitued"],
    deleveryTime: json["DeleveryTime"],
    isBilingAddress: json["IsBilingAddress"],
    isShippingAddress: json["IsShippingAddress"],
    customerAddressId: json["CustomerAddressId"],
  );

  Map<String, dynamic> toJson() => {
    "BillingShippingAddressId": billingShippingAddressId,
    "InvoiceMasterId": invoiceMasterId,
    "CustomerId": customerId,
    "CountryId": countryId,
    "StateId": stateId,
    "CityId": cityId,
    "Name": name,
    "AddressLine": addressLine,
    "AddressLine2": addressLine2,
    "LandMark": landMark,
    "DeleveryNote": deleveryNote,
    "Status": status,
    "CreatedAt": createdAt,
    "UpdatedAt": updatedAt,
    "ZipCode": zipCode,
    "Email": email,
    "PhoneNumber": phoneNumber,
    "IsDefault": isDefault,
    "Latitued": latitued,
    "Longitued": longitued,
    "DeleveryTime": deleveryTime,
    "IsBilingAddress": isBilingAddress,
    "IsShippingAddress": isShippingAddress,
    "CustomerAddressId": customerAddressId,
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
    required this.isService,
    required this.serviceDate,
    required this.serviceTimeString,
    required this.ticketBuyForCustomerId,
    required this.ticketOwnerName,
    required this.ticketOwnerEmail,
    required this.ticketOwnerPhone,
    required this.eventPetDetailsRequestModels,
    required this.invoiceDetailsRequestModels,
    required this.packageItemRequestModels,
  });

  int invoiceId;
  dynamic invoiceMasterId;
  dynamic refNumber;
  dynamic invoiceDate;
  double totalAmount;
  double receivedAmt;
  double carryingCost;
  double courierCharge;
  int paymentMethod;
  dynamic paymentStatus;
  dynamic remark;
  dynamic discountCode;
  dynamic discountValue;
  int storeId;
  String status;
  dynamic createdAt;
  int supplierId;
  bool isService;
  dynamic serviceDate;
  dynamic serviceTimeString;
  dynamic ticketBuyForCustomerId;
  dynamic ticketOwnerName;
  dynamic ticketOwnerEmail;
  dynamic ticketOwnerPhone;
  List<dynamic> eventPetDetailsRequestModels;
  List<InvoiceDetailsRequestModel> invoiceDetailsRequestModels;
  List<dynamic> packageItemRequestModels;

  factory InvoiceRequestModel.fromJson(Map<String, dynamic> json) => InvoiceRequestModel(
    invoiceId: json["InvoiceId"],
    invoiceMasterId: json["InvoiceMasterId"],
    refNumber: json["RefNumber"],
    invoiceDate: json["InvoiceDate"],
    totalAmount: json["TotalAmount"],
    receivedAmt: json["ReceivedAmt"],
    carryingCost: json["CarryingCost"],
    courierCharge: json["CourierCharge"],
    paymentMethod: json["PaymentMethod"],
    paymentStatus: json["PaymentStatus"],
    remark: json["Remark"],
    discountCode: json["DiscountCode"],
    discountValue: json["DiscountValue"],
    storeId: json["StoreId"],
    status: json["Status"],
    createdAt: json["CreatedAt"],
    supplierId: json["SupplierId"],
    isService: json["IsService"],
    serviceDate: json["ServiceDate"],
    serviceTimeString: json["ServiceTimeString"],
    ticketBuyForCustomerId: json["TicketBuyForCustomerId"],
    ticketOwnerName: json["TicketOwnerName"],
    ticketOwnerEmail: json["TicketOwnerEmail"],
    ticketOwnerPhone: json["TicketOwnerPhone"],
    eventPetDetailsRequestModels: List<dynamic>.from(json["EventPetDetailsRequestModels"].map((x) => x)),
    invoiceDetailsRequestModels: List<InvoiceDetailsRequestModel>.from(json["InvoiceDetailsRequestModels"].map((x) => InvoiceDetailsRequestModel.fromJson(x))),
    packageItemRequestModels: List<dynamic>.from(json["PackageItemRequestModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "InvoiceId": invoiceId,
    "InvoiceMasterId": invoiceMasterId,
    "RefNumber": refNumber,
    "InvoiceDate": invoiceDate,
    "TotalAmount": totalAmount,
    "ReceivedAmt": receivedAmt,
    "CarryingCost": carryingCost,
    "CourierCharge": courierCharge,
    "PaymentMethod": paymentMethod,
    "PaymentStatus": paymentStatus,
    "Remark": remark,
    "DiscountCode": discountCode,
    "DiscountValue": discountValue,
    "StoreId": storeId,
    "Status": status,
    "CreatedAt": createdAt,
    "SupplierId": supplierId,
    "IsService": isService,
    "ServiceDate": serviceDate,
    "ServiceTimeString": serviceTimeString,
    "TicketBuyForCustomerId": ticketBuyForCustomerId,
    "TicketOwnerName": ticketOwnerName,
    "TicketOwnerEmail": ticketOwnerEmail,
    "TicketOwnerPhone": ticketOwnerPhone,
    "EventPetDetailsRequestModels": List<dynamic>.from(eventPetDetailsRequestModels.map((x) => x)),
    "InvoiceDetailsRequestModels": List<dynamic>.from(invoiceDetailsRequestModels.map((x) => x.toJson())),
    "PackageItemRequestModels": List<dynamic>.from(packageItemRequestModels.map((x) => x)),
  };
}

class InvoiceDetailsRequestModel {
  InvoiceDetailsRequestModel({
    required this.invoiceDetailsId,
    required this.invoiceId,
    required this.productMasterId,
    required this.quantity,
    required this.price,
    required this.status,
    required this.productSubSkuId,
    required this.createdAt,
    required this.productName,
    required this.largeImage,
    required this.subSku,
    required this.guidId,
  });

  int invoiceDetailsId;
  dynamic invoiceId;
  int productMasterId;
  int quantity;
  double price;
  String status;
  int productSubSkuId;
  String createdAt;
  dynamic productName;
  dynamic largeImage;
  dynamic subSku;
  dynamic guidId;

  factory InvoiceDetailsRequestModel.fromJson(Map<String, dynamic> json) => InvoiceDetailsRequestModel(
    invoiceDetailsId: json["InvoiceDetailsId"],
    invoiceId: json["InvoiceId"],
    productMasterId: json["ProductMasterId"],
    quantity: json["Quantity"],
    price: json["Price"],
    status: json["Status"],
    productSubSkuId: json["ProductSubSKUId"],
    createdAt: json["CreatedAt"] == null ? null : json["CreatedAt"],
    productName: json["ProductName"],
    largeImage: json["LargeImage"],
    subSku: json["subSku"],
    guidId: json["GuidId"],
  );

  Map<String, dynamic> toJson() => {
    "InvoiceDetailsId": invoiceDetailsId,
    "InvoiceId": invoiceId,
    "ProductMasterId": productMasterId,
    "Quantity": quantity,
    "Price": price,
    "Status": status,
    "ProductSubSKUId": productSubSkuId,
    "CreatedAt": createdAt == null ? null : createdAt,
    "ProductName": productName,
    "LargeImage": largeImage,
    "subSku": subSku,
    "GuidId": guidId,
  };
}

class PaymentRequestModel {
  PaymentRequestModel({
    required this.paymentId,
    required this.invoiceMasterId,
    required this.currencyId,
    required this.amount,
    required this.courierCharge,
    required this.discountAmount,
    required this.carryingCost,
    required this.paymentMethod,
    required this.courierAgencyId,
    required this.payDate,
    required this.note,
    required this.transactionNo,
    required this.status,
    required this.createdAt,
    required this.couponId,
  });

  int paymentId;
  dynamic invoiceMasterId;
  int currencyId;
  int amount;
  int courierCharge;
  dynamic discountAmount;
  int carryingCost;
  dynamic paymentMethod;
  dynamic courierAgencyId;
  dynamic payDate;
  String note;
  dynamic transactionNo;
  dynamic status;
  dynamic createdAt;
  dynamic couponId;

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) => PaymentRequestModel(
    paymentId: json["PaymentId"],
    invoiceMasterId: json["InvoiceMasterId"],
    currencyId: json["CurrencyId"],
    amount: json["Amount"],
    courierCharge: json["CourierCharge"],
    discountAmount: json["DiscountAmount"],
    carryingCost: json["CarryingCost"],
    paymentMethod: json["PaymentMethod"],
    courierAgencyId: json["CourierAgencyId"],
    payDate: json["PayDate"],
    note: json["Note"],
    transactionNo: json["TransactionNo"],
    status: json["Status"],
    createdAt: json["CreatedAt"],
    couponId: json["CouponId"],
  );

  Map<String, dynamic> toJson() => {
    "PaymentId": paymentId,
    "InvoiceMasterId": invoiceMasterId,
    "CurrencyId": currencyId,
    "Amount": amount,
    "CourierCharge": courierCharge,
    "DiscountAmount": discountAmount,
    "CarryingCost": carryingCost,
    "PaymentMethod": paymentMethod,
    "CourierAgencyId": courierAgencyId,
    "PayDate": payDate,
    "Note": note,
    "TransactionNo": transactionNo,
    "Status": status,
    "CreatedAt": createdAt,
    "CouponId": couponId,
  };
}
