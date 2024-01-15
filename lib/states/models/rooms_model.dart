import 'dart:convert';

List<RoomsModel> roomsModelFromJson(String str) =>
    List<RoomsModel>.from(json.decode(str).map((x) => RoomsModel.fromJson(x)));

class RoomsModel {
  RoomsModel({
    required this.roomId,
    required this.roomName,
    required this.categoryId,
    required this.price,
    // required this.details,
    required this.status,
    required this.tabLoaction,
    required this.quantity,
    // required this.backgroundImage,
    // required this.backgroundImageHidden,
    required this.createdAt,
    required this.key,
    required this.productMasterId,
    required this.supplierId,
    required this.storeId,
    required this.roomDiscount,
  });

  int roomId;
  String roomName;
  int categoryId;
  double price;
  // dynamic details;
  String status;
  int tabLoaction;
  int quantity;
  // dynamic backgroundImage;
  // dynamic backgroundImageHidden;
  DateTime createdAt;
  String key;
  int productMasterId;
  int supplierId;
  int storeId;
  List<RoomDiscount> roomDiscount;

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
        roomId: json["roomId"],
        roomName: json["roomName"],
        categoryId: json["categoryId"],
        price: json["price"],
        // details: json["details"],
        status: json["status"],
        tabLoaction: json["tabLoaction"],
        quantity: json["quantity"],
        // backgroundImage: json["backgroundImage"],
        // backgroundImageHidden: json["backgroundImageHidden"],
        createdAt: DateTime.parse(json["createdAt"]),
        key: json["key"],
        productMasterId: json["productMasterId"],
        supplierId: json["supplierId"],
        storeId: json["storeId"],
        roomDiscount: List<RoomDiscount>.from(
            json["roomDiscount"].map((x) => RoomDiscount.fromJson(x))),
      );
}

class RoomDiscount {
  RoomDiscount({
    required this.roomDiscountId,
    required this.title,
    required this.roomId,
    required this.discountPercentage,
    // required this.status,
  });

  int roomDiscountId;
  String title;
  int roomId;
  double discountPercentage;
  // dynamic status;

  factory RoomDiscount.fromJson(Map<String, dynamic> json) => RoomDiscount(
        roomDiscountId: json["roomDiscountId"],
        title: json["title"],
        roomId: json["roomId"],
        discountPercentage: json["discountPercentage"],
        // status: json["status"],
      );
}
