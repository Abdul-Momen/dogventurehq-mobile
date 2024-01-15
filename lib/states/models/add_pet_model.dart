// To parse this JSON data, do
//
//     final addPetModel = addPetModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddPetModel addPetModelFromJson(String str) => AddPetModel.fromJson(json.decode(str));

String addPetModelToJson(AddPetModel data) => json.encode(data.toJson());

class AddPetModel {
  AddPetModel({
    required this.profileId,
    required this.customerId,
    required this.name,
    required this.petTypeId,
    required this.petName,
    required this.profileBreedGroupId,
    required this.profileBreedGroupName,
    required this.microchipNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.about,
    required this.isYourVaccinated,
    required this.isYourCastrated,
    required this.age,
    required this.status,
    required this.createBy,
    required this.updateDate,
    // this.petMediaDetailsResponseModels,
  });

  int profileId;
  int customerId;
  String name;
  int petTypeId;
  String petName;
  int profileBreedGroupId;
  String profileBreedGroupName;
  String microchipNumber;
  dynamic dateOfBirth;
  String gender;
  String about;
  bool isYourVaccinated;
  bool isYourCastrated;
  int age;
  dynamic status;
  dynamic createBy;
  dynamic updateDate;
  // List<dynamic>? petMediaDetailsResponseModels;

  factory AddPetModel.fromJson(Map<String, dynamic> json) => AddPetModel(
    profileId: json["profileId"]??0,
    customerId: json["customerId"]??0,
    name: json["name"]??'',
    petTypeId: json["petTypeId"]??0,
    petName: json["petName"]??'',
    profileBreedGroupId: json["profileBreedGroupId"]??0,
    profileBreedGroupName: json["profileBreedGroupName"]??'',
    microchipNumber: json["microchipNumber"]??'',
    dateOfBirth: json["dateOfBirth"]??'',
    gender: json["gender"]??0,
    about: json["about"]??'',
    isYourVaccinated: json["isYourVaccinated"]??false,
    isYourCastrated: json["isYourCastrated"]??false,
    age: json["age"]??0,
    status: json["status"]??'',
    createBy: json["createBy"]??'',
    updateDate: json["updateDate"]??'',
    // petMediaDetailsResponseModels: List<dynamic>.from(json["petMediaDetailsResponseModels"].map((x) => x)??[]),
  );

  Map<String, dynamic> toJson() => {
    "profileId": profileId,
    "customerId": customerId,
    "name": name,
    "petTypeId": petTypeId,
    "petName": petName,
    "profileBreedGroupId": profileBreedGroupId,
    "profileBreedGroupName": profileBreedGroupName,
    "microchipNumber": microchipNumber,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
    "about": about,
    "isYourVaccinated": isYourVaccinated,
    "isYourCastrated": isYourCastrated,
    "age": age,
    "status": status,
    "createBy": createBy,
    "updateDate": updateDate,
     // "petMediaDetailsResponseModels": List<dynamic>.from(petMediaDetailsResponseModels!.map((x) => x)),
  };
}
