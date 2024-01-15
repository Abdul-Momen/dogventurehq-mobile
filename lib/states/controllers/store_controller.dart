import 'package:dogventurehq/states/models/cartListResponseModel.dart';

import 'package:dogventurehq/states/models/event_category_model.dart';

import 'package:dogventurehq/states/models/filter_product_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/product_details_model.dart';
import 'package:dogventurehq/states/models/product_favorite_model.dart';
import 'package:dogventurehq/states/models/product_model.dart';
import 'package:dogventurehq/states/models/product_review_request_model.dart';
import 'package:dogventurehq/states/models/search_model.dart';
import 'package:dogventurehq/states/models/store_order_model.dart';
import 'package:dogventurehq/states/models/store_wishlist_model.dart';

import 'package:dogventurehq/states/services/store_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/brands_model.dart';

class StoreController extends GetxController {
  RxBool productListLoadingFlag = true.obs;
  RxBool brandsListLoadingFlag = true.obs;
  RxBool filterCategoryListLoadingFlag = true.obs;
  RxBool featureProductListLoadingFlag = true.obs;
  RxBool newArrivalProductListLoadingFlag = true.obs;
  RxBool topProductListLoadingFlag = true.obs;
  RxBool filterProductListLoadingFlag = true.obs;
  RxBool productDetailsLoadingFlag = true.obs;
  RxBool isFavoriteLoadingFlag = true.obs;
  RxBool isFeatureFavoriteLoadingFlag = true.obs;
  RxBool isFilterFavoriteLoadingFlag = true.obs;
  RxBool isNewArrivalFavoriteLoadingFlag = true.obs;
  RxBool productFavoriteLoadingFlag = true.obs;
  RxBool productWishListLoadingFlag = true.obs;
  RxBool cartListLoadingFlag = true.obs;
  RxBool addToReviewLoadingFlag = true.obs;
  RxBool storeOrderLoadingFlag = true.obs;

  List<ProductModel> productList = <ProductModel>[].obs;
  List<ProductModel> filterProductList = <ProductModel>[].obs;
  List<BrandsModel> brandList = <BrandsModel>[].obs;
  List<ProductModel> newArrivalProductList = <ProductModel>[].obs;
  List<ProductModel> topProductList = <ProductModel>[].obs;
  List<StoreWishListModel> wishlist = <StoreWishListModel>[].obs;
  List<ProductModel> featureProductList = <ProductModel>[].obs;
  List<CartListResponseModel> cartList = <CartListResponseModel>[].obs;
  List<EventCategory> filterCategoryList = <EventCategory>[].obs;

  GetOders? orderObj;

  var response;

  String? deleteResponse;

  ProductDetailsModel? productDetails;

  FilterProductModel? filterProductObj;

  FavoriteProductModel? favoriteProduct;
  var counter = RxInt(1);
  double totalAmount = 0.0;

  @override
  void onInit() {
    super.onInit();
    getProductList();
    getBrandsList();
    getWishList();
  }

  //for place order, cart to order
  void productToOrder(StoreOrderModel payloadObj) async {
    storeOrderLoadingFlag.value = true;
    try {
      orderObj = await StoreService.postStoreOrder(payloadObj);
      //print('Response Model: ${orderObj!.toJson()}');
    } finally {
      storeOrderLoadingFlag.value = false;
    }
  }

  void getCartList(String tempId) async {
    cartListLoadingFlag.value = true;
    try {
      cartList = await StoreService.getCartList(tempId);
      if (kDebugMode) {
        print('cartList: ${cartList.length}');
      }
    } finally {
      cartListLoadingFlag.value = false;
      // isFeatureFavoriteLoadingFlag.value =false  ;

    }
  }

  void getWishList() async {
    productWishListLoadingFlag.value = true;
    try {
      wishlist = await StoreService.getWishList();
    } finally {
      productWishListLoadingFlag.value = false;
    }
  }

  void addFavoriteProduct(FavoriteProductModel payloadObj) async {
    productFavoriteLoadingFlag.value = true;
    try {
      favoriteProduct = await StoreService.addFavoriteProduct(payloadObj);
      // print('Response Model: ${favoriteProduct!.toJson()}');
    } finally {
      productFavoriteLoadingFlag.value = false;
    }
  }

  void filterProduct(SearchModel payloadObj) async {
    filterProductListLoadingFlag.value = true;
    try {
      filterProductObj = await StoreService.getFilterProduct(payloadObj);
      // print('Response Model: ${filterProductObj!.toJson()}');
    } finally {
      filterProductListLoadingFlag.value = false;
      isFilterFavoriteLoadingFlag.value = false;
    }
  }

  void getProductList() async {
    productListLoadingFlag.value = true;
    try {
      productList = await StoreService.getProducts();
    } finally {
      productListLoadingFlag.value = false;
      isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getBrandsList() async {
    brandsListLoadingFlag.value = true;
    try {
      brandList = await StoreService.getBrands();
    } finally {
      brandsListLoadingFlag.value = false;
      // isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getNewArrivalProductList() async {
    newArrivalProductListLoadingFlag.value = true;
    try {
      newArrivalProductList = await StoreService.getNewArrivalProducts();
    } finally {
      newArrivalProductListLoadingFlag.value = false;
      isNewArrivalFavoriteLoadingFlag.value = false;
    }
  }

  void getTopProductList() async {
    topProductListLoadingFlag.value = true;
    try {
      topProductList = await StoreService.getTopProducts();
    } finally {
      topProductListLoadingFlag.value = false;
      // isNewArrivalFavoriteLoadingFlag.value =false  ;

    }
  }

  void getProductDetailsFeatureList(String id) async {
    featureProductListLoadingFlag.value = true;
    try {
      featureProductList = await StoreService.getProductDetailsFeatureList(id);
    } finally {
      featureProductListLoadingFlag.value = false;
      isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getProductDetails(var id) async {
    productDetailsLoadingFlag.value = true;
    try {
      productDetails = await StoreService.getProductDetails(id);
    } finally {
      productDetailsLoadingFlag.value = false;
      isFavoriteLoadingFlag.value = false;
    }
  }

  void increment() {
    counter++;
  }

  void decrease() {
    if (counter != 1) {
      counter--;
    }
  }

  double totalPrice() {
    // price calculation logic
    return productDetails!.productDecimal * counter.toInt();
  }

  String totalCartPrice() {
    // price calculation logic
    totalAmount = 0.0;
    for (int i = 0; i < cartList.length; i++) {
      totalAmount = totalAmount + (cartList[i].price) * cartList[i].quantity;
    }
    return totalAmount.toString();
  }

  void addToReview(ProductReviewRequestModel payloadObj) async {
    addToReviewLoadingFlag.value = true;
    try {
      response = await StoreService.addToReview(payloadObj);
    } finally {
      addToReviewLoadingFlag.value = false;
    }
  }
}
