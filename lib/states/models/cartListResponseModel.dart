import 'dart:convert';

List<CartListResponseModel> cartListResponseModelFromJson(String str) =>
    List<CartListResponseModel>.from(json.decode(str).map((x) => CartListResponseModel.fromJson(x)));

String cartListResponseModelToJson(List<CartListResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class CartListResponseModel {
  CartListResponseModel({
      required this.cartId, 
      required this.productMasterId, 
      required this.productName, 
      required this.quantity, 
      required this.price, 
      required this.smallImage, 
      required this.symbol, 
      required this.productSubSKUId, 
      required this.supplierId, 
      required this.storeId, 
      required this.serviceDateTime, 
      required this.tempId, 
      required this.isService, 
      required this.eventId, 
      required this.membershipId, 
      required this.serviceTimeString,});

  factory CartListResponseModel.fromJson(Map<String, dynamic> json)=> CartListResponseModel(
    cartId : json['cartId'] ?? 0,
    productMasterId : json['productMasterId'] ?? 0,
    productName : json['productName'] ?? '',
    quantity : json['quantity'] ?? 0.0,
    price : json['price'] ?? 0.0,
    smallImage : json['smallImage'] ?? '',
    symbol:json['symbol']?? '',
    productSubSKUId : json['productSubSKUId'] ?? 0,
    supplierId : json['supplierId'] ?? 0,
    storeId : json['storeId'] ?? 0,
    serviceDateTime : json['serviceDateTime'] ?? '',
    tempId : json['tempId'] ?? '',
    isService : json['isService'] ?? true,
    eventId : json['eventId'] ?? 0,
    membershipId : json['membershipId'] ?? 0,
    serviceTimeString : json['serviceTimeString'] ?? '',
);
  int cartId;
  int productMasterId;
  String productName;
  double quantity;
  double price;
  String smallImage;
  String symbol;
  int productSubSKUId;
  int supplierId;
  int storeId;
  String serviceDateTime;
  String tempId;
  bool isService;
  int eventId;
  int membershipId;
  String serviceTimeString;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cartId'] = cartId;
    map['productMasterId'] = productMasterId;
    map['productName'] = productName;
    map['quantity'] = quantity;
    map['price'] = price;
    map['smallImage'] = smallImage;
    map['symbol'] = symbol;
    map['productSubSKUId'] = productSubSKUId;
    map['supplierId'] = supplierId;
    map['storeId'] = storeId;
    map['serviceDateTime'] = serviceDateTime;
    map['tempId'] = tempId;
    map['isService'] = isService;
    map['eventId'] = eventId;
    map['membershipId'] = membershipId;
    map['serviceTimeString'] = serviceTimeString;
    return map;
  }

}