import 'dart:convert';

PaymentInfoModel paymentInfoModelFromJson(String str) =>
    PaymentInfoModel.fromJson(json.decode(str));

String paymentInfoModelToJson(PaymentInfoModel data) =>
    json.encode(data.toJson());

class PaymentInfoModel {
  PaymentInfoModel({
    required this.order,
    required this.keyData,
    required this.clientSecret,
    required this.ephemeralKey,
    required this.customerKey,
    required this.apIKey,
    required this.apISecret,
  });

  String order;
  String keyData;
  String clientSecret;
  String ephemeralKey;
  String customerKey;
  String apIKey;
  String apISecret;

  factory PaymentInfoModel.fromJson(Map<String, dynamic> json) =>
      PaymentInfoModel(
        order: json["order"] ?? '',
        keyData: json["key"],
        clientSecret: json["client_secret"] ?? '',
        ephemeralKey: json["ephemeralKey"],
        customerKey: json["customerKey"],
        apIKey: json["apI_KEY"],
        apISecret: json["apI_SECRET"],
      );

  Map<String, dynamic> toJson() => {
        "order": order,
        "key": keyData,
        "client_secret": clientSecret,
        "ephemeralKey": ephemeralKey,
        "customerKey": customerKey,
        "apI_KEY": apIKey,
        "apI_SECRET": apISecret,
      };
}
