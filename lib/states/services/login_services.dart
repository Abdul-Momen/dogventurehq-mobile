import 'dart:convert';
import 'dart:developer';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/customer_model.dart';
import 'package:dogventurehq/states/models/event_category_model.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/order_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<CustomerModel> userLogin(
      String userName, String password) async {
    var input = {
      "userName": userName,
      "password": password,
      "isRemimber": false
    };

    var response = await BaseClient().post(
      ConstantStrings.kLoginApi,
      input,
    );

    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    CustomerModel obj = customerModelFromJson(response.toString());
    return obj;
  }

  static Future<String> sentOTPbyMail(String userEmail) async {

    var response = await BaseClient().get(
      "${ConstantStrings.kForgetPasswordApi}Email=$userEmail",
    );

    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    var jsonRes = jsonDecode(response);
    String obj = jsonRes['message'];
    return obj;
  }
  static Future<String> resetPassword(String otp,String newPassword,String confirmPassword) async {

    var response = await BaseClient().get(
      "${ConstantStrings.kForgetPasswordApi}OTP=$otp&Password=$newPassword&ConfirmPassword=$confirmPassword",
    );

    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    var jsonRes = jsonDecode(response);
    String obj = jsonRes['message'];
    return obj;
  }
}
