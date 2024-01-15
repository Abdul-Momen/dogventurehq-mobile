// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:hive/hive.dart';

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class FavoriteModel {
  FavoriteModel({
    required this.eventWiseListId,
    required this.eventId,
    required this.customerId,
  });

  @HiveField(0)
  int eventWiseListId;
  @HiveField(1)
  int eventId;
  @HiveField(2)
  int customerId;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    eventWiseListId: json["eventWiseListId"]??0,
    eventId: json["eventId"]??0,
    customerId: json["customerId"]??0,
  );

  Map<String, dynamic> toJson() => {
    "eventWiseListId": eventWiseListId,
    "eventId": eventId,
    "customerId": customerId,
  };
}
