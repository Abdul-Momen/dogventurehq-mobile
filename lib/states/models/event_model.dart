// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<EventModel> eventModelFromJson(String str) => List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  EventModel({
    required this.eventId,
    required this.guidId,
    required this.title,
    // required this.note,
    required this.description,
    // required this.itineraryDetails,
    // required this.eventUrl,
    // required this.eventSmallLogo,
    // required this.eventMediumLogo,
    // required this.eventLargeLogo,
    // required this.backgroundImage,
    required this.eventSmallImage,
    required this.eventMediumImage,
    required this.eventLargeImage,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.address,
    required this.status,
    required this.totalTickets,
    required this.totalSold,
    required this.supplierId,
    required this.storeId,
    required this.eventOrganizer,
    required this.phone,
    required this.email,
    required this.eventTicketsProductMasterViewModels,
    required this.eventImagesViewModels,
  });

  int eventId;
  String guidId;
  String title;
   // dynamic note;
   String description;
  // dynamic itineraryDetails;
  // dynamic eventUrl;
  // dynamic eventSmallLogo;
  // dynamic eventMediumLogo;
  // dynamic eventLargeLogo;
  // dynamic backgroundImage;
  String eventSmallImage;
  String eventMediumImage;
  String eventLargeImage;
  String startDate;
  String endDate;
  String startTime;
  String endTime;
  String address;
  String status;
  int totalTickets;
  int totalSold;
  dynamic supplierId;
  dynamic storeId;
  dynamic eventOrganizer;
  dynamic phone;
  dynamic email;
  List<dynamic> eventTicketsProductMasterViewModels;
  List<dynamic> eventImagesViewModels;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    eventId: json["eventId"]??0,
    guidId: json["guidId"]??'',
    title: json["title"]??'',
    // note: json["note"],
    description: json["description"]??'',
    // itineraryDetails: json["itineraryDetails"],
    // eventUrl: json["eventUrl"],
    // eventSmallLogo: json["eventSmallLogo"],
    // eventMediumLogo: json["eventMediumLogo"],
    // eventLargeLogo: json["eventLargeLogo"],
    // backgroundImage: json["backgroundImage"],
    eventSmallImage: json["eventSmallImage"]??'',
    eventMediumImage: json["eventMediumImage"]??'',
    eventLargeImage: json["eventLargeImage"]??'',
    startDate: json["startDate"]??'',
    endDate: json["endDate"]??'',
    startTime: json["startTime"]??'',
    endTime: json["endTime"]??'',
    address: json["address"]??'',
    status: json["status"]??'',
    totalTickets: json["totalTickets"]??0,
    totalSold: json["totalSold"]??0,
    supplierId: json["supplierId"]??0,
    storeId: json["storeId"]??0,
    eventOrganizer: json["eventOrganizer"]??'',
    phone: json["phone"]??'',
    email: json["email"]??'',
    eventTicketsProductMasterViewModels: List<dynamic>.from(json["eventTicketsProductMasterViewModels"].map((x) => x)),
    eventImagesViewModels: List<dynamic>.from(json["eventImagesViewModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "guidId": guidId,
    "title": title,
    // "note": note,
    "description": description,
    // "itineraryDetails": itineraryDetails,
    // "eventUrl": eventUrl,
    // "eventSmallLogo": eventSmallLogo,
    // "eventMediumLogo": eventMediumLogo,
    // "eventLargeLogo": eventLargeLogo,
    // "backgroundImage": backgroundImage,
    "eventSmallImage": eventSmallImage,
    "eventMediumImage": eventMediumImage,
    "eventLargeImage": eventLargeImage,
    "startDate": startDate,
    "endDate": endDate,
    "startTime": startTime,
    "endTime": endTime,
    "address": address,
    "status": status,
    "totalTickets": totalTickets,
    "totalSold": totalSold,
    "supplierId": supplierId,
    "storeId": storeId,
    "eventOrganizer": eventOrganizer,
    "phone": phone,
    "email": email,
    "eventTicketsProductMasterViewModels": List<dynamic>.from(eventTicketsProductMasterViewModels.map((x) => x)),
    "eventImagesViewModels": List<dynamic>.from(eventImagesViewModels.map((x) => x)),
  };
}
