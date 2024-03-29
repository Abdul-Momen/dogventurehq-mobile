// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<StateModel> stateModelFromJson(String str) => List<StateModel>.from(json.decode(str).map((x) => StateModel.fromJson(x)));

String stateModelToJson(List<StateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateModel {
  StateModel({
    required this.stateId,
    required this.countryId,
    required this.stateName,
    required this.guidId,
  });

  int stateId;
  int countryId;
  String stateName;
  String guidId;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    stateId: json["stateId"]??0,
    countryId: json["countryId"]??0,
    stateName: json["stateName"]??'',
    guidId: json["guidId"]??'',
  );

  Map<String, dynamic> toJson() => {
    "stateId": stateId,
    "countryId": countryId,
    "stateName": stateName,
    "guidId": guidId,
  };
}
