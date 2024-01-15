// To parse this JSON data, do
//
//     final userProfileUpdateModel = userProfileUpdateModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserProfileUpdateModel userProfileUpdateModelFromJson(String str) => UserProfileUpdateModel.fromJson(json.decode(str));

String userProfileUpdateModelToJson(UserProfileUpdateModel data) => json.encode(data.toJson());

class UserProfileUpdateModel {
  UserProfileUpdateModel({
    required this.customerid,
    // required this.username,
    required this.firstName,
    // required this.middleName,
    // required this.lastName,
    required this.email,
    // required this.email2,
    required this.phoneNo,
    // required this.phoneNo2,
    // required this.phoneNo3,
    required this.gender,
    // required this.dateOfBirth,
    // required this.points,
    // required this.ratings,
    // required this.totalOrders,
    // required this.isBlacklisted,
    // required this.isCorporate,
    // required this.isNewsletterSub,
    // required this.isReviewEnable,
    // required this.isUpdatePassword,
    // required this.isUpdateAddress,
    required this.password,
    // required this.accountType,
    required this.pet,
    // required this.customerTypeId,
    // required this.token,
    // required this.status,
    required this.customerGroupId,
    // required this.taxorVatNumber,
    // required this.image,
    // required this.imageFullPath,
    required this.customerAddressViewModel,
    // required this.profileIds,
    // required this.registeredFrom,
    // required this.serviceDateTime,
    // required this.serviceTimeString,
    // required this.invoiceMasterId,
    required this.aboutCustomer,
    // required this.petProfileImage,
    required this.fullName,
  });

  int customerid;
  // String username;
  String firstName;
  // dynamic middleName;
  // String lastName;
  String email;
  // dynamic email2;
  String phoneNo;
  // dynamic phoneNo2;
  // dynamic phoneNo3;
  int gender;
  // dynamic dateOfBirth;
  // dynamic points;
  // dynamic ratings;
  // dynamic totalOrders;
  // dynamic isBlacklisted;
  // dynamic isCorporate;
  // dynamic isNewsletterSub;
  // dynamic isReviewEnable;
  // dynamic isUpdatePassword;
  // dynamic isUpdateAddress;
  String password;
  // dynamic accountType;
  String pet;
  // dynamic customerTypeId;
  // dynamic token;
  // dynamic status;
  int customerGroupId;
  // dynamic taxorVatNumber;
  // dynamic image;
  // String imageFullPath;
  CustomerAddressViewModel customerAddressViewModel;
  // dynamic profileIds;
  // dynamic registeredFrom;
  // dynamic serviceDateTime;
  // dynamic serviceTimeString;
  // dynamic invoiceMasterId;
  String aboutCustomer;
  // dynamic petProfileImage;
  String fullName;

  factory UserProfileUpdateModel.fromJson(Map<String, dynamic> json) => UserProfileUpdateModel(
    customerid: json["customerid"]??0,
    // username: json["username"],
    firstName: json["FirstName"]??'',
    // middleName: json["MiddleName"],
    // lastName: json["LastName"],
    email: json["email"]??'',
    // email2: json["Email2"],
    phoneNo: json["PhoneNo"]??'',
    // phoneNo2: json["PhoneNo2"],
    // phoneNo3: json["PhoneNo3"],
    gender: json["Gender"]??0,
    // dateOfBirth: json["DateOfBirth"],
    // points: json["Points"],
    // ratings: json["Ratings"],
    // totalOrders: json["TotalOrders"],
    // isBlacklisted: json["IsBlacklisted"],
    // isCorporate: json["IsCorporate"],
    // isNewsletterSub: json["IsNewsletterSub"],
    // isReviewEnable: json["IsReviewEnable"],
    // isUpdatePassword: json["IsUpdatePassword"],
    // isUpdateAddress: json["IsUpdateAddress"],
    password: json["Password"]??'',
    // accountType: json["AccountType"],
    pet: json["Pet"]??'',
    // customerTypeId: json["CustomerTypeId"],
    // token: json["Token"],
    // status: json["Status"],
    customerGroupId: json["CustomerGroupId"]??0,
    // taxorVatNumber: json["TaxorVatNumber"],
    // image: json["Image"],
    // imageFullPath: json["ImageFullPath"],
    customerAddressViewModel: CustomerAddressViewModel.fromJson(json["CustomerAddressViewModel"]??{}),
    // profileIds: json["ProfileIds"],
    // registeredFrom: json["RegisteredFrom"],
    // serviceDateTime: json["ServiceDateTime"],
    // serviceTimeString: json["ServiceTimeString"],
    // invoiceMasterId: json["InvoiceMasterId"],
    aboutCustomer: json["AboutCustomer"]??"",
    // petProfileImage: json["PetProfileImage"],
    fullName: json["FullName"]??"",
  );

  Map<String, dynamic> toJson() => {
    "customerid": customerid,
    // "username": username,
    "FirstName": firstName,
    // "MiddleName": middleName,
    // "LastName": lastName,
    "email": email,
    // "Email2": email2,
    "PhoneNo": phoneNo,
    // "PhoneNo2": phoneNo2,
    // "PhoneNo3": phoneNo3,
    "Gender": gender,
    // "DateOfBirth": dateOfBirth,
    // "Points": points,
    // "Ratings": ratings,
    // "TotalOrders": totalOrders,
    // "IsBlacklisted": isBlacklisted,
    // "IsCorporate": isCorporate,
    // "IsNewsletterSub": isNewsletterSub,
    // "IsReviewEnable": isReviewEnable,
    // "IsUpdatePassword": isUpdatePassword,
    // "IsUpdateAddress": isUpdateAddress,
    "Password": password,
    // "AccountType": accountType,
    "Pet": pet,
    // "CustomerTypeId": customerTypeId,
    // "Token": token,
    // "Status": status,
    "CustomerGroupId": customerGroupId,
    // "TaxorVatNumber": taxorVatNumber,
    // "Image": image,
    // "ImageFullPath": imageFullPath,
    "CustomerAddressViewModel": customerAddressViewModel.toJson(),
    // "ProfileIds": profileIds,
    // "RegisteredFrom": registeredFrom,
    // "ServiceDateTime": serviceDateTime,
    // "ServiceTimeString": serviceTimeString,
    // "InvoiceMasterId": invoiceMasterId,
    "AboutCustomer": aboutCustomer,
    // "PetProfileImage": petProfileImage,
    "FullName": fullName,
  };
}

class CustomerAddressViewModel {
  CustomerAddressViewModel({
    // required this.customerAddressId,
    // required this.customerId,
    // required this.addressType,
    // required this.countryId,
    // required this.stateId,
    // required this.cityId,
    required this.address,
    // required this.buildingName,
    // required this.flatNo,
    // required this.latitude,
    // required this.longitude,
    // required this.nearByLocation,
    // required this.isDefault,
    // required this.countryName,
    // required this.stateName,
    // required this.cityName,
    // required this.addressLine2,
    // required this.zipCode,
    // required this.phoneNumber,
    // required this.editedCustomerAddressId,
  });

  // int customerAddressId;
  // int customerId;
  // dynamic addressType;
  // int countryId;
  // int stateId;
  // int cityId;
  String address;
  // dynamic buildingName;
  // dynamic flatNo;
  // dynamic latitude;
  // dynamic longitude;
  // dynamic nearByLocation;
  // dynamic isDefault;
  // dynamic countryName;
  // dynamic stateName;
  // dynamic cityName;
  // dynamic addressLine2;
  // dynamic zipCode;
  // dynamic phoneNumber;
  // int editedCustomerAddressId;

  factory CustomerAddressViewModel.fromJson(Map<String, dynamic> json) => CustomerAddressViewModel(
    // customerAddressId: json["CustomerAddressId"],
    // customerId: json["CustomerId"],
    // addressType: json["AddressType"],
    // countryId: json["CountryId"],
    // stateId: json["StateId"],
    // cityId: json["CityId"],
    address: json["Address"]??'',
    // buildingName: json["BuildingName"],
    // flatNo: json["FlatNo"],
    // latitude: json["Latitude"],
    // longitude: json["Longitude"],
    // nearByLocation: json["NearByLocation"],
    // isDefault: json["IsDefault"],
    // countryName: json["CountryName"],
    // stateName: json["StateName"],
    // cityName: json["CityName"],
    // addressLine2: json["AddressLine2"],
    // zipCode: json["ZipCode"],
    // phoneNumber: json["PhoneNumber"],
    // editedCustomerAddressId: json["EditedCustomerAddressId"],
  );

  Map<String, dynamic> toJson() => {
    // "CustomerAddressId": customerAddressId,
    // "CustomerId": customerId,
    // "AddressType": addressType,
    // "CountryId": countryId,
    // "StateId": stateId,
    // "CityId": cityId,
    "Address": address,
    // "BuildingName": buildingName,
    // "FlatNo": flatNo,
    // "Latitude": latitude,
    // "Longitude": longitude,
    // "NearByLocation": nearByLocation,
    // "IsDefault": isDefault,
    // "CountryName": countryName,
    // "StateName": stateName,
    // "CityName": cityName,
    // "AddressLine2": addressLine2,
    // "ZipCode": zipCode,
    // "PhoneNumber": phoneNumber,
    // "EditedCustomerAddressId": editedCustomerAddressId,
  };
}
