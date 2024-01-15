import 'dart:convert';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/brands_model.dart';
import 'package:dogventurehq/states/models/cartListResponseModel.dart';
import 'package:dogventurehq/states/models/customer_address_model.dart';
import 'package:dogventurehq/states/models/filter_product_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/product_details_model.dart';
import 'package:dogventurehq/states/models/product_favorite_model.dart';
import 'package:dogventurehq/states/models/product_model.dart';
import 'package:dogventurehq/states/models/search_model.dart';
import 'package:dogventurehq/states/models/store_order_model.dart';
import 'package:dogventurehq/states/models/store_wishlist_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';

import '../models/product_review_request_model.dart';

class StoreService {
  //for store order api
  static Future<GetOders> postStoreOrder(StoreOrderModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kOrderApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    GetOders obj = getOdersFromJson(response.toString());
    return obj;
  }

  //for get cart list
  static Future<List<CartListResponseModel>> getCartList(String tempId) async {
    var response = await BaseClient().get(
        '${ConstantStrings.kGetCartItemApi}${Preference.getUserId()}&TempId=${Preference.getUserId()}&IsFromCheckout=false&currencyId=1');
    List<CartListResponseModel> obj =
        cartListResponseModelFromJson(response.toString());
    print('obj: ${obj.length}');
    return obj;
  }

  //for get wishlist
  static Future<List<StoreWishListModel>> getWishList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kProductWishListApi}${Preference.getUserId()}',
    );
    List<StoreWishListModel> obj =
        storeWishListModelFromJson(response.toString());
    return obj;
  }

  //for add favorite product
  static Future<FavoriteProductModel> addFavoriteProduct(
      FavoriteProductModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kAddProductFavoriteApi,
      payloadObj.toJson(),
    );

    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    FavoriteProductModel obj =
        favoriteProductModelFromJson(response.toString());
    return obj;
  }

  //for add favorite product
  static Future<FilterProductModel> getFilterProduct(
      SearchModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kFilterProductApi,
      payloadObj.toJson(),
    );

    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    FilterProductModel obj = filterProductModelFromJson(response.toString());
    return obj;
  }

  //for get product
  static Future<List<ProductModel>> getProducts() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kStoreProductsApi}${Preference.getUserId()}',
    );
    List<ProductModel> obj = productModelFromJson(response.toString());
    return obj;
  }

  //for get brands
  static Future<List<BrandsModel>> getBrands() async {
    var response = await BaseClient().get(
      ConstantStrings.kBrandsApi,
    );
    List<BrandsModel> obj = brandsModelFromJson(response.toString());
    return obj;
  }

  //for get newArrival product
  static Future<List<ProductModel>> getNewArrivalProducts() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kNewArrivalProductsApi}/4/1/13/1/${Preference.getUserId()}',
    );
    List<ProductModel> obj = productModelFromJson(response.toString());
    return obj;
  }

  //for get newArrival product
  static Future<List<ProductModel>> getTopProducts() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kTopProductsApi}/4/1/13/1?customerId=${Preference.getUserId()}',
    );
    List<ProductModel> obj = productModelFromJson(response.toString());
    return obj;
  }

  //for get product details feature product
  static Future<List<ProductModel>> getProductDetailsFeatureList(
      String id) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kStoreProductDetailsFeatureApi}$id&languageId=4&currencyId=13&customerId=${Preference.getUserId()}',
    );
    List<ProductModel> obj = productModelFromJson(response.toString());
    return obj;
  }

  //for product details
  static Future<ProductDetailsModel> getProductDetails(id) async {
    var response = await BaseClient().get(
        '${ConstantStrings.kStoreProductDetailsApi}$id&languageId=4&customerId=${Preference.getUserId()}');

    ProductDetailsModel obj = productDetailsFromJson(response.toString());
    return obj;
  }

  static Future<String> addToReview(
      ProductReviewRequestModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kAddToReviewApi,
      payloadObj.toJson(),
    );

    return response;
  }
}
