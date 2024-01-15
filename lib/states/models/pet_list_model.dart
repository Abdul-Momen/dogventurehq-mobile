// To parse this JSON data, do
//
//     final petModel = petModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PetModel> petModelFromJson(String str) => List<PetModel>.from(json.decode(str).map((x) => PetModel.fromJson(x)));

String petModelToJson(List<PetModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetModel {
  PetModel({
    required this.profileId,
    required this.customerId,
    required this.name,
    required this.petTypeId,
    required this.petName,
    required this.profileBreedGroupId,
    required this.profileBreedGroupName,
    required this.microchipNumber,
    // required this.dateOfBirth,
     required this.gender,
    // required this.about,
    required this.isYourVaccinated,
    required this.isYourCastrated,
    required this.value,
    required this.age,
    // required this.status,
    // required this.createBy,
    // required this.updateDate,
    required this.petMediaDetailsResponseModels,
  });

  int profileId;
  int customerId;
  String name;
  int petTypeId;
  String petName;
  int profileBreedGroupId;
  String profileBreedGroupName;
  String microchipNumber;
  // dynamic dateOfBirth;
  String gender;
  // String about;
  bool isYourVaccinated;
  bool isYourCastrated;
  bool value;
  dynamic age;
  // dynamic status;
  // dynamic createBy;
  // dynamic updateDate;
  List<PetMediaDetailsResponseModel> petMediaDetailsResponseModels;

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
    profileId: json["profileId"]??0,
    customerId: json["customerId"]??0,
    name: json["name"]??'',
    petTypeId: json["petTypeId"]??0,
    petName: json["petName"]??'',
    profileBreedGroupId: json["profileBreedGroupId"]??0,
    profileBreedGroupName: json["profileBreedGroupName"]??'',
    microchipNumber: json["microchipNumber"]??'',
    // dateOfBirth: json["dateOfBirth"],
     gender: json["gender"]??'',
    // about: json["about"],
    isYourVaccinated: json["isYourVaccinated"]??false,
    isYourCastrated: json["isYourCastrated"]??false,
    value: json["value"]??false,
    age: json["age"]??0,
    // status: json["status"],
    // createBy: json["createBy"],
    // updateDate: json["updateDate"],
    petMediaDetailsResponseModels: List<PetMediaDetailsResponseModel>.from(json["petMediaDetailsResponseModels"].map((x) => PetMediaDetailsResponseModel.fromJson(x))??[]),
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
    // "dateOfBirth": dateOfBirth,
    "gender": gender,
    // "about": about,
    "isYourVaccinated": isYourVaccinated,
    "isYourCastrated": isYourCastrated,
    "value": value,
    "age": age,
    // "status": status,
    // "createBy": createBy,
    // "updateDate": updateDate,
    "petMediaDetailsResponseModels": List<dynamic>.from(petMediaDetailsResponseModels.map((x) => x.toJson())),
  };
}

class PetMediaDetailsResponseModel {
  PetMediaDetailsResponseModel({
    required this.profileId,
    required this.image,
    required this.medicalBook,
    // required this.status,
  });

  int profileId;
  String image;
  String medicalBook;
  // dynamic status;

  factory PetMediaDetailsResponseModel.fromJson(Map<String, dynamic> json) => PetMediaDetailsResponseModel(
    profileId: json["profileId"]??0,
    image: json["image"]??'',
    medicalBook: json["medicalBook"]??0,
    // status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "profileId": profileId,
    "image": image,
    "medicalBook": medicalBook,
    // "status": status,
  };
}
