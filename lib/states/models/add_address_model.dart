// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  AddAddressModel({
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
    required this.countryName,
    required this.stateName,
    required this.cityName,
    required this.addressLine2,
    required this.zipCode,
    required this.phoneNumber,
    required this.editedCustomerAddressId,
  });

  int customerAddressId;
  int customerId;
  String addressType;
  int countryId;
  int stateId;
  int cityId;
  String address;
  dynamic buildingName;
  dynamic flatNo;
  dynamic latitude;
  dynamic longitude;
  dynamic nearByLocation;
  dynamic isDefault;
  dynamic countryName;
  dynamic stateName;
  dynamic cityName;
  String addressLine2;
  dynamic zipCode;
  dynamic phoneNumber;
  int editedCustomerAddressId;

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
    customerAddressId: json["CustomerAddressId"]??0,
    customerId: json["CustomerId"]??0,
    addressType: json["AddressType"]??'',
    countryId: json["CountryId"]??0,
    stateId: json["StateId"]??0,
    cityId: json["CityId"]??0,
    address: json["Address"]??'',
    buildingName: json["BuildingName"]??'',
    flatNo: json["FlatNo"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    nearByLocation: json["NearByLocation"],
    isDefault: json["IsDefault"],
    countryName: json["CountryName"],
    stateName: json["StateName"],
    cityName: json["CityName"],
    addressLine2: json["AddressLine2"]??'',
    zipCode: json["ZipCode"],
    phoneNumber: json["PhoneNumber"],
    editedCustomerAddressId: json["EditedCustomerAddressId"]??0,
  );

  Map<String, dynamic> toJson() => {
    "CustomerAddressId": customerAddressId,
    "CustomerId": customerId,
    "AddressType": addressType,
    "CountryId": countryId,
    "StateId": stateId,
    "CityId": cityId,
    "Address": address,
    "BuildingName": buildingName,
    "FlatNo": flatNo,
    "Latitude": latitude,
    "Longitude": longitude,
    "NearByLocation": nearByLocation,
    "IsDefault": isDefault,
    "CountryName": countryName,
    "StateName": stateName,
    "CityName": cityName,
    "AddressLine2": addressLine2,
    "ZipCode": zipCode,
    "PhoneNumber": phoneNumber,
    "EditedCustomerAddressId": editedCustomerAddressId,
  };
}
