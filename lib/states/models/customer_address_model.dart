// To parse this JSON data, do
//
//     final customerAddressModel = customerAddressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CustomerAddressModel> customerAddressModelFromJson(String str) => List<CustomerAddressModel>.from(json.decode(str).map((x) => CustomerAddressModel.fromJson(x)));

String customerAddressModelToJson(List<CustomerAddressModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerAddressModel {
  CustomerAddressModel({
    required this.customerAddressId,
    required this.customerId,
    required this.addressType,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.address,
    // required this.buildingName,
    // required this.flatNo,
    // required this.latitude,
    // required this.longitude,
    // required this.nearByLocation,
    required this.isDefault,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.countryName,
    // required this.stateName,
    // required this.cityName,
    required this.addressLine2,
    required this.zipCode,
    required this.phoneNumber,
    // required this.customerViewModel,
  });

  int customerAddressId;
  int customerId;
  String addressType;
  int countryId;
  int stateId;
  int cityId;
  String address;
  // dynamic buildingName;
  // dynamic flatNo;
  // dynamic latitude;
  // dynamic longitude;
  // dynamic nearByLocation;
  bool isDefault;
  String status;
  String createdAt;
  String updatedAt;
  String countryName;
  // dynamic stateName;
  // dynamic cityName;
  String addressLine2;
  String zipCode;
  String phoneNumber;
  // dynamic customerViewModel;

  factory CustomerAddressModel.fromJson(Map<String, dynamic> json) => CustomerAddressModel(
    customerAddressId: json["customerAddressId"]??0,
    customerId: json["customerId"]??0,
    addressType:  json["addressType"]??'',
    countryId: json["countryId"]??0,
    stateId: json["stateId"]??0,
    cityId: json["cityId"]??0,
    address:  json["address"]??'',
    // buildingName: json["buildingName"],
    // flatNo: json["flatNo"],
    // latitude: json["latitude"],
    // longitude: json["longitude"],
    // nearByLocation: json["nearByLocation"],
    isDefault:  json["isDefault"]??false,
    status: json["status"]??"",
    createdAt: json["createdAt"]??'',
    updatedAt: json["updatedAt"]??'',
    countryName: json["countryName"]??'',
    // stateName: json["stateName"],
    // cityName: json["cityName"],
    addressLine2: json["addressLine2"]??'',
    zipCode: json["zipCode"]??'',
    phoneNumber: json["phoneNumber"]??'',
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
    // "buildingName": buildingName,
    // "flatNo": flatNo,
    // "latitude": latitude,
    // "longitude": longitude,
    // "nearByLocation": nearByLocation,
    "isDefault": isDefault,
    "status": status,
    "createdAt": createdAt,
    "updatedAt":  updatedAt,
    "countryName":  countryName,
    // "stateName": stateName,
    // "cityName": cityName,
    "addressLine2":  addressLine2,
    "zipCode": zipCode,
    "phoneNumber": phoneNumber,
    // "customerViewModel": customerViewModel,
  };
}



