// To parse this JSON data, do
//
//     final addContactModel = addContactModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddContactModel addContactModelFromJson(String str) => AddContactModel.fromJson(json.decode(str));

String addContactModelToJson(AddContactModel data) => json.encode(data.toJson());

class AddContactModel {
  AddContactModel({
    required this.contactUsId,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.subject,
    required this.message,
    required this.createdAt,
  });

  int contactUsId;
  String name;
  String email;
  String phoneNo;
  String subject;
  String message;
  DateTime createdAt;

  factory AddContactModel.fromJson(Map<String, dynamic> json) => AddContactModel(
    contactUsId: json["contactUsId"],
    name: json["name"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    subject: json["subject"],
    message: json["message"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "contactUsId": contactUsId,
    "name": name,
    "email": email,
    "phoneNo": phoneNo,
    "subject": subject,
    "message": message,
    "createdAt": createdAt.toIso8601String(),
  };
}
