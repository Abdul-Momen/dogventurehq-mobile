// To parse this JSON data, do
//
//     final petBreedModel = petBreedModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PetBreedModel> petBreedModelFromJson(String str) => List<PetBreedModel>.from(json.decode(str).map((x) => PetBreedModel.fromJson(x)));

String petBreedModelToJson(List<PetBreedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetBreedModel {
  PetBreedModel({
    required this.profileBreedGroupId,
    required this.name,
  });

  int profileBreedGroupId;
  String name;

  factory PetBreedModel.fromJson(Map<String, dynamic> json) => PetBreedModel(
    profileBreedGroupId: json["profileBreedGroupId"]??0,
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "profileBreedGroupId": profileBreedGroupId,
    "name": name,
  };
}
