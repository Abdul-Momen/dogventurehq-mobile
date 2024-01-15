// To parse this JSON data, do
//
//     final myWalletModel = myWalletModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyWalletModel myWalletModelFromJson(String str) =>
    MyWalletModel.fromJson(json.decode(str));

String myWalletModelToJson(MyWalletModel data) => json.encode(data.toJson());

class MyWalletModel {
  MyWalletModel({
    required this.walletId,
    required this.refNumber,
    required this.customerId,
    required this.totalDebit,
    required this.totalCredit,
    required this.balance,
    required this.cardNumber,
    required this.note,
    required this.status,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.isDelete,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.amount,
    required this.totalRecords,
    required this.transactionType,
    required this.fullName,
    required this.walletTransactionViewModel,
  });

  int walletId;
  String refNumber;
  int customerId;
  double totalDebit;
  double totalCredit;
  double balance;
  String cardNumber;
  String note;
  String status;
  DateTime createdAt;
  DateTime lastUpdatedAt;
  dynamic isDelete;
  String firstName;
  String middleName;
  String lastName;
  double amount;
  int totalRecords;
  int transactionType;
  String fullName;
  WalletTransactionViewModel walletTransactionViewModel;

  factory MyWalletModel.fromJson(Map<String, dynamic> json) => MyWalletModel(
        walletId: json["walletId"],
        refNumber: json["refNumber"],
        customerId: json["customerId"],
        totalDebit: json["totalDebit"]??0,
        totalCredit: json["totalCredit"],
        balance: json["balance"],
        cardNumber: json["cardNumber"],
        note: json["note"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        lastUpdatedAt: DateTime.parse(json["lastUpdatedAt"]),
        isDelete: json["isDelete"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        amount: json["amount"]??0,
        totalRecords: json["totalRecords"],
        transactionType: json["transactionType"],
        fullName: json["fullName"],
        walletTransactionViewModel: WalletTransactionViewModel.fromJson(
            json["walletTransactionViewModel"]),
      );

  Map<String, dynamic> toJson() => {
        "walletId": walletId,
        "refNumber": refNumber,
        "customerId": customerId,
        "totalDebit": totalDebit,
        "totalCredit": totalCredit,
        "balance": balance,
        "cardNumber": cardNumber,
        "note": note,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "lastUpdatedAt": lastUpdatedAt.toIso8601String(),
        "isDelete": isDelete,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "amount": amount,
        "totalRecords": totalRecords,
        "transactionType": transactionType,
        "fullName": fullName,
        "walletTransactionViewModel": walletTransactionViewModel.toJson(),
      };
}

class WalletTransactionViewModel {
  WalletTransactionViewModel({
    required this.walletTransactionId,
    required this.walletId,
    required this.paymentMethodId,
    required this.transactionDate,
    required this.transactionType,
    required this.amount,
    required this.cardNumber,
    required this.note,
    required this.status,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.methodName,
    required this.totalCredit,
    required this.totalDebit,
    required this.balance,
    required this.totalRecords,
    required this.customerViewModel,
    required this.invoiceId,
  });

  int walletTransactionId;
  dynamic walletId;
  dynamic paymentMethodId;
  dynamic transactionDate;
  dynamic transactionType;
  double amount;
  dynamic cardNumber;
  dynamic note;
  dynamic status;
  dynamic createdAt;
  dynamic lastUpdatedAt;
  dynamic methodName;
  double totalCredit;
  double totalDebit;
  double balance;
  int totalRecords;
  CustomerViewModel customerViewModel;
  int invoiceId;

  factory WalletTransactionViewModel.fromJson(Map<String, dynamic> json) =>
      WalletTransactionViewModel(
        walletTransactionId: json["walletTransactionId"],
        walletId: json["walletId"],
        paymentMethodId: json["paymentMethodId"],
        transactionDate: json["transactionDate"],
        transactionType: json["transactionType"],
        amount: json["amount"]??0,
        cardNumber: json["cardNumber"],
        note: json["note"],
        status: json["status"],
        createdAt: json["createdAt"],
        lastUpdatedAt: json["lastUpdatedAt"],
        methodName: json["methodName"],
        totalCredit: json["totalCredit"],
        totalDebit: json["totalDebit"],
        balance: json["balance"],
        totalRecords: json["totalRecords"],
        customerViewModel:
            CustomerViewModel.fromJson(json["customerViewModel"]),
        invoiceId: json["invoiceId"],
      );

  Map<String, dynamic> toJson() => {
        "walletTransactionId": walletTransactionId,
        "walletId": walletId,
        "paymentMethodId": paymentMethodId,
        "transactionDate": transactionDate,
        "transactionType": transactionType,
        "amount": amount,
        "cardNumber": cardNumber,
        "note": note,
        "status": status,
        "createdAt": createdAt,
        "lastUpdatedAt": lastUpdatedAt,
        "methodName": methodName,
        "totalCredit": totalCredit,
        "totalDebit": totalDebit,
        "balance": balance,
        "totalRecords": totalRecords,
        "customerViewModel": customerViewModel.toJson(),
        "invoiceId": invoiceId,
      };
}

class CustomerViewModel {
  CustomerViewModel({
    required this.customerId,
    required this.userName,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.email2,
    required this.phoneNo,
    required this.phoneNo2,
    required this.phoneNo3,
    required this.gender,
    required this.dateOfBirth,
    required this.points,
    required this.pointInValue,
    required this.ratings,
    required this.totalOrders,
    required this.isBlacklisted,
    required this.isCorporate,
    required this.isNewsletterSub,
    required this.isReviewEnable,
    required this.isUpdatePassword,
    required this.isUpdateAddress,
    required this.age,
    required this.kids,
    required this.pet,
    required this.password,
    required this.accountType,
    required this.customerTypeId,
    required this.token,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.customerGroupId,
    required this.taxorVatNumber,
    required this.totalOrder,
    required this.walletBalance,
    required this.totalRecords,
    required this.image,
    required this.otp,
    required this.otpDateTime,
    required this.thirdPartyKey,
    required this.latitued,
    required this.longitued,
    required this.sessionId,
    required this.petProfileImage,
    required this.firebaseToken,
    required this.distance,
    required this.distanceTime,
    required this.aboutCustomer,
    required this.membershipId,
    required this.membershipValidDate,
    required this.customerGroupViewModel,
    required this.customerAddressViewModels,
    required this.customerAddressViewModel,
    required this.walletTransactionViewModels,
    required this.invoiceMasterViewModel,
    required this.invoiceMasterViewModels,
    required this.cartResponseModels,
    required this.customerProfileViewModels,
    required this.profileIds,
    required this.registeredFrom,
    required this.firstLastName,
  });

  int customerId;
  dynamic userName;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  dynamic email;
  dynamic email2;
  dynamic phoneNo;
  dynamic phoneNo2;
  dynamic phoneNo3;
  int gender;
  dynamic dateOfBirth;
  dynamic points;
  dynamic pointInValue;
  dynamic ratings;
  dynamic totalOrders;
  dynamic isBlacklisted;
  dynamic isCorporate;
  dynamic isNewsletterSub;
  dynamic isReviewEnable;
  dynamic isUpdatePassword;
  dynamic isUpdateAddress;
  dynamic age;
  dynamic kids;
  dynamic pet;
  dynamic password;
  dynamic accountType;
  dynamic customerTypeId;
  dynamic token;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic isDeleted;
  int customerGroupId;
  dynamic taxorVatNumber;
  int totalOrder;
  dynamic walletBalance;
  int totalRecords;
  dynamic image;
  int otp;
  dynamic otpDateTime;
  dynamic thirdPartyKey;
  dynamic latitued;
  dynamic longitued;
  dynamic sessionId;
  dynamic petProfileImage;
  dynamic firebaseToken;
  dynamic distance;
  dynamic distanceTime;
  dynamic aboutCustomer;
  dynamic membershipId;
  dynamic membershipValidDate;
  CustomerGroupViewModel customerGroupViewModel;
  List<dynamic> customerAddressViewModels;
  CustomerAddressViewModel customerAddressViewModel;
  List<dynamic> walletTransactionViewModels;
  dynamic invoiceMasterViewModel;
  List<dynamic> invoiceMasterViewModels;
  dynamic cartResponseModels;
  List<dynamic> customerProfileViewModels;
  dynamic profileIds;
  dynamic registeredFrom;
  String firstLastName;

  factory CustomerViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerViewModel(
        customerId: json["customerId"],
        userName: json["userName"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        email2: json["email2"],
        phoneNo: json["phoneNo"],
        phoneNo2: json["phoneNo2"],
        phoneNo3: json["phoneNo3"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"],
        points: json["points"],
        pointInValue: json["pointInValue"],
        ratings: json["ratings"],
        totalOrders: json["totalOrders"],
        isBlacklisted: json["isBlacklisted"],
        isCorporate: json["isCorporate"],
        isNewsletterSub: json["isNewsletterSub"],
        isReviewEnable: json["isReviewEnable"],
        isUpdatePassword: json["isUpdatePassword"],
        isUpdateAddress: json["isUpdateAddress"],
        age: json["age"],
        kids: json["kids"],
        pet: json["pet"],
        password: json["password"],
        accountType: json["accountType"],
        customerTypeId: json["customerTypeId"],
        token: json["token"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        isDeleted: json["isDeleted"],
        customerGroupId: json["customerGroupId"],
        taxorVatNumber: json["taxorVatNumber"],
        totalOrder: json["totalOrder"],
        walletBalance: json["walletBalance"],
        totalRecords: json["totalRecords"],
        image: json["image"],
        otp: json["otp"],
        otpDateTime: json["otpDateTime"],
        thirdPartyKey: json["thirdPartyKey"],
        latitued: json["latitued"],
        longitued: json["longitued"],
        sessionId: json["sessionId"],
        petProfileImage: json["petProfileImage"],
        firebaseToken: json["firebaseToken"],
        distance: json["distance"],
        distanceTime: json["distanceTime"],
        aboutCustomer: json["aboutCustomer"],
        membershipId: json["membershipId"],
        membershipValidDate: json["membershipValidDate"],
        customerGroupViewModel:
            CustomerGroupViewModel.fromJson(json["customerGroupViewModel"]),
        customerAddressViewModels:
            List<dynamic>.from(json["customerAddressViewModels"].map((x) => x)),
        customerAddressViewModel:
            CustomerAddressViewModel.fromJson(json["customerAddressViewModel"]),
        walletTransactionViewModels: List<dynamic>.from(
            json["walletTransactionViewModels"].map((x) => x)),
        invoiceMasterViewModel: json["invoiceMasterViewModel"],
        invoiceMasterViewModels:
            List<dynamic>.from(json["invoiceMasterViewModels"].map((x) => x)),
        cartResponseModels: json["cartResponseModels"],
        customerProfileViewModels:
            List<dynamic>.from(json["customerProfileViewModels"].map((x) => x)),
        profileIds: json["profileIds"],
        registeredFrom: json["registeredFrom"],
        firstLastName: json["firstLastName"],
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "userName": userName,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "email": email,
        "email2": email2,
        "phoneNo": phoneNo,
        "phoneNo2": phoneNo2,
        "phoneNo3": phoneNo3,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "points": points,
        "pointInValue": pointInValue,
        "ratings": ratings,
        "totalOrders": totalOrders,
        "isBlacklisted": isBlacklisted,
        "isCorporate": isCorporate,
        "isNewsletterSub": isNewsletterSub,
        "isReviewEnable": isReviewEnable,
        "isUpdatePassword": isUpdatePassword,
        "isUpdateAddress": isUpdateAddress,
        "age": age,
        "kids": kids,
        "pet": pet,
        "password": password,
        "accountType": accountType,
        "customerTypeId": customerTypeId,
        "token": token,
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "isDeleted": isDeleted,
        "customerGroupId": customerGroupId,
        "taxorVatNumber": taxorVatNumber,
        "totalOrder": totalOrder,
        "walletBalance": walletBalance,
        "totalRecords": totalRecords,
        "image": image,
        "otp": otp,
        "otpDateTime": otpDateTime,
        "thirdPartyKey": thirdPartyKey,
        "latitued": latitued,
        "longitued": longitued,
        "sessionId": sessionId,
        "petProfileImage": petProfileImage,
        "firebaseToken": firebaseToken,
        "distance": distance,
        "distanceTime": distanceTime,
        "aboutCustomer": aboutCustomer,
        "membershipId": membershipId,
        "membershipValidDate": membershipValidDate,
        "customerGroupViewModel": customerGroupViewModel.toJson(),
        "customerAddressViewModels":
            List<dynamic>.from(customerAddressViewModels.map((x) => x)),
        "customerAddressViewModel": customerAddressViewModel.toJson(),
        "walletTransactionViewModels":
            List<dynamic>.from(walletTransactionViewModels.map((x) => x)),
        "invoiceMasterViewModel": invoiceMasterViewModel,
        "invoiceMasterViewModels":
            List<dynamic>.from(invoiceMasterViewModels.map((x) => x)),
        "cartResponseModels": cartResponseModels,
        "customerProfileViewModels":
            List<dynamic>.from(customerProfileViewModels.map((x) => x)),
        "profileIds": profileIds,
        "registeredFrom": registeredFrom,
        "firstLastName": firstLastName,
      };
}

class CustomerAddressViewModel {
  CustomerAddressViewModel({
    required this.customerAddressId,
    required this.customerId,
    required this.addressType,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.address,
    required this.buildingName,
    required this.flatNo,
    required this.latitude,
    required this.longitude,
    required this.nearByLocation,
    required this.isDefault,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.countryName,
    required this.stateName,
    required this.cityName,
    required this.addressLine2,
    required this.zipCode,
    required this.phoneNumber,
    required this.customerViewModel,
  });

  int customerAddressId;
  int customerId;
  dynamic addressType;
  int countryId;
  int stateId;
  int cityId;
  dynamic address;
  dynamic buildingName;
  dynamic flatNo;
  dynamic latitude;
  dynamic longitude;
  dynamic nearByLocation;
  dynamic isDefault;
  dynamic status;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic countryName;
  dynamic stateName;
  dynamic cityName;
  dynamic addressLine2;
  dynamic zipCode;
  dynamic phoneNumber;
  dynamic customerViewModel;

  factory CustomerAddressViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerAddressViewModel(
        customerAddressId: json["customerAddressId"],
        customerId: json["customerId"],
        addressType: json["addressType"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        address: json["address"],
        buildingName: json["buildingName"],
        flatNo: json["flatNo"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        nearByLocation: json["nearByLocation"],
        isDefault: json["isDefault"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
        countryName: json["countryName"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        addressLine2: json["addressLine2"],
        zipCode: json["zipCode"],
        phoneNumber: json["phoneNumber"],
        customerViewModel: json["customerViewModel"],
      );

  Map<String, dynamic> toJson() => {
        "customerAddressId": customerAddressId,
        "customerId": customerId,
        "addressType": addressType,
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "address": address,
        "buildingName": buildingName,
        "flatNo": flatNo,
        "latitude": latitude,
        "longitude": longitude,
        "nearByLocation": nearByLocation,
        "isDefault": isDefault,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt,
        "countryName": countryName,
        "stateName": stateName,
        "cityName": cityName,
        "addressLine2": addressLine2,
        "zipCode": zipCode,
        "phoneNumber": phoneNumber,
        "customerViewModel": customerViewModel,
      };
}

class CustomerGroupViewModel {
  CustomerGroupViewModel({
    required this.customerGroupId,
    required this.groupName,
    required this.taxClass,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  int customerGroupId;
  dynamic groupName;
  dynamic taxClass;
  dynamic isDeleted;
  DateTime createdAt;
  dynamic updatedAt;

  factory CustomerGroupViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerGroupViewModel(
        customerGroupId: json["customerGroupId"],
        groupName: json["groupName"],
        taxClass: json["taxClass"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "customerGroupId": customerGroupId,
        "groupName": groupName,
        "taxClass": taxClass,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt,
      };
}
