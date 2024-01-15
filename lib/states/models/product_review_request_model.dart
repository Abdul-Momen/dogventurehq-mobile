import 'dart:convert';

ProductReviewRequestModel productReviewRequestModelFromJson(String str) =>
    ProductReviewRequestModel.fromJson(json.decode(str));

String productReviewRequestModelToJson(ProductReviewRequestModel data) => json.encode(data.toJson());


class ProductReviewRequestModel {
  ProductReviewRequestModel({
      required this.productReviewsId, 
      required this.productMasterId, 
      required this.rating, 
      required this.productSubSKUId, 
      required this.customerId, 
      required this.review, 
      required this.title, 
      required this.customerName, 
      required this.ipAddress, 
      required this.status, 
      required this.createdAt, 
      required this.updatedAt,});

  factory ProductReviewRequestModel.fromJson(Map<String, dynamic> json)=>ProductReviewRequestModel(
      productReviewsId : json['productReviewsId']?? 0,
      productMasterId : json['productMasterId']?? 0,
      rating : json['rating']?? 0,
      productSubSKUId : json['productSubSKUId']?? 0,
      customerId : json['customerId']?? 0,
      review : json['review']?? '',
      title : json['title']?? '',
      customerName : json['customerName']?? '',
      ipAddress : json['ipAddress']?? '',
      status : json['status']?? '',
      createdAt : json['createdAt']?? '',
      updatedAt : json['updatedAt']?? '',
  );


  int productReviewsId;
  int productMasterId;
  double rating;
  int productSubSKUId;
  int customerId;
  String review;
  String title;
  String customerName;
  String ipAddress;
  String status;
  String createdAt;
  String updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productReviewsId'] = productReviewsId;
    map['productMasterId'] = productMasterId;
    map['rating'] = rating;
    map['productSubSKUId'] = productSubSKUId;
    map['customerId'] = customerId;
    map['review'] = review;
    map['title'] = title;
    map['customerName'] = customerName;
    map['ipAddress'] = ipAddress;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}