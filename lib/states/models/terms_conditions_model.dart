// To parse this JSON data, do
//
//     final termsConditionsModel = termsConditionsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TermsConditionsModel> termsConditionsModelFromJson(String str) => List<TermsConditionsModel>.from(json.decode(str).map((x) => TermsConditionsModel.fromJson(x)));

String termsConditionsModelToJson(List<TermsConditionsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TermsConditionsModel {
  TermsConditionsModel({
    // required this.webHtmlId,
    // required this.positionName,
    // required this.tittle,
    // required this.subTittle,
    required this.html,
    // required this.largeImage,
    // required this.smallImage,
    // required this.webUrl,
    // required this.mobileUrl,
    // required this.isDeleted,
    // required this.createBy,
    // required this.createDate,
    // required this.guidId,
    // required this.languageId,
    // required this.webHtmlLanguageId,
    // required this.webHtmlLanguageViewModels,
  });

  // int webHtmlId;
  // dynamic positionName;
  // String tittle;
  // dynamic subTittle;
  String html;
  // dynamic largeImage;
  // dynamic smallImage;
  // dynamic webUrl;
  // dynamic mobileUrl;
  // dynamic isDeleted;
  // dynamic createBy;
  // dynamic createDate;
  // String guidId;
  // int languageId;
  // int webHtmlLanguageId;
  // List<dynamic> webHtmlLanguageViewModels;

  factory TermsConditionsModel.fromJson(Map<String, dynamic> json) => TermsConditionsModel(
    // webHtmlId: json["webHtmlId"],
    // positionName: json["positionName"],
    // tittle: json["tittle"],
    // subTittle: json["subTittle"],
    html: json["html"]??'',
    // largeImage: json["largeImage"],
    // smallImage: json["smallImage"],
    // webUrl: json["webUrl"],
    // mobileUrl: json["mobileUrl"],
    // isDeleted: json["isDeleted"],
    // createBy: json["createBy"],
    // createDate: json["createDate"],
    // guidId: json["guidId"],
    // languageId: json["languageId"],
    // webHtmlLanguageId: json["webHtmlLanguageId"],
    // webHtmlLanguageViewModels: List<dynamic>.from(json["webHtmlLanguageViewModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    // "webHtmlId": webHtmlId,
    // "positionName": positionName,
    // "tittle": tittle,
    // "subTittle": subTittle,
    "html": html,
    // "largeImage": largeImage,
    // "smallImage": smallImage,
    // "webUrl": webUrl,
    // "mobileUrl": mobileUrl,
    // "isDeleted": isDeleted,
    // "createBy": createBy,
    // "createDate": createDate,
    // "guidId": guidId,
    // "languageId": languageId,
    // "webHtmlLanguageId": webHtmlLanguageId,
    // "webHtmlLanguageViewModels": List<dynamic>.from(webHtmlLanguageViewModels.map((x) => x)),
  };
}
