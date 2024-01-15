// To parse this JSON data, do
//
//     final petTypeModel = petTypeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PetTypeModel> petTypeModelFromJson(String str) => List<PetTypeModel>.from(json.decode(str).map((x) => PetTypeModel.fromJson(x)));

String petTypeModelToJson(List<PetTypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetTypeModel {
  PetTypeModel({
    required this.petTypeId,
    required this.name,
  });

  int petTypeId;
  String name;

  factory PetTypeModel.fromJson(Map<String, dynamic> json) => PetTypeModel(
    petTypeId: json["petTypeId"]??0,
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "petTypeId": petTypeId,
    "name": name,
  };
}
