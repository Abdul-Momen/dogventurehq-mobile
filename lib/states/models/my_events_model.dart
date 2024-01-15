// To parse this JSON data, do
//
//     final myEventsModel = myEventsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<MyEventsModel> myEventsModelFromJson(String str) =>
    List<MyEventsModel>.from(
        json.decode(str).map((x) => MyEventsModel.fromJson(x)));

String myEventsModelToJson(List<MyEventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyEventsModel {
  MyEventsModel({
    required this.invoiceMasterId,
    required this.customerId,
    required this.refNumber,
    required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    required this.courierCharge,
    required this.carryingCost,
    // required this.paymentMethod,
    // required this.remark,
    // required this.discountCode,
    required this.discountValue,
    required this.paymentStatus,
    required this.status,
    // required this.currency,
    required this.createdAt,
    // required this.countryId,
    // required this.stateId,
    // required this.cityId,
    // required this.eventId,
    // required this.driverId,
    required this.totalRecords,
    required this.orderFrom,
    // required this.billingAddressViewModels,
    // required this.shippingAddressViewModels,
    required this.invoiceViewModels,
    // required this.statusLogViewModels,
     required this.paymentViewModels,
    // required this.customerViewModel,
    required this.invoiceDetailsViewModels,
    // required this.countryViewModel,
    // required this.stateViewModel,
    // required this.cityViewModel,
    // required this.companyProfileViewModel,
    // required this.invoiceInputFieldValueViewModel,
    // required this.customInputDataRequestModels,
    // required this.invoicePetDetailsViewModels,
    required this.eventDetailsViewModel,
  });

  int invoiceMasterId;
  int customerId;
  String refNumber;
  String invoiceDate;
  double totalAmount;
  double receivedAmt;
  double courierCharge;
  double carryingCost;

  // dynamic paymentMethod;
  // String remark;
  // String discountCode;
  double discountValue;
  int paymentStatus;
  String status;

  // dynamic currency;
  String createdAt;

  // dynamic countryId;
  // dynamic stateId;
  // dynamic cityId;
  // dynamic eventId;
  // dynamic driverId;
  int totalRecords;
  String orderFrom;


  // IngAddressViewModels billingAddressViewModels;
  // IngAddressViewModels shippingAddressViewModels;
  List<InvoiceViewModel> invoiceViewModels;

  // List<dynamic> statusLogViewModels;
  List<PaymentViewModel> paymentViewModels;
  // CustomerViewModel customerViewModel;
  List<InvoiceDetailsViewModel> invoiceDetailsViewModels;

  // CountryViewModel countryViewModel;
  // StateViewModel stateViewModel;
  // CityViewModel cityViewModel;
  // CompanyProfileViewModel companyProfileViewModel;
  // List<dynamic> invoiceInputFieldValueViewModel;
  // List<dynamic> customInputDataRequestModels;
  // List<dynamic> invoicePetDetailsViewModels;
  EventDetailsViewModel eventDetailsViewModel;

  factory MyEventsModel.fromJson(Map<String, dynamic> json) => MyEventsModel(
        invoiceMasterId: json["invoiceMasterId"] ?? 0,
        customerId: json["customerId"] ?? 0,
        refNumber: json["refNumber"] ?? '',
        invoiceDate: json["invoiceDate"] ?? '',
        totalAmount: json["totalAmount"] ?? 0.0,
        receivedAmt: json["receivedAmt"] ?? 0,
        courierCharge: json["courierCharge"] ?? 0,
        carryingCost: json["carryingCost"] ?? 0,
        // paymentMethod: json["paymentMethod"]??0,
        // remark: json["remark"]??'',
        // discountCode: json["discountCode"]??'',
        discountValue: json["discountValue"] ?? 0,
        paymentStatus: json["paymentStatus"] ?? 0,
        status: json["status"] ?? '',
        // currency: json["currency"]??'',
        createdAt: json["createdAt"] ?? '',
        // countryId: json["countryId"]??0,
        // stateId: json["stateId"]??0,
        // cityId: json["cityId"]??0,
        // eventId: json["eventId"]??0,
        // driverId: json["driverId"]??0,
        totalRecords: json["totalRecords"] ?? 0,
        orderFrom: json["orderFrom"] ?? "",
        // billingAddressViewModels: IngAddressViewModels.fromJson(json["billingAddressViewModels"]),
        // shippingAddressViewModels: IngAddressViewModels.fromJson(json["shippingAddressViewModels"]),
        invoiceViewModels: List<InvoiceViewModel>.from(
            json["invoiceViewModels"].map((x) => InvoiceViewModel.fromJson(x))),
        // statusLogViewModels: List<dynamic>.from(json["statusLogViewModels"].map((x) => x)),
        paymentViewModels: List<PaymentViewModel>.from(json["paymentViewModels"].map((x) => PaymentViewModel.fromJson(x))),
        // customerViewModel: CustomerViewModel.fromJson(json["customerViewModel"]),
        invoiceDetailsViewModels: List<InvoiceDetailsViewModel>.from(
            json["invoiceDetailsViewModels"]
                .map((x) => InvoiceDetailsViewModel.fromJson(x))),
        // countryViewModel: CountryViewModel.fromJson(json["countryViewModel"]),
        // stateViewModel: StateViewModel.fromJson(json["stateViewModel"]),
        // cityViewModel: CityViewModel.fromJson(json["cityViewModel"]),
        // companyProfileViewModel: CompanyProfileViewModel.fromJson(json["companyProfileViewModel"]),
        // invoiceInputFieldValueViewModel: List<dynamic>.from(json["invoiceInputFieldValueViewModel"].map((x) => x)),
        // customInputDataRequestModels: List<dynamic>.from(json["customInputDataRequestModels"].map((x) => x)),
        // invoicePetDetailsViewModels: List<dynamic>.from(json["invoicePetDetailsViewModels"].map((x) => x)),
        eventDetailsViewModel:
            EventDetailsViewModel.fromJson(json["eventDetailsViewModel"]),
      );

  Map<String, dynamic> toJson() => {
        "invoiceMasterId": invoiceMasterId,
        "customerId": customerId,
        "refNumber": refNumber,
        "invoiceDate": invoiceDate,
        "totalAmount": totalAmount,
        "receivedAmt": receivedAmt,
        "courierCharge": courierCharge,
        "carryingCost": carryingCost,
        // "paymentMethod": paymentMethod,
        // "remark": remark,
        // "discountCode": discountCode,
        "discountValue": discountValue,
        "paymentStatus": paymentStatus,
        "status": status,
        // "currency": currency,
        "createdAt": createdAt,
        // "countryId": countryId,
        // "stateId": stateId,
        // "cityId": cityId,
        // "eventId": eventId,
        // "driverId": driverId,
        "totalRecords": totalRecords,
        "orderFrom": orderFrom,
        // "billingAddressViewModels": billingAddressViewModels.toJson(),
        // "shippingAddressViewModels": shippingAddressViewModels.toJson(),
        "invoiceViewModels":
            List<dynamic>.from(invoiceViewModels.map((x) => x.toJson())),
        // "statusLogViewModels": List<dynamic>.from(statusLogViewModels.map((x) => x)),
         "paymentViewModels": List<dynamic>.from(paymentViewModels.map((x) => x)),
        // "customerViewModel": customerViewModel.toJson(),
        // "invoiceDetailsViewModels": List<dynamic>.from(invoiceDetailsViewModels.map((x) => x.toJson())),
        // "countryViewModel": countryViewModel.toJson(),
        // "stateViewModel": stateViewModel.toJson(),
        // "cityViewModel": cityViewModel.toJson(),
        // "companyProfileViewModel": companyProfileViewModel.toJson(),
        // "invoiceInputFieldValueViewModel": List<dynamic>.from(invoiceInputFieldValueViewModel.map((x) => x)),
        // "customInputDataRequestModels": List<dynamic>.from(customInputDataRequestModels.map((x) => x)),
        // "invoicePetDetailsViewModels": List<dynamic>.from(invoicePetDetailsViewModels.map((x) => x)),
        "eventDetailsViewModel": eventDetailsViewModel.toJson(),
      };
}
//
// class IngAddressViewModels {
//   IngAddressViewModels({
//     required this.billingShippingAddressId,
//     required this.invoiceMasterId,
//     required this.customerId,
//     required this.customerAddressId,
//     required this.countryId,
//     required this.stateId,
//     required this.cityId,
//     required this.name,
//     required this.stateName,
//     required this.cityName,
//     required this.countryName,
//     required this.addressLine,
//     required this.addressLine2,
//     required this.zipCode,
//     required this.phoneNumber,
//     required this.landMark,
//     required this.deleveryNote,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.isDefault,
//     required this.latitued,
//     required this.longitued,
//     required this.deleveryTime,
//     required this.isBilingAddress,
//     required this.isShippingAddress,
//   });
//
//   int billingShippingAddressId;
//   dynamic invoiceMasterId;
//   dynamic customerId;
//   int customerAddressId;
//   dynamic countryId;
//   dynamic stateId;
//   dynamic cityId;
//   String name;
//   dynamic stateName;
//   String cityName;
//   dynamic countryName;
//   dynamic addressLine;
//   dynamic addressLine2;
//   dynamic zipCode;
//   dynamic phoneNumber;
//   dynamic landMark;
//   dynamic deleveryNote;
//   String status;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic isDefault;
//   dynamic latitued;
//   dynamic longitued;
//   dynamic deleveryTime;
//   dynamic isBilingAddress;
//   dynamic isShippingAddress;
//
//   factory IngAddressViewModels.fromJson(Map<String, dynamic> json) => IngAddressViewModels(
//     billingShippingAddressId: json["billingShippingAddressId"]??0,
//     invoiceMasterId: json["invoiceMasterId"]??0,
//     customerId: json["customerId"]??0,
//     customerAddressId: json["customerAddressId"]??0,
//     countryId: json["countryId"]??0,
//     stateId: json["stateId"]??0,
//     cityId: json["cityId"]??0,
//     name:  json["name"]??'',
//     stateName: json["stateName"]??'',
//     cityName:  json["cityName"]??'',
//     countryName: json["countryName"]??'',
//     addressLine: json["addressLine"],
//     addressLine2: json["addressLine2"],
//     zipCode: json["zipCode"],
//     phoneNumber: json["phoneNumber"],
//     landMark: json["landMark"],
//     deleveryNote: json["deleveryNote"],
//     status: json["status"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     isDefault: json["isDefault"],
//     latitued: json["latitued"],
//     longitued: json["longitued"],
//     deleveryTime: json["deleveryTime"],
//     isBilingAddress: json["isBilingAddress"],
//     isShippingAddress: json["isShippingAddress"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "billingShippingAddressId": billingShippingAddressId,
//     "invoiceMasterId": invoiceMasterId,
//     "customerId": customerId,
//     "customerAddressId": customerAddressId,
//     "countryId": countryId,
//     "stateId": stateId,
//     "cityId": cityId,
//     "name": name,
//     "stateName": stateName,
//     "cityName": cityName,
//     "countryName": countryName,
//     "addressLine": addressLine,
//     "addressLine2": addressLine2,
//     "zipCode": zipCode,
//     "phoneNumber": phoneNumber,
//     "landMark": landMark,
//     "deleveryNote": deleveryNote,
//     "status":  status,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "isDefault": isDefault,
//     "latitued": latitued,
//     "longitued": longitued,
//     "deleveryTime": deleveryTime,
//     "isBilingAddress": isBilingAddress,
//     "isShippingAddress": isShippingAddress,
//   };
// }
//
// class CityViewModel {
//   CityViewModel({
//     required this.cityId,
//     required this.stateId,
//     required this.cityName,
//     required this.status,
//     required this.lastModified,
//     required this.isDeleted,
//     required this.stateName,
//     required this.guidId,
//   });
//
//   int cityId;
//   int stateId;
//   dynamic cityName;
//   String status;
//   dynamic lastModified;
//   dynamic isDeleted;
//   dynamic stateName;
//   dynamic guidId;
//
//   factory CityViewModel.fromJson(Map<String, dynamic> json) => CityViewModel(
//     cityId: json["cityId"],
//     stateId: json["stateId"],
//     cityName: json["cityName"],
//     status: json["status"],
//     lastModified: json["lastModified"],
//     isDeleted: json["isDeleted"],
//     stateName: json["stateName"],
//     guidId: json["guidId"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cityId": cityId,
//     "stateId": stateId,
//     "cityName": cityName,
//     "status": status,
//     "lastModified": lastModified,
//     "isDeleted": isDeleted,
//     "stateName": stateName,
//     "guidId": guidId,
//   };
// }
//
// class CompanyProfileViewModel {
//   CompanyProfileViewModel({
//     required this.companyProfileId,
//     required this.companyName,
//     required this.vatNo,
//     required this.phone,
//     required this.email,
//     required this.address,
//     required this.logo,
//     required this.status,
//     required this.lastModified,
//     required this.isDeleted,
//   });
//
//   int companyProfileId;
//   dynamic companyName;
//   dynamic vatNo;
//   dynamic phone;
//   dynamic email;
//   dynamic address;
//   dynamic logo;
//   String status;
//   dynamic lastModified;
//   dynamic isDeleted;
//
//   factory CompanyProfileViewModel.fromJson(Map<String, dynamic> json) => CompanyProfileViewModel(
//     companyProfileId: json["companyProfileId"],
//     companyName: json["companyName"],
//     vatNo: json["vatNo"],
//     phone: json["phone"],
//     email: json["email"],
//     address: json["address"],
//     logo: json["logo"],
//     status:  json["status"],
//     lastModified: json["lastModified"],
//     isDeleted: json["isDeleted"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "companyProfileId": companyProfileId,
//     "companyName": companyName,
//     "vatNo": vatNo,
//     "phone": phone,
//     "email": email,
//     "address": address,
//     "logo": logo,
//     "status": status,
//     "lastModified": lastModified,
//     "isDeleted": isDeleted,
//   };
// }
//
// class CountryViewModel {
//   CountryViewModel({
//     required this.countryId,
//     required this.iso,
//     required this.countryName,
//     required this.longCountryName,
//     required this.iso3,
//     required this.countryCode,
//     required this.unMemberState,
//     required this.callingCode,
//     required this.ccTld,
//     required this.status,
//     required this.lastModified,
//     required this.isDeleted,
//     required this.guidId,
//     required this.manualStoreId,
//     required this.image,
//     required this.countryWiseStoreViewModels,
//   });
//
//   int countryId;
//   dynamic iso;
//   dynamic countryName;
//   dynamic longCountryName;
//   dynamic iso3;
//   dynamic countryCode;
//   dynamic unMemberState;
//   dynamic callingCode;
//   dynamic ccTld;
//   String status;
//   dynamic lastModified;
//   dynamic isDeleted;
//   dynamic guidId;
//   dynamic manualStoreId;
//   dynamic image;
//   List<dynamic> countryWiseStoreViewModels;
//
//   factory CountryViewModel.fromJson(Map<String, dynamic> json) => CountryViewModel(
//     countryId: json["countryId"],
//     iso: json["iso"],
//     countryName: json["countryName"],
//     longCountryName: json["longCountryName"],
//     iso3: json["iso3"],
//     countryCode: json["countryCode"],
//     unMemberState: json["unMemberState"],
//     callingCode: json["callingCode"],
//     ccTld: json["ccTld"],
//     status:  json["status"],
//     lastModified: json["lastModified"],
//     isDeleted: json["isDeleted"],
//     guidId: json["guidId"],
//     manualStoreId: json["manualStoreId"],
//     image: json["image"],
//     countryWiseStoreViewModels: List<dynamic>.from(json["countryWiseStoreViewModels"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "countryId": countryId,
//     "iso": iso,
//     "countryName": countryName,
//     "longCountryName": longCountryName,
//     "iso3": iso3,
//     "countryCode": countryCode,
//     "unMemberState": unMemberState,
//     "callingCode": callingCode,
//     "ccTld": ccTld,
//     "status": status,
//     "lastModified": lastModified,
//     "isDeleted": isDeleted,
//     "guidId": guidId,
//     "manualStoreId": manualStoreId,
//     "image": image,
//     "countryWiseStoreViewModels": List<dynamic>.from(countryWiseStoreViewModels.map((x) => x)),
//   };
// }
//
// class CustomerViewModel {
//   CustomerViewModel({
//     required this.customerId,
//     required this.userName,
//     required this.firstName,
//     required this.middleName,
//     required this.lastName,
//     required this.email,
//     required this.email2,
//     required this.phoneNo,
//     required this.phoneNo2,
//     required this.phoneNo3,
//     required this.gender,
//     required this.dateOfBirth,
//     required this.points,
//     required this.pointInValue,
//     required this.ratings,
//     required this.totalOrders,
//     required this.isBlacklisted,
//     required this.isCorporate,
//     required this.isNewsletterSub,
//     required this.isReviewEnable,
//     required this.isUpdatePassword,
//     required this.isUpdateAddress,
//     required this.age,
//     required this.kids,
//     required this.pet,
//     required this.password,
//     required this.accountType,
//     required this.customerTypeId,
//     required this.token,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.isDeleted,
//     required this.customerGroupId,
//     required this.taxorVatNumber,
//     required this.totalOrder,
//     required this.walletBalance,
//     required this.totalRecords,
//     required this.image,
//     required this.otp,
//     required this.otpDateTime,
//     required this.thirdPartyKey,
//     required this.latitued,
//     required this.longitued,
//     required this.sessionId,
//     required this.petProfileImage,
//     required this.firebaseToken,
//     required this.distance,
//     required this.distanceTime,
//     required this.aboutCustomer,
//     required this.customerGroupViewModel,
//     required this.customerAddressViewModels,
//     required this.customerAddressViewModel,
//     required this.walletTransactionViewModels,
//     required this.invoiceMasterViewModel,
//     required this.invoiceMasterViewModels,
//     required this.cartResponseModels,
//     required this.customerProfileViewModels,
//     required this.profileIds,
//     required this.registeredFrom,
//     required this.firstLastName,
//   });
//
//   int customerId;
//   dynamic userName;
//   String firstName;
//   String middleName;
//   String lastName;
//   String email;
//   dynamic email2;
//   dynamic phoneNo;
//   dynamic phoneNo2;
//   dynamic phoneNo3;
//   int gender;
//   dynamic dateOfBirth;
//   dynamic points;
//   dynamic pointInValue;
//   dynamic ratings;
//   dynamic totalOrders;
//   dynamic isBlacklisted;
//   dynamic isCorporate;
//   dynamic isNewsletterSub;
//   dynamic isReviewEnable;
//   dynamic isUpdatePassword;
//   dynamic isUpdateAddress;
//   dynamic age;
//   dynamic kids;
//   dynamic pet;
//   String password;
//   dynamic accountType;
//   dynamic customerTypeId;
//   dynamic token;
//   dynamic status;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic isDeleted;
//   int customerGroupId;
//   dynamic taxorVatNumber;
//   int totalOrder;
//   dynamic walletBalance;
//   int totalRecords;
//   dynamic image;
//   int otp;
//   dynamic otpDateTime;
//   dynamic thirdPartyKey;
//   dynamic latitued;
//   dynamic longitued;
//   dynamic sessionId;
//   dynamic petProfileImage;
//   dynamic firebaseToken;
//   dynamic distance;
//   dynamic distanceTime;
//   dynamic aboutCustomer;
//   CustomerGroupViewModel customerGroupViewModel;
//   List<dynamic> customerAddressViewModels;
//   CustomerAddressViewModel customerAddressViewModel;
//   List<dynamic> walletTransactionViewModels;
//   dynamic invoiceMasterViewModel;
//   List<dynamic> invoiceMasterViewModels;
//   dynamic cartResponseModels;
//   List<dynamic> customerProfileViewModels;
//   dynamic profileIds;
//   dynamic registeredFrom;
//   String firstLastName;
//
//   factory CustomerViewModel.fromJson(Map<String, dynamic> json) => CustomerViewModel(
//     customerId: json["customerId"],
//     userName: json["userName"],
//     firstName: json["firstName"],
//     middleName:json["middleName"],
//     lastName: json["lastName"],
//     email: json["email"],
//     email2: json["email2"],
//     phoneNo: json["phoneNo"],
//     phoneNo2: json["phoneNo2"],
//     phoneNo3: json["phoneNo3"],
//     gender: json["gender"],
//     dateOfBirth: json["dateOfBirth"],
//     points: json["points"],
//     pointInValue: json["pointInValue"],
//     ratings: json["ratings"],
//     totalOrders: json["totalOrders"],
//     isBlacklisted: json["isBlacklisted"],
//     isCorporate: json["isCorporate"],
//     isNewsletterSub: json["isNewsletterSub"],
//     isReviewEnable: json["isReviewEnable"],
//     isUpdatePassword: json["isUpdatePassword"],
//     isUpdateAddress: json["isUpdateAddress"],
//     age: json["age"],
//     kids: json["kids"],
//     pet: json["pet"],
//     password: json["password"],
//     accountType: json["accountType"],
//     customerTypeId: json["customerTypeId"],
//     token: json["token"],
//     status: json["status"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     isDeleted: json["isDeleted"],
//     customerGroupId: json["customerGroupId"],
//     taxorVatNumber: json["taxorVatNumber"],
//     totalOrder: json["totalOrder"],
//     walletBalance: json["walletBalance"],
//     totalRecords: json["totalRecords"],
//     image: json["image"],
//     otp: json["otp"],
//     otpDateTime: json["otpDateTime"],
//     thirdPartyKey: json["thirdPartyKey"],
//     latitued: json["latitued"],
//     longitued: json["longitued"],
//     sessionId: json["sessionId"],
//     petProfileImage: json["petProfileImage"],
//     firebaseToken: json["firebaseToken"],
//     distance: json["distance"],
//     distanceTime: json["distanceTime"],
//     aboutCustomer: json["aboutCustomer"],
//     customerGroupViewModel: CustomerGroupViewModel.fromJson(json["customerGroupViewModel"]),
//     customerAddressViewModels: List<dynamic>.from(json["customerAddressViewModels"].map((x) => x)),
//     customerAddressViewModel: CustomerAddressViewModel.fromJson(json["customerAddressViewModel"]),
//     walletTransactionViewModels: List<dynamic>.from(json["walletTransactionViewModels"].map((x) => x)),
//     invoiceMasterViewModel: json["invoiceMasterViewModel"],
//     invoiceMasterViewModels: List<dynamic>.from(json["invoiceMasterViewModels"].map((x) => x)),
//     cartResponseModels: json["cartResponseModels"],
//     customerProfileViewModels: List<dynamic>.from(json["customerProfileViewModels"].map((x) => x)),
//     profileIds: json["profileIds"],
//     registeredFrom: json["registeredFrom"],
//     firstLastName: json["firstLastName"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "customerId": customerId,
//     "userName": userName,
//     "firstName": firstName,
//     "middleName": middleName,
//     "lastName": lastName,
//     "email":email,
//     "email2": email2,
//     "phoneNo": phoneNo,
//     "phoneNo2": phoneNo2,
//     "phoneNo3": phoneNo3,
//     "gender": gender,
//     "dateOfBirth": dateOfBirth,
//     "points": points,
//     "pointInValue": pointInValue,
//     "ratings": ratings,
//     "totalOrders": totalOrders,
//     "isBlacklisted": isBlacklisted,
//     "isCorporate": isCorporate,
//     "isNewsletterSub": isNewsletterSub,
//     "isReviewEnable": isReviewEnable,
//     "isUpdatePassword": isUpdatePassword,
//     "isUpdateAddress": isUpdateAddress,
//     "age": age,
//     "kids": kids,
//     "pet": pet,
//     "password": password,
//     "accountType": accountType,
//     "customerTypeId": customerTypeId,
//     "token": token,
//     "status": status,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "isDeleted": isDeleted,
//     "customerGroupId": customerGroupId,
//     "taxorVatNumber": taxorVatNumber,
//     "totalOrder": totalOrder,
//     "walletBalance": walletBalance,
//     "totalRecords": totalRecords,
//     "image": image,
//     "otp": otp,
//     "otpDateTime": otpDateTime,
//     "thirdPartyKey": thirdPartyKey,
//     "latitued": latitued,
//     "longitued": longitued,
//     "sessionId": sessionId,
//     "petProfileImage": petProfileImage,
//     "firebaseToken": firebaseToken,
//     "distance": distance,
//     "distanceTime": distanceTime,
//     "aboutCustomer": aboutCustomer,
//     "customerGroupViewModel": customerGroupViewModel.toJson(),
//     "customerAddressViewModels": List<dynamic>.from(customerAddressViewModels.map((x) => x)),
//     "customerAddressViewModel": customerAddressViewModel.toJson(),
//     "walletTransactionViewModels": List<dynamic>.from(walletTransactionViewModels.map((x) => x)),
//     "invoiceMasterViewModel": invoiceMasterViewModel,
//     "invoiceMasterViewModels": List<dynamic>.from(invoiceMasterViewModels.map((x) => x)),
//     "cartResponseModels": cartResponseModels,
//     "customerProfileViewModels": List<dynamic>.from(customerProfileViewModels.map((x) => x)),
//     "profileIds": profileIds,
//     "registeredFrom": registeredFrom,
//     "firstLastName": firstLastName,
//   };
// }
//
// class CustomerAddressViewModel {
//   CustomerAddressViewModel({
//     required this.customerAddressId,
//     required this.customerId,
//     required this.addressType,
//     required this.countryId,
//     required this.stateId,
//     required this.cityId,
//     required this.address,
//     required this.buildingName,
//     required this.flatNo,
//     required this.latitude,
//     required this.longitude,
//     required this.nearByLocation,
//     required this.isDefault,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.countryName,
//     required this.stateName,
//     required this.cityName,
//     required this.addressLine2,
//     required this.zipCode,
//     required this.phoneNumber,
//     required this.customerViewModel,
//   });
//
//   int customerAddressId;
//   int customerId;
//   dynamic addressType;
//   int countryId;
//   int stateId;
//   int cityId;
//   dynamic address;
//   dynamic buildingName;
//   dynamic flatNo;
//   dynamic latitude;
//   dynamic longitude;
//   dynamic nearByLocation;
//   dynamic isDefault;
//   dynamic status;
//   String createdAt;
//   dynamic updatedAt;
//   dynamic countryName;
//   dynamic stateName;
//   dynamic cityName;
//   dynamic addressLine2;
//   dynamic zipCode;
//   dynamic phoneNumber;
//   dynamic customerViewModel;
//
//   factory CustomerAddressViewModel.fromJson(Map<String, dynamic> json) => CustomerAddressViewModel(
//     customerAddressId: json["customerAddressId"],
//     customerId: json["customerId"],
//     addressType: json["addressType"],
//     countryId: json["countryId"],
//     stateId: json["stateId"],
//     cityId: json["cityId"],
//     address: json["address"],
//     buildingName: json["buildingName"],
//     flatNo: json["flatNo"],
//     latitude: json["latitude"],
//     longitude: json["longitude"],
//     nearByLocation: json["nearByLocation"],
//     isDefault: json["isDefault"],
//     status: json["status"],
//     createdAt:json["createdAt"],
//     updatedAt: json["updatedAt"],
//     countryName: json["countryName"],
//     stateName: json["stateName"],
//     cityName: json["cityName"],
//     addressLine2: json["addressLine2"],
//     zipCode: json["zipCode"],
//     phoneNumber: json["phoneNumber"],
//     customerViewModel: json["customerViewModel"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "customerAddressId": customerAddressId,
//     "customerId": customerId,
//     "addressType": addressType,
//     "countryId": countryId,
//     "stateId": stateId,
//     "cityId": cityId,
//     "address": address,
//     "buildingName": buildingName,
//     "flatNo": flatNo,
//     "latitude": latitude,
//     "longitude": longitude,
//     "nearByLocation": nearByLocation,
//     "isDefault": isDefault,
//     "status": status,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "countryName": countryName,
//     "stateName": stateName,
//     "cityName": cityName,
//     "addressLine2": addressLine2,
//     "zipCode": zipCode,
//     "phoneNumber": phoneNumber,
//     "customerViewModel": customerViewModel,
//   };
// }
//
// class CustomerGroupViewModel {
//   CustomerGroupViewModel({
//     required this.customerGroupId,
//     required this.groupName,
//     required this.taxClass,
//     required this.isDeleted,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int customerGroupId;
//   String groupName;
//   dynamic taxClass;
//   dynamic isDeleted;
//   String createdAt;
//   dynamic updatedAt;
//
//   factory CustomerGroupViewModel.fromJson(Map<String, dynamic> json) => CustomerGroupViewModel(
//     customerGroupId: json["customerGroupId"],
//     groupName: json["groupName"],
//     taxClass: json["taxClass"],
//     isDeleted: json["isDeleted"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "customerGroupId": customerGroupId,
//     "groupName": groupName,
//     "taxClass": taxClass,
//     "isDeleted": isDeleted,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//   };
// }

class PaymentViewModel {
  PaymentViewModel({
    required this.paymentId,
    required this.invoiceMasterId,
    required this.currencyId,
    required this.amount,
    required this.courierCharge,
    required this.discountAmount,
    required this.carryingCost,
    required this.paymentMethod,
    required this.courierAgencyId,
    required this.payDate,
    required this.note,
    required this.transactionNo,
    required this.status,
    required this.createdAt,
    required this.couponId,
    required this.currencyName,
    required this.symbol,
    required this.methodName,
    required this.statusName,
    required this.currencyViewModel,
  });

  int paymentId;
  int invoiceMasterId;
  int currencyId;
  double amount;
  double courierCharge;
  double discountAmount;
  double carryingCost;
  int paymentMethod;
  dynamic courierAgencyId;
  String payDate;
  String note;
  String transactionNo;
  String status;
  String createdAt;
  int couponId;
  dynamic currencyName;
  dynamic symbol;
  String methodName;
  String statusName;
  CurrencyViewModel currencyViewModel;

  factory PaymentViewModel.fromJson(Map<String, dynamic> json) => PaymentViewModel(
    paymentId: json["paymentId"]??0,
    invoiceMasterId: json["invoiceMasterId"]??0,
    currencyId: json["currencyId"]??0,
    amount: json["amount"]??0,
    courierCharge: json["courierCharge"]??0,
    discountAmount: json["discountAmount"]??0,
    carryingCost: json["carryingCost"]??0,
    paymentMethod: json["paymentMethod"]??0,
    courierAgencyId: json["courierAgencyId"]??0,
    payDate: json["payDate"]??"",
    note: json["note"]??'',
    transactionNo: json["transactionNo"]??'',
    status: json["status"]??'',
    createdAt: json["createdAt"]??'',
    couponId: json["couponId"]??0,
    currencyName: json["currencyName"]??'',
    symbol: json["symbol"]??'',
    methodName: json["methodName"]??'',
    statusName: json["statusName"]??'',
    currencyViewModel: CurrencyViewModel.fromJson(json["currencyViewModel"]),
  );

  Map<String, dynamic> toJson() => {
    "paymentId": paymentId,
    "invoiceMasterId": invoiceMasterId,
    "currencyId": currencyId,
    "amount": amount,
    "courierCharge": courierCharge,
    "discountAmount": discountAmount,
    "carryingCost": carryingCost,
    "paymentMethod": paymentMethod,
    "courierAgencyId": courierAgencyId,
    "payDate": payDate,
    "note": note,
    "transactionNo": transactionNo,
    "status": status,
    "createdAt": createdAt,
    "couponId": couponId,
    "currencyName": currencyName,
    "symbol": symbol,
    "methodName": methodName,
    "statusName": statusName,
    "currencyViewModel": currencyViewModel.toJson(),
  };
}

class CurrencyViewModel {
  CurrencyViewModel({
    required this.currencyId,
    required this.name,
    required this.code,
    required this.symbol,
    required this.isDelete,
    required this.isBaseCurrency,
    required this.convertionRate,
    required this.convertionPrice,
    required this.createDate,
  });

  int currencyId;
  dynamic name;
  String code;
  String symbol;
  dynamic isDelete;
  dynamic isBaseCurrency;
  int convertionRate;
  dynamic convertionPrice;
  dynamic createDate;

  factory CurrencyViewModel.fromJson(Map<String, dynamic> json) => CurrencyViewModel(
    currencyId: json["currencyId"],
    name: json["name"],
    code: json["code"],
    symbol: json["symbol"],
    isDelete: json["isDelete"],
    isBaseCurrency: json["isBaseCurrency"],
    convertionRate: json["convertionRate"],
    convertionPrice: json["convertionPrice"],
    createDate: json["createDate"],
  );

  Map<String, dynamic> toJson() => {
    "currencyId": currencyId,
    "name": name,
    "code": code,
    "symbol": symbol,
    "isDelete": isDelete,
    "isBaseCurrency": isBaseCurrency,
    "convertionRate": convertionRate,
    "convertionPrice": convertionPrice,
    "createDate": createDate,
  };
}
class EventDetailsViewModel {
  EventDetailsViewModel({
    required this.eventId,
    required this.title,
    // required this.eventOrganizer,
    // required this.phone,
    // required this.email,
    required this.guidId,
    // required this.note,
    // required this.description,
    // required this.itineraryDetails,
    // required this.eventType,
    // required this.eventUrl,
    // required this.tabLoaction,
    required this.eventSmallLogo,
    // required this.eventMediumLogo,
    // required this.eventLargeLogo,
    // required this.backgroundImage,
    // required this.eventSmallImage,
    // required this.eventMediumImage,
    // required this.eventLargeImage,
    // required this.status,
    // required this.createdBy,
    // required this.createdAt,
    // required this.updatedBy,
    // required this.updatedAt,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    // required this.latitude,
    // required this.longitude,
    // required this.address,
    // required this.eventLanguageId,
    // required this.languageId,
    // required this.totalTickets,
    // required this.totalSold,
    // required this.totalSoldAmount,
    // required this.supplierId,
    // required this.eventImagesId,
    // required this.isImageSave,
    // required this.eventTicketsProductMasterViewModels,
    // required this.eventImagesViewModels,
    // required this.eventDetailsLanguageViewModels,
    // required this.invoice,
  });

  int eventId;
  String title;

  // dynamic eventOrganizer;
  // dynamic phone;
  // dynamic email;
  String guidId;

  // dynamic note;
  // dynamic description;
  // dynamic itineraryDetails;
  // dynamic eventType;
  // dynamic eventUrl;
  // int tabLoaction;
  String eventSmallLogo;

  // dynamic eventMediumLogo;
  // dynamic eventLargeLogo;
  // dynamic backgroundImage;
  // dynamic eventSmallImage;
  // dynamic eventMediumImage;
  // dynamic eventLargeImage;
  // dynamic status;
  // dynamic createdBy;
  // dynamic createdAt;
  // dynamic updatedBy;
  // dynamic updatedAt;
  String startDate;
  String endDate;
  String startTime;
  String endTime;

  // dynamic latitude;
  // dynamic longitude;
  // dynamic address;
  // int eventLanguageId;
  // dynamic languageId;
  // int totalTickets;
  // int totalSold;
  // dynamic totalSoldAmount;
  // dynamic supplierId;
  // dynamic eventImagesId;
  // dynamic isImageSave;
  // List<dynamic> eventTicketsProductMasterViewModels;
  // List<dynamic> eventImagesViewModels;
  // List<dynamic> eventDetailsLanguageViewModels;
  // dynamic invoice;

  factory EventDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      EventDetailsViewModel(
        eventId: json["eventId"] ?? 0,
        title: json["title"] ?? '',
        // eventOrganizer: json["eventOrganizer"],
        // phone: json["phone"],
        // email: json["email"],
        guidId: json["guidId"] ?? '',
        // note: json["note"],
        // description: json["description"],
        // itineraryDetails: json["itineraryDetails"],
        // eventType: json["eventType"],
        // eventUrl: json["eventUrl"],
        // tabLoaction: json["tabLoaction"],
        eventSmallLogo: json["eventSmallLogo"] ?? '',
        // eventMediumLogo: json["eventMediumLogo"],
        // eventLargeLogo: json["eventLargeLogo"],
        // backgroundImage: json["backgroundImage"],
        // eventSmallImage: json["eventSmallImage"],
        // eventMediumImage: json["eventMediumImage"],
        // eventLargeImage: json["eventLargeImage"],
        // status: json["status"],
        // createdBy: json["createdBy"],
        // createdAt: json["createdAt"],
        // updatedBy: json["updatedBy"],
        // updatedAt: json["updatedAt"],
        startDate: json["startDate"] ?? '',
        endDate: json["endDate"] ?? '',
        startTime: json["startTime"] ?? '',
        endTime: json["endTime"] ?? '',
        // latitude: json["latitude"],
        // longitude: json["longitude"],
        // address: json["address"],
        // eventLanguageId: json["eventLanguageId"],
        // languageId: json["languageId"],
        // totalTickets: json["totalTickets"],
        // totalSold: json["totalSold"],
        // totalSoldAmount: json["totalSoldAmount"],
        // supplierId: json["supplierId"],
        // eventImagesId: json["eventImagesId"],
        // isImageSave: json["isImageSave"],
        // eventTicketsProductMasterViewModels: List<dynamic>.from(json["eventTicketsProductMasterViewModels"].map((x) => x)),
        // eventImagesViewModels: List<dynamic>.from(json["eventImagesViewModels"].map((x) => x)),
        // eventDetailsLanguageViewModels: List<dynamic>.from(json["eventDetailsLanguageViewModels"].map((x) => x)),
        // invoice: json["invoice"],
      );

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "title": title,
        // "eventOrganizer": eventOrganizer,
        // "phone": phone,
        // "email": email,
        "guidId": guidId,
        // "note": note,
        // "description": description,
        // "itineraryDetails": itineraryDetails,
        // "eventType": eventType,
        // "eventUrl": eventUrl,
        // "tabLoaction": tabLoaction,
        "eventSmallLogo": eventSmallLogo,
        // "eventMediumLogo": eventMediumLogo,
        // "eventLargeLogo": eventLargeLogo,
        // "backgroundImage": backgroundImage,
        // "eventSmallImage": eventSmallImage,
        // "eventMediumImage": eventMediumImage,
        // "eventLargeImage": eventLargeImage,
        // "status": status,
        // "createdBy": createdBy,
        // "createdAt": createdAt,
        // "updatedBy": updatedBy,
        // "updatedAt": updatedAt,
        "startDate": startDate,
        "endDate": endDate,
        "startTime": startTime,
        "endTime": endTime,
        // "latitude": latitude,
        // "longitude": longitude,
        // "address": address,
        // "eventLanguageId": eventLanguageId,
        // "languageId": languageId,
        // "totalTickets": totalTickets,
        // "totalSold": totalSold,
        // "totalSoldAmount": totalSoldAmount,
        // "supplierId": supplierId,
        // "eventImagesId": eventImagesId,
        // "isImageSave": isImageSave,
        // "eventTicketsProductMasterViewModels": List<dynamic>.from(eventTicketsProductMasterViewModels.map((x) => x)),
        // "eventImagesViewModels": List<dynamic>.from(eventImagesViewModels.map((x) => x)),
        // "eventDetailsLanguageViewModels": List<dynamic>.from(eventDetailsLanguageViewModels.map((x) => x)),
        // "invoice": invoice,
      };
}

class InvoiceDetailsViewModel {
  InvoiceDetailsViewModel({
    // required this.invoiceDetailsId,
    required this.invoiceId,
    // required this.productMasterId,
    // required this.quantity,
    required this.price,
    // required this.status,
    // required this.createdAt,
    // required this.productTypeId,
    // required this.storeId,
    // required this.supplierId,
    // required this.supplierName,
    // required this.supplierMobile,
    required this.productName,
    // required this.invoiceMasterId,
    // required this.productSkuId,
    // required this.subSku,
    // required this.largeImage,
     required this.mediumImage,
    // required this.smallImage,
    // required this.fileLocation,
    // required this.digitalProductGuid,
    // required this.digitalProductUrl,
    // required this.serviceDate,
    // required this.qrCodeNo,
    // required this.pdfUrl,
    // required this.qrCodeImage,
    // required this.brandName,
    // required this.productSubSkuViewModels,
  });

  // int invoiceDetailsId;
  int invoiceId;

  // int productMasterId;
  // int quantity;
  double? price;

  // String status;
  // String createdAt;
  // int productTypeId;
  // dynamic storeId;
  // dynamic supplierId;
  // dynamic supplierName;
  // dynamic supplierMobile;
  String? productName;

  // dynamic invoiceMasterId;
  // int productSkuId;
  // String subSku;
  // String largeImage;
   String mediumImage;
  // dynamic smallImage;
  // dynamic fileLocation;
  // dynamic digitalProductGuid;
  // dynamic digitalProductUrl;
  // dynamic serviceDate;
  // dynamic qrCodeNo;
  // dynamic pdfUrl;
  // dynamic qrCodeImage;
  // dynamic brandName;
  // List<dynamic> productSubSkuViewModels;

  factory InvoiceDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsViewModel(
        // invoiceDetailsId: json["invoiceDetailsId"],
        invoiceId: json["invoiceId"] ?? 0,
        // productMasterId: json["productMasterId"],
        // quantity: json["quantity"],
        price: json["price"] ?? 0.0,
        // status: json["status"],
        // createdAt: json["createdAt"],
        // productTypeId: json["productTypeId"],
        // storeId: json["storeId"],
        // supplierId: json["supplierId"],
        // supplierName: json["supplierName"],
        // supplierMobile: json["supplierMobile"],
        productName: json["productName"] ?? 0,
        // invoiceMasterId: json["invoiceMasterId"],
        // productSkuId: json["productSkuId"],
        // subSku: json["subSku"],
        // largeImage: json["largeImage"],
         mediumImage: json["mediumImage"]??'',
        // smallImage: json["smallImage"],
        // fileLocation: json["fileLocation"],
        // digitalProductGuid: json["digitalProductGuid"],
        // digitalProductUrl: json["digitalProductUrl"],
        // serviceDate: json["serviceDate"],
        // qrCodeNo: json["qrCodeNo"],
        // pdfUrl: json["pdfUrl"],
        // qrCodeImage: json["qrCodeImage"],
        // brandName: json["brandName"],
        // productSubSkuViewModels: List<dynamic>.from(json["productSubSKUViewModels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        // "invoiceDetailsId": invoiceDetailsId,
        "invoiceId": invoiceId,
        // "productMasterId": productMasterId,
        // "quantity": quantity,
        "price": price,
        // "status": status,
        // "createdAt": createdAt,
        // "productTypeId": productTypeId,
        // "storeId": storeId,
        // "supplierId": supplierId,
        // "supplierName": supplierName,
        // "supplierMobile": supplierMobile,
        "productName": productName,
        // "invoiceMasterId": invoiceMasterId,
        // "productSkuId": productSkuId,
        // "subSku": subSku,
        // "largeImage": largeImage,
         "mediumImage": mediumImage,
        // "smallImage": smallImage,
        // "fileLocation": fileLocation,
        // "digitalProductGuid": digitalProductGuid,
        // "digitalProductUrl": digitalProductUrl,
        // "serviceDate": serviceDate,
        // "qrCodeNo": qrCodeNo,
        // "pdfUrl": pdfUrl,
        // "qrCodeImage": qrCodeImage,
        // "brandName": brandName,
        // "productSubSKUViewModels": List<dynamic>.from(productSubSkuViewModels.map((x) => x)),
      };
}

class InvoiceViewModel {
  InvoiceViewModel({
    required this.invoiceId,
    // required this.invoiceMasterId,
    // required this.refNumber,
    // required this.invoiceDate,
    // required this.totalAmount,
    // required this.receivedAmt,
    // required this.carryingCost,
    // required this.courierCharge,
    // required this.paymentMethod,
    // required this.paymentStatus,
    // required this.supplierId,
    // required this.remark,
    // required this.discountCode,
    // required this.driverDistance,
    // required this.discountValue,
    // required this.storeId,
    required this.status,
    // required this.createdAt,
    // required this.invoiceStatusId,
    // required this.amountToSupplier,
    // required this.amountToAdmin,
    // required this.supplierCommissionId,
    // required this.methodName,
    // required this.isService,
    // required this.isReturn,
    // required this.serviceDate,
    // required this.serviceTimeString,
    // required this.totalProduct,
    // required this.supplierName,
    // required this.supplierMobile,
    // required this.supplierEmail,
    // required this.payment,
    // required this.ticketOwnerName,
    // required this.ticketOwnerEmail,
    // required this.ticketOwnerPhone,
    // required this.ticketBuyForCustomerId,
    required this.storeViewModel,
    // required this.invoiceStatusViewModel,
  });

  int invoiceId;

  // int invoiceMasterId;
  // String refNumber;
  // DateTime invoiceDate;
  // int totalAmount;
  // int receivedAmt;
  // int carryingCost;
  // int courierCharge;
  // int paymentMethod;
  // int paymentStatus;
  // dynamic supplierId;
  // String remark;
  // String discountCode;
  // String driverDistance;
  // int discountValue;
  // int storeId;
  String status;

  // dynamic createdAt;
  // int invoiceStatusId;
  // double amountToSupplier;
  // double amountToAdmin;
  // int supplierCommissionId;
  // dynamic methodName;
  // bool isService;
  // dynamic isReturn;
  // dynamic serviceDate;
  // dynamic serviceTimeString;
  // int totalProduct;
  // dynamic supplierName;
  // dynamic supplierMobile;
  // dynamic supplierEmail;
  // dynamic payment;
  // String ticketOwnerName;
  // String ticketOwnerEmail;
  // String ticketOwnerPhone;
  // int ticketBuyForCustomerId;
  StoreViewModel storeViewModel;

  // InvoiceStatusViewModel invoiceStatusViewModel;

  factory InvoiceViewModel.fromJson(Map<String, dynamic> json) =>
      InvoiceViewModel(
        invoiceId: json["invoiceId"] ?? 0,
        // invoiceMasterId: json["invoiceMasterId"],
        // refNumber: json["refNumber"],
        // invoiceDate:json["invoiceDate"],
        // totalAmount: json["totalAmount"],
        // receivedAmt: json["receivedAmt"],
        // carryingCost: json["carryingCost"],
        // courierCharge: json["courierCharge"],
        // paymentMethod: json["paymentMethod"],
        // paymentStatus: json["paymentStatus"],
        // supplierId: json["supplierId"],
        // remark: json["remark"],
        // discountCode: json["discountCode"],
        // driverDistance: json["driverDistance"],
        // discountValue: json["discountValue"],
        // storeId: json["storeId"],
        status: json["status"] ?? '',
        // createdAt: json["createdAt"],
        // invoiceStatusId: json["invoiceStatusId"],
        // amountToSupplier: json["amountToSupplier"].toDouble(),
        // amountToAdmin: json["amountToAdmin"].toDouble(),
        // supplierCommissionId: json["supplierCommissionId"],
        // methodName: json["methodName"],
        // isService: json["isService"],
        // isReturn: json["isReturn"],
        // serviceDate: json["serviceDate"],
        // serviceTimeString: json["serviceTimeString"],
        // totalProduct: json["totalProduct"],
        // supplierName: json["supplierName"],
        // supplierMobile: json["supplierMobile"],
        // supplierEmail: json["supplierEmail"],
        // payment: json["payment"],
        // ticketOwnerName: json["ticketOwnerName"],
        // ticketOwnerEmail:json["ticketOwnerEmail"],
        // ticketOwnerPhone: json["ticketOwnerPhone"],
        // ticketBuyForCustomerId: json["ticketBuyForCustomerId"],
        storeViewModel: StoreViewModel.fromJson(json["storeViewModel"]),
        // invoiceStatusViewModel: InvoiceStatusViewModel.fromJson(json["invoiceStatusViewModel"]),
      );

  Map<String, dynamic> toJson() => {
        "invoiceId": invoiceId,
        // "invoiceMasterId": invoiceMasterId,
        // "refNumber": refNumber,
        // "invoiceDate": invoiceDate,
        // "totalAmount": totalAmount,
        // "receivedAmt": receivedAmt,
        // "carryingCost": carryingCost,
        // "courierCharge": courierCharge,
        // "paymentMethod": paymentMethod,
        // "paymentStatus": paymentStatus,
        // "supplierId": supplierId,
        // "remark": remark,
        // "discountCode": discountCode,
        // "driverDistance": driverDistance,
        // "discountValue": discountValue,
        // "storeId": storeId,
        "status": status,
        // "createdAt": createdAt,
        // "invoiceStatusId": invoiceStatusId,
        // "amountToSupplier": amountToSupplier,
        // "amountToAdmin": amountToAdmin,
        // "supplierCommissionId": supplierCommissionId,
        // "methodName": methodName,
        // "isService": isService,
        // "isReturn": isReturn,
        // "serviceDate": serviceDate,
        // "serviceTimeString": serviceTimeString,
        // "totalProduct": totalProduct,
        // "supplierName": supplierName,
        // "supplierMobile": supplierMobile,
        // "supplierEmail": supplierEmail,
        // "payment": payment,
        // "ticketOwnerName": ticketOwnerName,
        // "ticketOwnerEmail":ticketOwnerEmail,
        // "ticketOwnerPhone": ticketOwnerPhone,
        // "ticketBuyForCustomerId": ticketBuyForCustomerId,
        "storeViewModel": storeViewModel.toJson(),
        // "invoiceStatusViewModel": invoiceStatusViewModel.toJson(),
      };
}

//
// class InvoiceStatusViewModel {
//   InvoiceStatusViewModel({
//     required this.invoiceStatusId,
//     required this.name,
//     required this.active,
//     required this.createDate,
//     required this.isPublic,
//     required this.isInternal,
//     required this.isDelete,
//     required this.label,
//     required this.settingName,
//     required this.invoiceStatusSettingId,
//     required this.isService,
//     required this.isEmail,
//     required this.isSmS,
//     required this.isPushNotification,
//     required this.isCustomer,
//     required this.isAdmin,
//     required this.smSTemplateId,
//     required this.smSTemplateTitle,
//     required this.emailTemplateId,
//     required this.emailTemplateTitle,
//     required this.image,
//     required this.pushNotificationId,
//     required this.pushNotificationTitle,
//   });
//
//   int invoiceStatusId;
//   String name;
//   bool active;
//   String createDate;
//   dynamic isPublic;
//   dynamic isInternal;
//   dynamic isDelete;
//   int label;
//   dynamic settingName;
//   int invoiceStatusSettingId;
//   dynamic isService;
//   dynamic isEmail;
//   dynamic isSmS;
//   dynamic isPushNotification;
//   dynamic isCustomer;
//   dynamic isAdmin;
//   dynamic smSTemplateId;
//   dynamic smSTemplateTitle;
//   dynamic emailTemplateId;
//   dynamic emailTemplateTitle;
//   dynamic image;
//   dynamic pushNotificationId;
//   dynamic pushNotificationTitle;
//
//   factory InvoiceStatusViewModel.fromJson(Map<String, dynamic> json) => InvoiceStatusViewModel(
//     invoiceStatusId: json["invoiceStatusId"],
//     name: json["name"],
//     active: json["active"],
//     createDate:json["createDate"],
//     isPublic: json["isPublic"],
//     isInternal: json["isInternal"],
//     isDelete: json["isDelete"],
//     label: json["label"],
//     settingName: json["settingName"],
//     invoiceStatusSettingId: json["invoiceStatusSettingId"],
//     isService: json["isService"],
//     isEmail: json["isEmail"],
//     isSmS: json["isSmS"],
//     isPushNotification: json["isPushNotification"],
//     isCustomer: json["isCustomer"],
//     isAdmin: json["isAdmin"],
//     smSTemplateId: json["smSTemplateId"],
//     smSTemplateTitle: json["smSTemplateTitle"],
//     emailTemplateId: json["emailTemplateId"],
//     emailTemplateTitle: json["emailTemplateTitle"],
//     image: json["image"],
//     pushNotificationId: json["pushNotificationId"],
//     pushNotificationTitle: json["pushNotificationTitle"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "invoiceStatusId": invoiceStatusId,
//     "name": name,
//     "active": active,
//     "createDate": createDate,
//     "isPublic": isPublic,
//     "isInternal": isInternal,
//     "isDelete": isDelete,
//     "label": label,
//     "settingName": settingName,
//     "invoiceStatusSettingId": invoiceStatusSettingId,
//     "isService": isService,
//     "isEmail": isEmail,
//     "isSmS": isSmS,
//     "isPushNotification": isPushNotification,
//     "isCustomer": isCustomer,
//     "isAdmin": isAdmin,
//     "smSTemplateId": smSTemplateId,
//     "smSTemplateTitle": smSTemplateTitle,
//     "emailTemplateId": emailTemplateId,
//     "emailTemplateTitle": emailTemplateTitle,
//     "image": image,
//     "pushNotificationId": pushNotificationId,
//     "pushNotificationTitle": pushNotificationTitle,
//   };
// }
//
class StoreViewModel {
  StoreViewModel({
//     required this.storeId,
//     required this.supplierId,
    required this.shopName,
//     required this.mobile,
//     required this.landPhone,
//     required this.email,
//     required this.address,
//     required this.largeImage,
//     required this.mediumImage,
//     required this.smallImage,
//     required this.parentId,
//     required this.parentStoreId,
//     required this.latitued,
//     required this.longitued,
//     required this.description,
//     required this.countryId,
//     required this.stateId,
//     required this.cityId,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.guidId,
//     required this.currencyId,
//     required this.countryName,
//     required this.mapUrl,
//     required this.manualStoreId,
//     required this.manualParentStoreId,
//     required this.supplierName,
//     required this.isManagedWareHouse,
//     required this.breadcrumb,
//     required this.driverId,
//     required this.userName,
//     required this.password,
//     required this.storeNumber,
//     required this.isActive,
//     required this.childStores,
//     required this.storeOperationViewModels,
//     required this.storeSummaryViewModels,
//     required this.storeParentViewModels,
  });

//
//   int storeId;
//   dynamic supplierId;
  String shopName;

//   dynamic mobile;
//   dynamic landPhone;
//   dynamic email;
//   dynamic address;
//   dynamic largeImage;
//   dynamic mediumImage;
//   dynamic smallImage;
//   dynamic parentId;
//   int parentStoreId;
//   dynamic latitued;
//   dynamic longitued;
//   dynamic description;
//   dynamic countryId;
//   dynamic stateId;
//   dynamic cityId;
//   dynamic status;
//   String createdAt;
//   dynamic updatedAt;
//   dynamic guidId;
//   dynamic currencyId;
//   dynamic countryName;
//   dynamic mapUrl;
//   int manualStoreId;
//   int manualParentStoreId;
//   dynamic supplierName;
//   bool isManagedWareHouse;
//   List<dynamic> breadcrumb;
//   int driverId;
//   dynamic userName;
//   dynamic password;
//   dynamic storeNumber;
//   bool isActive;
//   List<dynamic> childStores;
//   List<dynamic> storeOperationViewModels;
//   dynamic storeSummaryViewModels;
//   List<dynamic> storeParentViewModels;
//
  factory StoreViewModel.fromJson(Map<String, dynamic> json) => StoreViewModel(
//     storeId: json["storeId"],
//     supplierId: json["supplierId"],
        shopName: json["shopName"],
//     mobile: json["mobile"],
//     landPhone: json["landPhone"],
//     email: json["email"],
//     address: json["address"],
//     largeImage: json["largeImage"],
//     mediumImage: json["mediumImage"],
//     smallImage: json["smallImage"],
//     parentId: json["parentId"],
//     parentStoreId: json["parentStoreId"],
//     latitued: json["latitued"],
//     longitued: json["longitued"],
//     description: json["description"],
//     countryId: json["countryId"],
//     stateId: json["stateId"],
//     cityId: json["cityId"],
//     status: json["status"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     guidId: json["guidId"],
//     currencyId: json["currencyId"],
//     countryName: json["countryName"],
//     mapUrl: json["mapUrl"],
//     manualStoreId: json["manualStoreId"],
//     manualParentStoreId: json["manualParentStoreId"],
//     supplierName: json["supplierName"],
//     isManagedWareHouse: json["isManagedWareHouse"],
//     breadcrumb: List<dynamic>.from(json["breadcrumb"].map((x) => x)),
//     driverId: json["driverId"],
//     userName: json["userName"],
//     password: json["password"],
//     storeNumber: json["storeNumber"],
//     isActive: json["isActive"],
//     childStores: List<dynamic>.from(json["childStores"].map((x) => x)),
//     storeOperationViewModels: List<dynamic>.from(json["storeOperationViewModels"].map((x) => x)),
//     storeSummaryViewModels: json["storeSummaryViewModels"],
//     storeParentViewModels: List<dynamic>.from(json["storeParentViewModels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
//     "storeId": storeId,
//     "supplierId": supplierId,
        "shopName": shopName,
//     "mobile": mobile,
//     "landPhone": landPhone,
//     "email": email,
//     "address": address,
//     "largeImage": largeImage,
//     "mediumImage": mediumImage,
//     "smallImage": smallImage,
//     "parentId": parentId,
//     "parentStoreId": parentStoreId,
//     "latitued": latitued,
//     "longitued": longitued,
//     "description": description,
//     "countryId": countryId,
//     "stateId": stateId,
//     "cityId": cityId,
//     "status": status,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "guidId": guidId,
//     "currencyId": currencyId,
//     "countryName": countryName,
//     "mapUrl": mapUrl,
//     "manualStoreId": manualStoreId,
//     "manualParentStoreId": manualParentStoreId,
//     "supplierName": supplierName,
//     "isManagedWareHouse": isManagedWareHouse,
//     "breadcrumb": List<dynamic>.from(breadcrumb.map((x) => x)),
//     "driverId": driverId,
//     "userName": userName,
//     "password": password,
//     "storeNumber": storeNumber,
//     "isActive": isActive,
//     "childStores": List<dynamic>.from(childStores.map((x) => x)),
//     "storeOperationViewModels": List<dynamic>.from(storeOperationViewModels.map((x) => x)),
//     "storeSummaryViewModels": storeSummaryViewModels,
//     "storeParentViewModels": List<dynamic>.from(storeParentViewModels.map((x) => x)),
      };
}

//
// class StateViewModel {
//   StateViewModel({
//     required this.stateId,
//     required this.countryId,
//     required this.countryName,
//     required this.stateName,
//     required this.isDeleted,
//     required this.guidId,
//   });
//
//   int stateId;
//   int countryId;
//   dynamic countryName;
//   String stateName;
//   dynamic isDeleted;
//   dynamic guidId;
//
//   factory StateViewModel.fromJson(Map<String, dynamic> json) => StateViewModel(
//     stateId: json["stateId"],
//     countryId: json["countryId"],
//     countryName: json["countryName"],
//     stateName: json["stateName"],
//     isDeleted: json["isDeleted"],
//     guidId: json["guidId"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "stateId": stateId,
//     "countryId": countryId,
//     "countryName": countryName,
//     "stateName":  stateName,
//     "isDeleted": isDeleted,
//     "guidId": guidId,
//   };
// }
