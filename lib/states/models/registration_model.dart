// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  RegistrationModel({
    required this.customerId,
    required this.userName,
    required this.firstName,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  int? customerId;
  String userName;
  String firstName;
  String email;
  String phoneNo;
  String password;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        customerId: json["customerId"] ?? 0,
        userName: json["userName"] ?? '',
        firstName: json["firstName"] ?? '',
        email: json["email"] ?? '',
        phoneNo: json["phoneNo"] ?? '',
        password: json["password"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "userName": userName,
        "firstName": firstName,
        "email": email,
        "phoneNo": phoneNo,
        "password": password,
      };
}
