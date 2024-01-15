import 'package:dogventurehq/states/models/customer_model.dart';

import 'package:dogventurehq/states/services/create_account_services.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  RxBool createAccountLoadingFlag = true.obs;

  CustomerModel? customerObj;

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  void createAccount(CustomerModel payloadObj) async {
    createAccountLoadingFlag.value = true;
    try {
      customerObj = await CreateAccountService.createAccount(payloadObj);
      if (kDebugMode) {
        print('uploade Response Model: ${payloadObj.toJson()}');
      }
    } finally {
      createAccountLoadingFlag.value = false;
    }
  }

//
  //
  // void getPetDelete() async {
  //   petLoadingFlag.value = true;
  //   try {
  //     petList = await PetService.deletePet(id);
  //   } finally {
  //     petLoadingFlag.value = false;
  //   }
  // }

}
