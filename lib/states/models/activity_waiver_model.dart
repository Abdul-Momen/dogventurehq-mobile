// To parse this JSON data, do
//
//     final activityWaiverModel = activityWaiverModelFromJson(jsonString);

import 'dart:convert';

ActivityWaiverModel activityWaiverModelFromJson(String str) => ActivityWaiverModel.fromJson(json.decode(str));

String activityWaiverModelToJson(ActivityWaiverModel data) => json.encode(data.toJson());

class ActivityWaiverModel {
  ActivityWaiverModel({
    required this.activityWaiverId,
    required this.customerId,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.petName,
    required this.microchipNo,
    required this.color,
    required this.breed,
    required this.dateOfBirth,
    required this.createdAt,
  });

  int activityWaiverId;
  int customerId;
  String name;
  String email;
  String phoneNo;
  String address;
  String petName;
  String microchipNo;
  String color;
  String breed;
  String dateOfBirth;
  String createdAt;

  factory ActivityWaiverModel.fromJson(Map<String, dynamic> json) => ActivityWaiverModel(
    activityWaiverId: json["activityWaiverId"]??0,
    customerId: json["customerId"]??0,
    name: json["name"]??'',
    email: json["email"]??'',
    phoneNo: json["phoneNo"]??'',
    address: json["address"]??'',
    petName: json["petName"]??'',
    microchipNo: json["microchipNo"]??'',
    color: json["color"]??'',
    breed: json["breed"]??'',
    dateOfBirth: json["dateOfBirth"]??'',
    createdAt: json["createdAt"]??'',
  );

  Map<String, dynamic> toJson() => {
    "activityWaiverId": activityWaiverId,
    "customerId": customerId,
    "name": name,
    "email": email,
    "phoneNo": phoneNo,
    "address": address,
    "petName": petName,
    "microchipNo": microchipNo,
    "color": color,
    "breed": breed,
    "dateOfBirth": dateOfBirth,
    "createdAt": createdAt,
  };
}
