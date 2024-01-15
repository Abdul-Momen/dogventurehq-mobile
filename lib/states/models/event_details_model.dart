// To parse this JSON data, do
//
//     final eventDetails = eventDetailsFromJson(jsonString);

import 'dart:convert';

EventDetails eventDetailsFromJson(String str) =>
    EventDetails.fromJson(json.decode(str));

String eventDetailsToJson(EventDetails data) => json.encode(data.toJson());

class EventDetails {
  EventDetails({
    required this.eventId,
    this.guidId,
    required this.title,
    required this.note,
    required this.description,
    this.itineraryDetails,
    this.eventUrl,
    this.eventSmallLogo,
    this.eventMediumLogo,
    this.eventLargeLogo,
    this.backgroundImage,
    required this.eventSmallImage,
    required this.isWished,
    this.eventMediumImage,
    this.eventLargeImage,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.address,
    this.status,
    this.totalTickets,
    this.totalSold,
    this.supplierId,
    this.storeId,
    this.eventOrganizer,
    this.phone,
    this.email,
    this.eventTicketsProductMasterViewModels,
    this.eventImagesViewModels,
  });

  int eventId;
  dynamic guidId;
  String title;
  String note;
  String description;
  dynamic itineraryDetails;
  dynamic eventUrl;
  dynamic eventSmallLogo;
  dynamic eventMediumLogo;
  dynamic eventLargeLogo;
  dynamic backgroundImage;
  String eventSmallImage;
  dynamic eventMediumImage;
  dynamic eventLargeImage;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? address;
  String? status;
  int? totalTickets;
  int? totalSold;
  int? supplierId;
  int? storeId;
  String? eventOrganizer;
  String? phone;
  bool isWished;
  String? email;
  List<EventTicketsProductMasterViewModel>? eventTicketsProductMasterViewModels;
  List<dynamic>? eventImagesViewModels;

  factory EventDetails.fromJson(Map<String, dynamic> json) => EventDetails(
        eventId: json["eventId"] ?? 0,
        guidId: json["guidId"] ?? '',
        title: json["title"] ?? '',
        note: json["note"] ?? '',
        description: json["description"] ?? '',
        itineraryDetails: json["itineraryDetails"] ?? '',
        eventUrl: json["eventUrl"] ?? '',
        eventSmallLogo: json["eventSmallLogo"] ?? '',
        eventMediumLogo: json["eventMediumLogo"] ?? '',
        eventLargeLogo: json["eventLargeLogo"] ?? '',
        backgroundImage: json["backgroundImage"] ?? '',
        eventSmallImage: json["eventSmallImage"] ?? '',
        eventMediumImage: json["eventMediumImage"] ?? '',
        eventLargeImage: json["eventLargeImage"] ?? '',
        startDate: json["startDate"] ?? '',
        endDate: json["endDate"] ?? '',
        startTime: json["startTime"] ?? '',
        endTime: json["endTime"] ?? '',
        address: json["address"] ?? '',
        status: json["status"] ?? '',
        totalTickets: json["totalTickets"] ?? 0,
        totalSold: json["totalSold"] ?? 0,
        supplierId: json["supplierId"] ?? 0,
        storeId: json["storeId"] ?? 0,
        eventOrganizer: json["eventOrganizer"] ?? '',
        phone: json["phone"] ?? '',
        email: json["email"] ?? '',
        eventTicketsProductMasterViewModels:
            List<EventTicketsProductMasterViewModel>.from(
                json["eventTicketsProductMasterViewModels"].map(
                    (x) => EventTicketsProductMasterViewModel.fromJson(x))),
        eventImagesViewModels:
            List<dynamic>.from(json["eventImagesViewModels"].map((x) => x)),
        isWished: json["isWished"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "guidId": guidId,
        "title": title,
        "note": note,
        "description": description,
        "itineraryDetails": itineraryDetails,
        "eventUrl": eventUrl,
        "eventSmallLogo": eventSmallLogo,
        "eventMediumLogo": eventMediumLogo,
        "eventLargeLogo": eventLargeLogo,
        "backgroundImage": backgroundImage,
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
        "isWished": isWished,
        "email": email,
        "eventTicketsProductMasterViewModels": List<dynamic>.from(
            eventTicketsProductMasterViewModels!.map((x) => x.toJson())),
        "eventImagesViewModels":
            List<dynamic>.from(eventImagesViewModels!.map((x) => x)),
      };
}

class EventTicketsProductMasterViewModel {
  EventTicketsProductMasterViewModel({
    required this.productMasterId,
    required this.eventId,
    required this.productName,
    required this.quantity,
    required this.productPrice,
     this.item=0,
  });

  int productMasterId;
  int eventId;
  String productName;
  int quantity;
  int item;
  double productPrice;

  factory EventTicketsProductMasterViewModel.fromJson(
          Map<String, dynamic> json) =>
      EventTicketsProductMasterViewModel(
        productMasterId: json["productMasterId"] ?? 0,
        eventId: json["eventId"] ?? 0,
        productName: json["productName"] ?? 0,
        quantity: json["quantity"] ?? 0,
        productPrice: json["productPrice"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "productMasterId": productMasterId,
        "eventId": eventId,
        "productName": productName,
        "quantity": quantity,
        "productPrice": productPrice,
      };
}
