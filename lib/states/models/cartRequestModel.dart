import 'dart:convert';

CartRequestModel cartRequestModelFromJson(String str) =>
    CartRequestModel.fromJson(json.decode(str));

String cartRequestModelToJson(CartRequestModel data) => json.encode(data.toJson());

class CartRequestModel {
  CartRequestModel({
      required this.cartId, 
      required this.productMasterId, 
      required this.customerId, 
      required this.tempId, 
      required this.quantity, 
      required this.unitPrice, 
      required this.status, 
      required this.productSubSKUId, 
      required this.currencyId, 
      required this.supplierId, 
      required this.storeId, 
      required this.serviceDateTime, 
      required this.serviceTimeString, 
      required this.isService, 
      required this.eventId, 
      // required this.inputFieldValueRequestModels,
  });

  int cartId;
  int productMasterId;
  int customerId;
  String tempId;
  double quantity;
  double unitPrice;
  String status;
  int productSubSKUId;
  int currencyId;
  int supplierId;
  int storeId;
  String serviceDateTime;
  String serviceTimeString;
  bool isService;
  int eventId;
  // List<InputFieldValueRequestModels> inputFieldValueRequestModels;

  factory CartRequestModel.fromJson(Map<String, dynamic> json)=> CartRequestModel(
    cartId: json['cartId'] ?? 0,
    productMasterId: json['productMasterId'] ?? 0,
    customerId: json['customerId'] ?? 0,
    tempId: json['tempId'] ?? '',
    quantity: json['quantity']??0,
    unitPrice: json['unitPrice'] ?? 0.0,
    status: json['status'] ?? '',
    productSubSKUId: json['productSubSKUId'] ?? 0,
    currencyId: json['currencyId'] ?? 0,
    supplierId: json['supplierId'] ?? 0,
    storeId: json['storeId'] ?? 0,
    serviceDateTime: json['serviceDateTime'] ?? '',
    serviceTimeString: json['serviceTimeString'] ?? '',
    isService: json['isService'] ?? false,
    eventId: json['eventId'] ?? 0,
    // if (json['inputFieldValueRequestModels'] != null) {
    //   inputFieldValueRequestModels: [];
    //   json['inputFieldValueRequestModels'].forEach((v) {
    //     inputFieldValueRequestModels.add(InputFieldValueRequestModels.fromJson(v));
    //   });
    // }
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cartId'] = cartId;
    map['productMasterId'] = productMasterId;
    map['customerId'] = customerId;
    map['tempId'] = tempId;
    map['quantity'] = quantity;
    map['unitPrice'] = unitPrice;
    map['status'] = status;
    map['productSubSKUId'] = productSubSKUId;
    map['currencyId'] = currencyId;
    map['supplierId'] = supplierId;
    map['storeId'] = storeId;
    map['serviceDateTime'] = serviceDateTime;
    map['serviceTimeString'] = serviceTimeString;
    map['isService'] = isService;
    map['eventId'] = eventId;
    // if (inputFieldValueRequestModels != null) {
    //   map['inputFieldValueRequestModels'] = inputFieldValueRequestModels.map((v) => v.toJson()).toList();
    // }
    return map;
  }

}