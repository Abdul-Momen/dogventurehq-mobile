import 'dart:convert';

import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/models/customer_model.dart';

import 'package:dogventurehq/states/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loginLoadingFlag = true.obs;
  RxBool forgetPasswordLoadingFlag = true.obs;
  RxBool resetPasswordLoadingFlag = true.obs;
  RxBool isLoginPressedFlag = false.obs;

  CustomerModel? customerModel;

  String? massage;
  String? resetMassage;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  void getLogin(String userName, String password) async {
    loginLoadingFlag.value = true;
    isLoginPressedFlag.value = true;
    try {
      customerModel = await LoginService.userLogin(userName, password);
      print('Response Model: ${customerModel!.toJson()}');
    } finally {
      loginLoadingFlag.value = false;
      isLoginPressedFlag.value = false;
    }
  }

  void sentOTPbyMail(String userEmail) async {
    forgetPasswordLoadingFlag.value = true;
    try {
      massage = await LoginService.sentOTPbyMail(userEmail);
      print('Response Model: ${customerModel!.toJson()}');
    } finally {
      forgetPasswordLoadingFlag.value = false;
    }
  }

  void resetPassword(String otp,String newPassword,String confirmPassword) async {
    resetPasswordLoadingFlag.value = true;
    try {
      massage = await LoginService.resetPassword(otp,newPassword,confirmPassword);
      print('Response Model: ${customerModel!.toJson()}');
    } finally {
      resetPasswordLoadingFlag.value = false;
    }
  }
}
