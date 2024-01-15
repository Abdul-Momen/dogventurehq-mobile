//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.invoiceMasterId,
    required this.customerId,
    // required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    required this.courierCharge,
    required this.carryingCost,
    // required this.paymentMethod,
    // required this.remark,
    // required this.discountCode,
    // required this.discountValue,
    // required this.paymentStatus,
    // required this.createdAt,
    // required this.countryId,
    // required this.stateId,
    // required this.cityId,
    required this.invoiceStatusId,
    // required this.supplierId,
    required this.eventId,
    required this.invoiceRequestModels,
    required this.paymentRequestModels,
    required this.billingShippingAddressRequestModels,
    required this.inputFieldValueRequestModels,
    required this.orderFrom,
    required this.orderSource,
  });
  int invoiceMasterId;
  int customerId;
  // dynamic invoiceDate;
  double totalAmount;
  double receivedAmt;
  double courierCharge;
  double carryingCost;
  // dynamic paymentMethod;
  // dynamic remark;
  // dynamic discountCode;
  // dynamic discountValue;
  // dynamic paymentStatus;
  // dynamic createdAt;
  // dynamic countryId;
  // dynamic stateId;
  // dynamic cityId;
  int invoiceStatusId;
  // dynamic supplierId;
  int eventId;
  List<InvoiceRequestModel> invoiceRequestModels;
  List<PaymentRequestModel> paymentRequestModels;
  List<dynamic> billingShippingAddressRequestModels;
  List<dynamic> inputFieldValueRequestModels;
  String orderFrom;
  String orderSource;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        invoiceMasterId: json["invoiceMasterId"] ?? 0,
        customerId: json["customerId"] ?? 0,
        // invoiceDate: json["InvoiceDate"],
        totalAmount: json["totalAmount"] ?? 0.0,
        receivedAmt: json["receivedAmt"] ?? 0.0,
        courierCharge: json["courierCharge"] ?? 0.0,
        carryingCost: json["carryingCost"] ?? 0.0,
        // paymentMethod: json["PaymentMethod"],
        // remark: json["Remark"],
        // discountCode: json["DiscountCode"],
        // discountValue: json["DiscountValue"],
        // paymentStatus: json["PaymentStatus"],
        // createdAt: json["CreatedAt"],
        // countryId: json["CountryId"],
        // stateId: json["StateId"],
        // cityId: json["CityId"],
        invoiceStatusId: json["invoiceStatusId"] ?? 0,
        // supplierId: json["SupplierId"],
        eventId: json["eventId"] ?? 0,
        invoiceRequestModels: json["invoiceRequestModels"] != null
            ? List<InvoiceRequestModel>.from(json["invoiceRequestModels"]
                .map((x) => InvoiceRequestModel.fromJson(x)))
            : [],
        paymentRequestModels: json["paymentRequestModels"] != null
            ? List<PaymentRequestModel>.from(json["paymentRequestModels"]
                .map((x) => PaymentRequestModel.fromJson(x)))
            : [],
        billingShippingAddressRequestModels:
            json["billingShippingAddressRequestModels"] != null
                ? List<dynamic>.from(
                    json["billingShippingAddressRequestModels"].map((x) => x))
                : [],
        inputFieldValueRequestModels:
            json["billingShippingAddressRequestModels"] != null
                ? List<dynamic>.from(
                    json["inputFieldValueRequestModels"].map((x) => x))
                : [],
        orderFrom: json["OrderFrom"] ?? '',
        orderSource: json["OrderSource"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "InvoiceMasterId": 0,
        "CustomerId": customerId,
        "RefNumber": null,
        "InvoiceDate": null,
        "TotalAmount": totalAmount,
        "ReceivedAmt": receivedAmt,
        "CourierCharge": 0,
        "CarryingCost": 0,
        "PaymentMethod": null,
        "Remark": null,
        "DiscountCode": null,
        "DiscountValue": null,
        "PaymentStatus": null,
        "Status": null,
        "CreatedAt": null,
        "CountryId": null,
        "StateId": null,
        "CityId": null,
        "InvoiceStatusId": invoiceStatusId,
        "SupplierId": null,
        "EventId": null,
        "MembershipId": null,
        "MembershipFacilitiesId": null,
        "PackageId": null,
        "InvoiceRequestModels":
            List<dynamic>.from(invoiceRequestModels.map((x) => x.toJson())),
        "PaymentRequestModels":
            List<dynamic>.from(paymentRequestModels.map((x) => x.toJson())),
        "BillingShippingAddressRequestModels": [],
        "InputFieldValueRequestModels": [],
        "OrderFrom": orderFrom,
        "OrderSource": orderSource,
        "PaymentRefferenceNO": "9c3fda98-0b9c-47f2-9ee5-9082459247be",
      };
}

class InvoiceRequestModel {
  InvoiceRequestModel({
    required this.invoiceId,
    // required this.invoiceMasterId,
    // required this.refNumber,
    // required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    required this.carryingCost,
    required this.courierCharge,
    required this.paymentMethod,
    // required this.paymentStatus,
    // required this.remark,
    // required this.discountCode,
    // required this.discountValue,
    required this.storeId,
    // required this.status,
    // required this.createdAt,
    required this.supplierId,
    // required this.supplierName,
    // required this.shopName,
    required this.invoiceStatusId,
    // required this.amountToSupplier,
    // required this.amountToAdmin,
    // required this.supplierCommissionId,
    required this.isService,
    this.shopLogo,
    // required this.isDigitalProduct,
    // required this.isQuotationProduct,
    this.serviceDate,
    // required this.serviceDateTime,
    // required this.serviceTime,
    // required this.serviceTimeString,
    // required this.parentInvoiceId,
    required this.ticketBuyForCustomerId,
    required this.checkIn,
    required this.checkOut,
    // required this.customerId,
    required this.invoiceDetailsRequestModels,
    required this.invoiceDetailsViewModels,
    required this.eventPetDetailsRequestModels,
  });

  int invoiceId;
  // dynamic invoiceMasterId;
  // dynamic refNumber;
  // dynamic invoiceDate;
  double totalAmount;
  double receivedAmt;
  int carryingCost;
  int courierCharge;
  int paymentMethod;
  // dynamic paymentStatus;
  // dynamic remark;
  // dynamic discountCode;
  // dynamic discountValue;
  int? storeId;
  // dynamic status;
  // dynamic createdAt;
  int? supplierId;
  // dynamic supplierName;
  // dynamic shopName;
  int invoiceStatusId;
  // dynamic amountToSupplier;
  // dynamic amountToAdmin;
  // dynamic supplierCommissionId;
  bool isService;
  String? shopLogo;
  // dynamic isDigitalProduct;
  // dynamic isQuotationProduct;
  String? serviceDate;
  // dynamic serviceDateTime;
  // dynamic serviceTime;
  // dynamic serviceTimeString;
  // dynamic parentInvoiceId;
  DateTime? checkIn;
  DateTime? checkOut;
  int ticketBuyForCustomerId;
  // dynamic customerId;
  List<InvoiceDetailsRequestModel> invoiceDetailsRequestModels;
  List<InvoiceDetailsViewModel> invoiceDetailsViewModels;
  List<EventPetDetailsRequestModel> eventPetDetailsRequestModels;

  factory InvoiceRequestModel.fromJson(Map<String, dynamic> json) =>
      InvoiceRequestModel(
        invoiceId: json["InvoiceId"] ?? 0,
        // invoiceMasterId: json["InvoiceMasterId"],
        // refNumber: json["RefNumber"],
        // invoiceDate: json["InvoiceDate"],
        totalAmount: json["TotalAmount"] ?? 0,
        receivedAmt: json["ReceivedAmt"] ?? 0,
        carryingCost: json["CarryingCost"] ?? 0,
        courierCharge: json["CourierCharge"] ?? 0,
        paymentMethod: json["PaymentMethod"] ?? 0,
        // paymentStatus: json["PaymentStatus"],
        // remark: json["Remark"],
        // discountCode: json["DiscountCode"],
        // discountValue: json["DiscountValue"],
        storeId: json["StoreId"] ?? 0,
        // status: json["Status"],
        // createdAt: json["CreatedAt"],
        supplierId: json["SupplierId"] ?? 0,
        // supplierName: json["SupplierName"],
        // shopName: json["ShopName"],
        invoiceStatusId: json["InvoiceStatusId"] ?? 0,
        // amountToSupplier: json["AmountToSupplier"],
        // amountToAdmin: json["AmountToAdmin"],
        // supplierCommissionId: json["SupplierCommissionId"],
        isService: json["IsService"] ?? true,
        shopLogo: json["ShopLogo"],
        // isDigitalProduct: json["IsDigitalProduct"],
        // isQuotationProduct: json["IsQuotationProduct"],
        serviceDate: json["ServiceDate"] ?? '',
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
        // serviceDateTime: json["ServiceDateTime"],
        // serviceTime: json["ServiceTime"],
        // serviceTimeString: json["ServiceTimeString"],
        // parentInvoiceId: json["ParentInvoiceId"],
        ticketBuyForCustomerId: json["ticketBuyForCustomerId"] ?? 0,
        // customerId: json["CustomerId"],
        invoiceDetailsRequestModels: List<InvoiceDetailsRequestModel>.from(
            json["invoiceDetailsRequestModels"]
                .map((x) => InvoiceDetailsRequestModel.fromJson(x))),
        invoiceDetailsViewModels: List<InvoiceDetailsViewModel>.from(
            json["invoiceDetailsViewModels"]
                .map((x) => InvoiceDetailsViewModel.fromJson(x))),
        eventPetDetailsRequestModels: List<EventPetDetailsRequestModel>.from(
            json["eventPetDetailsRequestModels"]
                .map((x) => EventPetDetailsRequestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "InvoiceId": 0,
        "InvoiceMasterId": null,
        "RefNumber": null,
        "InvoiceDate": null,
        "TotalAmount": totalAmount.toInt(),
        "ReceivedAmt": receivedAmt.toInt(),
        "CarryingCost": 0,
        "CourierCharge": 0,
        "PaymentMethod": 1,
        "PaymentStatus": null,
        "Remark": null,
        "DiscountCode": null,
        "DiscountValue": null,
        "StoreId": storeId,
        "Status": null,
        "CreatedAt": null,
        "SupplierId": supplierId,
        "SupplierName": null,
        "ShopName": null,
        "InvoiceStatusId": 0,
        "AmountToSupplier": null,
        "AmountToAdmin": null,
        "SupplierCommissionId": null,
        "IsService": isService,
        "ShopLogo": null,
        "IsDigitalProduct": null,
        "IsQuotationProduct": null,
        "ServiceDate": serviceDate,
        // "ServiceDate": "\\/Date(1680112800000)\\/",
        "ServiceDateTime": null,
        "ServiceTime": null,
        "ServiceTimeString": null,
        "ParentInvoiceId": null,
        "TicketBuyForCustomerId": ticketBuyForCustomerId,
        "checkIn": checkIn != null ? checkIn!.toIso8601String() : null,
        "checkOut": checkOut != null ? checkOut!.toIso8601String() : null,
        // "CheckIn": "\\/Date(1680112800000)\\/",
        // "CheckOut": "\\/Date(1680199200000)\\/",
        "CustomerId": null,
        "InvoiceDetailsRequestModels": List<dynamic>.from(
            invoiceDetailsRequestModels.map((x) => x.toJson())),
        "invoiceDetailsViewModels": [],
        // List<dynamic>.from(invoiceDetailsViewModels.map((x) => x.toJson())),
        "EventPetDetailsRequestModels": List<dynamic>.from(
            eventPetDetailsRequestModels.map((x) => x.toJson())),
        "PackageItemRequestModels": [],
      };
}

class EventPetDetailsRequestModel {
  EventPetDetailsRequestModel({
    required this.profileId,
    // required this.customerId,
    // required this.name,
    // required this.petTypeId,
    // required this.profileBreedGroupId,
    // required this.microchipNumber,
    // required this.dateOfBirth,
    // required this.gender,
    // required this.status,
    // required this.about,
    // required this.isYourVaccinated,
    // required this.isYourCastrated,
    // required this.createBy,
    // required this.updateDate,
    // required this.invoiceMasterId,
    // required this.invoiceId,
    // required this.packageFacilitiesId,
    // required this.packageId,
  });

  int profileId;
  // int customerId;
  // String name;
  // int petTypeId;
  // int profileBreedGroupId;
  // int microchipNumber;
  // DateTime dateOfBirth;
  // String gender;
  // String status;
  // String about;
  // bool isYourVaccinated;
  // bool isYourCastrated;
  // int createBy;
  // DateTime updateDate;
  // int invoiceMasterId;
  // int invoiceId;
  // int packageFacilitiesId;
  // int packageId;

  factory EventPetDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      EventPetDetailsRequestModel(
        profileId: json["profileId"],
        // customerId: json["customerId"],
        // name: json["name"],
        // petTypeId: json["petTypeId"],
        // profileBreedGroupId: json["profileBreedGroupId"],
        // microchipNumber: json["microchipNumber"],
        // dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        // gender: json["gender"],
        // status: json["status"],
        // about: json["about"],
        // isYourVaccinated: json["isYourVaccinated"],
        // isYourCastrated: json["isYourCastrated"],
        // createBy: json["createBy"],
        // updateDate: DateTime.parse(json["updateDate"]),
        // invoiceMasterId: json["invoiceMasterId"],
        // invoiceId: json["invoiceId"],
        // packageFacilitiesId: json["packageFacilitiesId"],
        // packageId: json["packageId"],
      );

  Map<String, dynamic> toJson() => {
        "ProfileId": 1,
        "CustomerId": 0,
        "Name": null,
        "PetTypeId": 0,
        "ProfileBreedGroupId": null,
        "MicrochipNumber": null,
        "DateOfBirth": null,
        "Gender": null,
        "Status": null,
        "About": null,
        "IsYourVaccinated": null,
        "IsYourCastrated": null,
        "CreateBy": 0,
        "UpdateDate": null,
        "InvoiceMasterId": null,
        "InvoiceId": null,
        "PackageFacilitiesId": null,
        "PackageId": null
      };
}

class InvoiceDetailsRequestModel {
  InvoiceDetailsRequestModel({
    required this.invoiceDetailsId,
    required this.invoiceId,
    required this.productMasterId,
    required this.quantity,
    required this.price,
    // required this.status,
    // required this.createdAt,
    required this.productSubSkuId,
    // required this.qrCodeNo,
    // required this.pdfUrl,
    // required this.qrCodeImage,
  });

  int invoiceDetailsId;
  int invoiceId;
  int productMasterId;
  int quantity;
  double price;
  // bool status;
  // dynamic createdAt;
  int productSubSkuId;
  // dynamic qrCodeNo;
  // dynamic pdfUrl;
  // dynamic qrCodeImage;

  factory InvoiceDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsRequestModel(
        invoiceDetailsId: json["InvoiceDetailsId"] ?? 0,
        invoiceId: json["InvoiceId"] ?? 0,
        productMasterId: json["ProductMasterId"] ?? 0,
        quantity: json["Quantity"] ?? 0,
        price: json["Price"] ?? 0,
        // status: json["Status"],
        // createdAt: json["CreatedAt"],
        productSubSkuId: json["ProductSubSKUId"] ?? 0,
        // qrCodeNo: json["QRCodeNo"],
        // pdfUrl: json["PdfUrl"],
        // qrCodeImage: json["QRCodeImage"],
      );

  Map<String, dynamic> toJson() => {
        "InvoiceDetailsId": 0,
        "InvoiceId": 0,
        "ProductMasterId": productMasterId,
        "Quantity": quantity,
        "Price": price.toInt(),
        "Status": null,
        "CreatedAt": null,
        "ProductSubSKUId": productSubSkuId,
        "PdfUrl": null,
        "QRCodeNo": null,
        "QRCodeImage": null,
        "IsComboProduct": false,
      };
}

class InvoiceDetailsViewModel {
  InvoiceDetailsViewModel({
    // required this.invoiceDetailsId,
    // required this.invoiceId,
    required this.productMasterId,
    // required this.quantity,
    // required this.price,
    // required this.status,
    // required this.createdAt,
    // required this.productTypeId,
    required this.storeId,
    required this.supplierId,
    // required this.supplierName,
    // required this.supplierMobile,
    // required this.productName,
    // required this.invoiceMasterId,
    // required this.productSkuId,
    // required this.subSku,
    // required this.largeImage,
    // required this.mediumImage,
    // required this.smallImage,
    // required this.fileLocation,
    // required this.digitalProductGuid,
    // required this.digitalProductUrl,
    // required this.serviceDate,
    // required this.qrCodeNo,
    // required this.pdfUrl,
    // required this.qrCodeImage,
    // required this.brandName,
    // required this.guidId,
    // required this.checkIn,
    // required this.checkOut,
    // required this.productSubSkuViewModels,
  });

  // int invoiceDetailsId;
  // int invoiceId;
  int productMasterId;
  // int quantity;
  // int price;
  // String status;
  // DateTime createdAt;
  // int productTypeId;
  int storeId;
  int supplierId;
  // String supplierName;
  // String supplierMobile;
  // String productName;
  // int invoiceMasterId;
  // int productSkuId;
  // String subSku;
  // String largeImage;
  // String mediumImage;
  // String smallImage;
  // String fileLocation;
  // String digitalProductGuid;
  // String digitalProductUrl;
  // DateTime serviceDate;
  // String qrCodeNo;
  // String pdfUrl;
  // String qrCodeImage;
  // String brandName;
  // String guidId;
  // DateTime checkIn;
  // DateTime checkOut;
  // List<ProductSubSkuViewModel> productSubSkuViewModels;

  factory InvoiceDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsViewModel(
        // invoiceDetailsId: json["invoiceDetailsId"],
        // invoiceId: json["invoiceId"],
        productMasterId: json["productMasterId"],
        // quantity: json["quantity"],
        // price: json["price"],
        // status: json["status"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // productTypeId: json["productTypeId"],
        storeId: json["storeId"],
        supplierId: json["supplierId"],
        // supplierName: json["supplierName"],
        // supplierMobile: json["supplierMobile"],
        // productName: json["productName"],
        // invoiceMasterId: json["invoiceMasterId"],
        // productSkuId: json["productSkuId"],
        // subSku: json["subSku"],
        // largeImage: json["largeImage"],
        // mediumImage: json["mediumImage"],
        // smallImage: json["smallImage"],
        // fileLocation: json["fileLocation"],
        // digitalProductGuid: json["digitalProductGuid"],
        // digitalProductUrl: json["digitalProductUrl"],
        // serviceDate: DateTime.parse(json["serviceDate"]),
        // qrCodeNo: json["qrCodeNo"],
        // pdfUrl: json["pdfUrl"],
        // qrCodeImage: json["qrCodeImage"],
        // brandName: json["brandName"],
        // guidId: json["guidId"],
        // checkIn: DateTime.parse(json["checkIn"]),
        // checkOut: DateTime.parse(json["checkOut"]),
        // productSubSkuViewModels: List<ProductSubSkuViewModel>.from(
        //     json["productSubSKUViewModels"]
        //         .map((x) => ProductSubSkuViewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        // "invoiceDetailsId": invoiceDetailsId,
        // "invoiceId": invoiceId,
        "ProductMasterId": productMasterId,
        // "quantity": quantity,
        // "price": price,
        // "status": status,
        // "createdAt": createdAt.toIso8601String(),
        // "productTypeId": productTypeId,
        "StoreId": storeId,
        "SupplierId": supplierId,
        // "supplierName": supplierName,
        // "supplierMobile": supplierMobile,
        // "productName": productName,
        // "invoiceMasterId": invoiceMasterId,
        // "productSkuId": productSkuId,
        // "subSku": subSku,
        // "largeImage": largeImage,
        // "mediumImage": mediumImage,
        // "smallImage": smallImage,
        // "fileLocation": fileLocation,
        // "digitalProductGuid": digitalProductGuid,
        // "digitalProductUrl": digitalProductUrl,
        // "serviceDate": serviceDate.toIso8601String(),
        // "qrCodeNo": qrCodeNo,
        // "pdfUrl": pdfUrl,
        // "qrCodeImage": qrCodeImage,
        // "brandName": brandName,
        // "guidId": guidId,
        // "checkIn": checkIn.toIso8601String(),
        // "checkOut": checkOut.toIso8601String(),
        // "productSubSKUViewModels":
        //     List<dynamic>.from(productSubSkuViewModels.map((x) => x.toJson())),
      };
}

class ProductSubSkuViewModel {
  ProductSubSkuViewModel({
    required this.productSubSkuId,
    required this.productMasterId,
    required this.subSku,
    required this.price,
    required this.quantity,
    required this.barcode,
    required this.status,
    required this.createBy,
    required this.createDate,
    required this.skuImage,
    required this.attributeCombination,
    required this.productAttributeDetailsId,
    required this.isDelete,
    required this.attributesIds,
    required this.attributeSetId,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.videoEmbade,
    required this.productDetailsId,
    required this.wareHouseProductMasterInfoId,
    required this.wareHouseId,
    required this.wareHouseAttributeDetailId,
    required this.wareHouseShelfAttributeDetailId,
    required this.wareHouseShelfRowAttributeDetailId,
    required this.wareHouseShelfColumnAttributeDetailId,
    required this.purchaseRate,
    required this.saleRate,
    required this.productSubSkuDetailsViewModels,
  });

  int productSubSkuId;
  int productMasterId;
  String subSku;
  int price;
  int quantity;
  String barcode;
  String status;
  int createBy;
  DateTime createDate;
  String skuImage;
  String attributeCombination;
  int productAttributeDetailsId;
  bool isDelete;
  String attributesIds;
  int attributeSetId;
  String largeImage;
  String mediumImage;
  String smallImage;
  String videoEmbade;
  int productDetailsId;
  int wareHouseProductMasterInfoId;
  int wareHouseId;
  int wareHouseAttributeDetailId;
  int wareHouseShelfAttributeDetailId;
  int wareHouseShelfRowAttributeDetailId;
  int wareHouseShelfColumnAttributeDetailId;
  int purchaseRate;
  int saleRate;
  List<ProductSubSkuDetailsViewModel> productSubSkuDetailsViewModels;

  factory ProductSubSkuViewModel.fromJson(Map<String, dynamic> json) =>
      ProductSubSkuViewModel(
        productSubSkuId: json["productSubSKUId"],
        productMasterId: json["productMasterId"],
        subSku: json["subSKU"],
        price: json["price"],
        quantity: json["quantity"],
        barcode: json["barcode"],
        status: json["status"],
        createBy: json["createBy"],
        createDate: DateTime.parse(json["createDate"]),
        skuImage: json["skuImage"],
        attributeCombination: json["attributeCombination"],
        productAttributeDetailsId: json["productAttributeDetailsId"],
        isDelete: json["isDelete"],
        attributesIds: json["attributesIds"],
        attributeSetId: json["attributeSetId"],
        largeImage: json["largeImage"],
        mediumImage: json["mediumImage"],
        smallImage: json["smallImage"],
        videoEmbade: json["videoEmbade"],
        productDetailsId: json["productDetailsId"],
        wareHouseProductMasterInfoId: json["wareHouseProductMasterInfoId"],
        wareHouseId: json["wareHouseId"],
        wareHouseAttributeDetailId: json["wareHouseAttributeDetailId"],
        wareHouseShelfAttributeDetailId:
            json["wareHouseShelfAttributeDetailId"],
        wareHouseShelfRowAttributeDetailId:
            json["wareHouseShelfRowAttributeDetailId"],
        wareHouseShelfColumnAttributeDetailId:
            json["wareHouseShelfColumnAttributeDetailId"],
        purchaseRate: json["purchaseRate"],
        saleRate: json["saleRate"],
        productSubSkuDetailsViewModels:
            List<ProductSubSkuDetailsViewModel>.from(
                json["productSubSkuDetailsViewModels"]
                    .map((x) => ProductSubSkuDetailsViewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productSubSKUId": productSubSkuId,
        "productMasterId": productMasterId,
        "subSKU": subSku,
        "price": price,
        "quantity": quantity,
        "barcode": barcode,
        "status": status,
        "createBy": createBy,
        "createDate": createDate.toIso8601String(),
        "skuImage": skuImage,
        "attributeCombination": attributeCombination,
        "productAttributeDetailsId": productAttributeDetailsId,
        "isDelete": isDelete,
        "attributesIds": attributesIds,
        "attributeSetId": attributeSetId,
        "largeImage": largeImage,
        "mediumImage": mediumImage,
        "smallImage": smallImage,
        "videoEmbade": videoEmbade,
        "productDetailsId": productDetailsId,
        "wareHouseProductMasterInfoId": wareHouseProductMasterInfoId,
        "wareHouseId": wareHouseId,
        "wareHouseAttributeDetailId": wareHouseAttributeDetailId,
        "wareHouseShelfAttributeDetailId": wareHouseShelfAttributeDetailId,
        "wareHouseShelfRowAttributeDetailId":
            wareHouseShelfRowAttributeDetailId,
        "wareHouseShelfColumnAttributeDetailId":
            wareHouseShelfColumnAttributeDetailId,
        "purchaseRate": purchaseRate,
        "saleRate": saleRate,
        "productSubSkuDetailsViewModels": List<dynamic>.from(
            productSubSkuDetailsViewModels.map((x) => x.toJson())),
      };
}

class ProductSubSkuDetailsViewModel {
  ProductSubSkuDetailsViewModel({
    required this.productSubSkuDetailsId,
    required this.productSubSkuId,
    required this.attributeDetailId,
  });

  int productSubSkuDetailsId;
  int productSubSkuId;
  int attributeDetailId;

  factory ProductSubSkuDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      ProductSubSkuDetailsViewModel(
        productSubSkuDetailsId: json["productSubSKUDetailsId"],
        productSubSkuId: json["productSubSKUId"],
        attributeDetailId: json["attributeDetailId"],
      );

  Map<String, dynamic> toJson() => {
        "productSubSKUDetailsId": productSubSkuDetailsId,
        "productSubSKUId": productSubSkuId,
        "attributeDetailId": attributeDetailId,
      };
}

class PaymentRequestModel {
  PaymentRequestModel({
    required this.paymentId,
    // required this.invoiceMasterId,
    required this.currencyId,
    required this.amount,
    required this.courierCharge,
    // required this.discountAmount,
    required this.carryingCost,
    required this.paymentMethod,
    // required this.courierAgencyId,
    // required this.payDate,
    // required this.note,
    // required this.transactionNo,
    // required this.status,
    // required this.createdAt,
    // required this.couponId,
  });

  int paymentId;
  // dynamic invoiceMasterId;
  int currencyId;
  double amount;
  int courierCharge;
  // dynamic discountAmount;
  int carryingCost;
  int paymentMethod;
  // dynamic courierAgencyId;
  // dynamic payDate;
  // dynamic note;
  // dynamic transactionNo;
  // bool status;
  // dynamic createdAt;
  // dynamic couponId;

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      PaymentRequestModel(
        paymentId: json["PaymentId"] ?? 0,
        // invoiceMasterId: json["InvoiceMasterId"],
        currencyId: json["CurrencyId"] ?? 0,
        amount: json["Amount"] ?? 0.0,
        courierCharge: json["CourierCharge"] ?? 0,
        // discountAmount: json["DiscountAmount"],
        carryingCost: json["CarryingCost"] ?? 0,
        paymentMethod: json["PaymentMethod"] ?? 0,
        // courierAgencyId: json["CourierAgencyId"],
        // payDate: json["PayDate"],
        // note: json["Note"],
        // transactionNo: json["TransactionNo"],
        // status: json["Status"],
        // createdAt: json["CreatedAt"],
        // couponId: json["CouponId"],
      );

  Map<String, dynamic> toJson() => {
        "PaymentId": paymentId,
        "InvoiceMasterId": null,
        "CurrencyId": 1,
        "Amount": 0.0,
        "CourierCharge": 0.0,
        "DiscountAmount": null,
        "CarryingCost": 0.0,
        "PaymentMethod": 1,
        "CourierAgencyId": null,
        "PayDate": null,
        "Note": null,
        "TransactionNo": null,
        "Status": null,
        "CreatedAt": null,
        "CouponId": null
      };
}
