import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/cartRequestModel.dart';
import '../services/add_to_cart_service.dart';

class AddToCartController extends GetxController{
  RxBool addToCartLoadingFlag = true.obs;
  RxBool removeFromCartLoadingFlag = true.obs;
  RxBool removeAllFromCartLoadingFlag = true.obs;

  CartRequestModel? cartRequestObj;
  CartRequestModel? cartRemoveRequestObj;
  var response;

  @override
  void onInit() {
    super.onInit();
  }

  void addToCart(CartRequestModel payloadObj) async {
    addToCartLoadingFlag.value = true;
    try {
      cartRequestObj = await AddToCartService.addToCart(payloadObj);
      if (kDebugMode) {
       // print('cart Response Model: ${cartRequestObj}');
      }
    } finally {
      addToCartLoadingFlag.value = false;
    }
  }


  void removeAllFromCart(CartRequestModel payloadObj) async {
    removeAllFromCartLoadingFlag.value = true;
    try {
      cartRemoveRequestObj = await AddToCartService.removeAllFromCart(payloadObj);
      if (kDebugMode) {
       // print('cart Response Model: ${cartRequestObj}');
      }
    } finally {
      removeAllFromCartLoadingFlag.value = false;
    }
  }

  void removeFromCart(int id) async {
    removeFromCartLoadingFlag.value = true;
    try {
      response = await AddToCartService.removeFromCart(id);
      if (kDebugMode) {
         print('cart Response Model: $cartRequestObj');
      }
    } finally {
      removeFromCartLoadingFlag.value = false;
    }
  }



}