// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CityModel> cityModelFromJson(String str) => List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

String cityModelToJson(List<CityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  CityModel({
    required this.cityId,
    required this.stateId,
    required this.cityName,
    required this.guidId,
  });

  int cityId;
  int stateId;
  String cityName;
  String guidId;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    cityId: json["cityId"]??0,
    stateId: json["stateId"]??0,
    cityName: json["cityName"]??'',
    guidId: json["guidId"]??'',
  );

  Map<String, dynamic> toJson() => {
    "cityId": cityId,
    "stateId": stateId,
    "cityName": cityName,
    "guidId": guidId,
  };
}
