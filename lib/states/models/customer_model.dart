// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
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
    // required this.dateOfBirth,
    // required this.points,
    // required this.pointInValue,
    // required this.ratings,
    // required this.totalOrders,
    // required this.isBlacklisted,
    // required this.isCorporate,
    // required this.isNewsletterSub,
    // required this.isReviewEnable,
    // required this.isUpdatePassword,
    // required this.isUpdateAddress,
    // required this.age,
    // required this.kids,
    // required this.pet,
    required this.password,
    // required this.accountType,
    // required this.customerTypeId,
    // required this.token,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    // required this.isDeleted,
    // required this.customerGroupId,
    // required this.taxorVatNumber,
    // required this.totalOrder,
    // required this.walletBalance,
    // required this.totalRecords,
    required this.image,
    // required this.otp,
    // required this.otpDateTime,
    // required this.thirdPartyKey,
    // required this.latitued,
    // required this.longitued,
    // required this.sessionId,
    // required this.petProfileImage,
    // required this.firebaseToken,
    // required this.distance,
    // required this.distanceTime,
    required this.aboutCustomer,
    // required this.customerGroupViewModel,
    // required this.customerAddressViewModels,
     required this.customerAddressViewModel,
    // required this.walletTransactionViewModels,
    // required this.invoiceMasterViewModel,
    // required this.invoiceMasterViewModels,
    // required this.cartResponseModels,
    // required this.customerProfileViewModels,
    // required this.profileIds,
    // required this.registeredFrom,
    required this.firstLastName,
  });

  int customerId;
  String userName;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String email2;
  String phoneNo;
  String phoneNo2;
  String phoneNo3;
  int gender;
  // String dateOfBirth;

  // dynamic points;
  // dynamic pointInValue;
  // dynamic ratings;
  // dynamic totalOrders;
  // bool isBlacklisted;
  // bool isCorporate;
  // bool isNewsletterSub;
  // bool isReviewEnable;
  // dynamic isUpdatePassword;
  // dynamic isUpdateAddress;
  // dynamic age;
  // dynamic kids;
  // String pet;
  String password;

  // String accountType;
  // dynamic customerTypeId;
  // String token;
  String status;
  String createdAt;
  String updatedAt;

  // dynamic isDeleted;
  // int customerGroupId;
  // String taxorVatNumber;
  // int totalOrder;
  // dynamic walletBalance;
  // int totalRecords;
  String image;
  // int otp;
  // dynamic otpDateTime;
  // dynamic thirdPartyKey;
  // dynamic latitued;
  // dynamic longitued;
  // dynamic sessionId;
  // dynamic petProfileImage;
  // dynamic firebaseToken;
  // dynamic distance;
  // dynamic distanceTime;
  String aboutCustomer;

  // CustomerGroupViewModel customerGroupViewModel;
  // List<CustomerAddressViewModel> customerAddressViewModels;
   CustomerAddressViewModel? customerAddressViewModel;

  // List<dynamic> walletTransactionViewModels;
  // dynamic invoiceMasterViewModel;
  // List<dynamic> invoiceMasterViewModels;
  // dynamic cartResponseModels;
  // List<dynamic> customerProfileViewModels;
  // dynamic profileIds;
  // dynamic registeredFrom;
  String firstLastName;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        customerId: json["customerId"]??0,
        userName: json["userName"]??'',
        firstName: json["firstName"]??'',
        middleName: json["middleName"]??'',
        lastName: json["lastName"]??'',
        email: json["email"]??'',
        email2: json["email2"]??'',
        phoneNo: json["phoneNo"]??'',
        phoneNo2: json["phoneNo2"]??'',
        phoneNo3: json["phoneNo3"]??'',
        gender: json["gender"]??0,
        // dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        // points: json["points"],
        // pointInValue: json["pointInValue"],
        // ratings: json["ratings"],
        // totalOrders: json["totalOrders"],
        // isBlacklisted: json["isBlacklisted"],
        // isCorporate: json["isCorporate"],
        // isNewsletterSub: json["isNewsletterSub"],
        // isReviewEnable: json["isReviewEnable"],
        // isUpdatePassword: json["isUpdatePassword"],
        // isUpdateAddress: json["isUpdateAddress"],
        // age: json["age"],
        // kids: json["kids"],
        // pet: json["pet"],
        password: json["password"]??'',
        // accountType: json["accountType"],
        // customerTypeId: json["customerTypeId"],
        // token: json["token"],
        status: json["status"]??'',
        createdAt: json["createdAt"]??'',
        updatedAt: json["updatedAt"]??'',
        // isDeleted: json["isDeleted"],
        // customerGroupId: json["customerGroupId"],
        // taxorVatNumber: json["taxorVatNumber"],
        // totalOrder: json["totalOrder"],
        // walletBalance: json["walletBalance"],
        // totalRecords: json["totalRecords"],
        image: json["image"]??'',
        // otp: json["otp"],
        // otpDateTime: json["otpDateTime"],
        // thirdPartyKey: json["thirdPartyKey"],
        // latitued: json["latitued"],
        // longitued: json["longitued"],
        // sessionId: json["sessionId"],
        // petProfileImage: json["petProfileImage"],
        // firebaseToken: json["firebaseToken"],
        // distance: json["distance"],
        // distanceTime: json["distanceTime"],
        aboutCustomer: json["aboutCustomer"]??'',
        // customerGroupViewModel: CustomerGroupViewModel.fromJson(json["customerGroupViewModel"]),
        // customerAddressViewModels: List<CustomerAddressViewModel>.from(json["customerAddressViewModels"].map((x) => CustomerAddressViewModel.fromJson(x))),
         customerAddressViewModel: CustomerAddressViewModel.fromJson(json["customerAddressViewModel"]),
        // walletTransactionViewModels: List<dynamic>.from(json["walletTransactionViewModels"].map((x) => x)),
        // invoiceMasterViewModel: json["invoiceMasterViewModel"],
        // invoiceMasterViewModels: List<dynamic>.from(json["invoiceMasterViewModels"].map((x) => x)),
        // cartResponseModels: json["cartResponseModels"],
        // customerProfileViewModels: List<dynamic>.from(json["customerProfileViewModels"].map((x) => x)),
        // profileIds: json["profileIds"],
        // registeredFrom: json["registeredFrom"],
        firstLastName: json["firstLastName"]??'',
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
        // "dateOfBirth": dateOfBirth,
        // "points": points,
        // "pointInValue": pointInValue,
        // "ratings": ratings,
        // "totalOrders": totalOrders,
        // "isBlacklisted": isBlacklisted,
        // "isCorporate": isCorporate,
        // "isNewsletterSub": isNewsletterSub,
        // "isReviewEnable": isReviewEnable,
        // "isUpdatePassword": isUpdatePassword,
        // "isUpdateAddress": isUpdateAddress,
        // "age": age,
        // "kids": kids,
        // "pet": pet,
        "password": password,
        // "accountType": accountType,
        // "customerTypeId": customerTypeId,
        // "token": token,
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        // "isDeleted": isDeleted,
        // "customerGroupId": customerGroupId,
        // "taxorVatNumber": taxorVatNumber,
        // "totalOrder": totalOrder,
        // "walletBalance": walletBalance,
        // "totalRecords": totalRecords,
        "image": image,
        // "otp": otp,
        // "otpDateTime": otpDateTime,
        // "thirdPartyKey": thirdPartyKey,
        // "latitued": latitued,
        // "longitued": longitued,
        // "sessionId": sessionId,
        // "petProfileImage": petProfileImage,
        // "firebaseToken": firebaseToken,
        // "distance": distance,
        // "distanceTime": distanceTime,
        "aboutCustomer": aboutCustomer,
        // "customerGroupViewModel": customerGroupViewModel.toJson(),
        // "customerAddressViewModels": List<dynamic>.from(customerAddressViewModels.map((x) => x.toJson())),
        // "customerAddressViewModel": customerAddressViewModel!.toJson(),
        // "walletTransactionViewModels": List<dynamic>.from(walletTransactionViewModels.map((x) => x)),
        // "invoiceMasterViewModel": invoiceMasterViewModel,
        // "invoiceMasterViewModels": List<dynamic>.from(invoiceMasterViewModels.map((x) => x)),
        // "cartResponseModels": cartResponseModels,
        // "customerProfileViewModels": List<dynamic>.from(customerProfileViewModels.map((x) => x)),
        // "profileIds": profileIds,
        // "registeredFrom": registeredFrom,
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
    // required this.isDefault,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.countryName,
    required this.stateName,
    required this.cityName,
    // required this.addressLine2,
    // required this.zipCode,
    // required this.phoneNumber,
    // required this.customerViewModel,
  });

  int customerAddressId;
  int customerId;
  String addressType;
  int countryId;
  int stateId;
  int cityId;
  String address;
  String buildingName;
  String flatNo;
  double latitude;
  double longitude;
  String nearByLocation;

  // dynamic isDefault;
  String status;
  String createdAt;
  String updatedAt;
  String countryName;
  String stateName;
  String cityName;

  // dynamic addressLine2;
  // dynamic zipCode;
  // dynamic phoneNumber;
  // dynamic customerViewModel;

  factory CustomerAddressViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerAddressViewModel(
        customerAddressId: json["customerAddressId"]??0,
        customerId: json["customerId"]??0,
        addressType: json["addressType"]??'',
        countryId: json["countryId"]??0,
        stateId: json["stateId"]??0,
        cityId: json["cityId"]??0,
        address: json["address"]??'',
        buildingName: json["buildingName"]??'',
        flatNo: json["flatNo"]??'',
        latitude: json["latitude"]??0.0,
        longitude: json["longitude"]??0.0,
        nearByLocation: json["nearByLocation"]??'',
        // isDefault: json["isDefault"],
        status: json["status"]??'',
        createdAt: json["createdAt"]??'',
        updatedAt: json["updatedAt"]??'',
        countryName: json["countryName"]??'',
        stateName: json["stateName"]??'',
        cityName: json["cityName"]??'',
        // addressLine2: json["addressLine2"],
        // zipCode: json["zipCode"],
        // phoneNumber: json["phoneNumber"],
        // customerViewModel: json["customerViewModel"],
      );

  Map<String, dynamic> toJson() => {
        "customerAddressId": customerAddressId,
        "customerId": customerId,
        "addressType": addressType,
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "address": address,
        "buildingName": buildingName ,
        "flatNo": flatNo,
        "latitude": latitude ,
        "longitude": longitude ,
        "nearByLocation": nearByLocation ,
        // "isDefault": isDefault,
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "countryName": countryName,
        "stateName": stateName,
        "cityName": cityName,
        // "addressLine2": addressLine2,
        // "zipCode": zipCode,
        // "phoneNumber": phoneNumber,
        // "customerViewModel": customerViewModel,
      };
}

class CustomerGroupViewModel {
  CustomerGroupViewModel({
    required this.customerGroupId,
    required this.groupName,
    // required this.taxClass,
    // required this.isDeleted,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int customerGroupId;
  String groupName;
  // dynamic taxClass;
  // dynamic isDeleted;
  // DateTime createdAt;
  // dynamic updatedAt;

  factory CustomerGroupViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerGroupViewModel(
        customerGroupId: json["customerGroupId"]??0,
        groupName: json["groupName"]??'',
        // taxClass: json["taxClass"],
        // isDeleted: json["isDeleted"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "customerGroupId": customerGroupId,
        "groupName": groupName,
        // "taxClass": taxClass,
        // "isDeleted": isDeleted,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt,
      };
}
