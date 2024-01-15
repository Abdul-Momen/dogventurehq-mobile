import 'dart:convert';

import 'package:dogventurehq/states/models/customer_model.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const loggedInFlag = 'loginFlag';
  static const userIdFlag = 'userIdFlag';
  static const userPasswordFlag = 'passwordFlag';
  static const userNameFlag = 'nameFlag';
  static const userEmailFlag = 'emailFlag';
  static const userPhoneFlag = 'numberFlag';
  static const userImageFlag = 'imageFlag';
  static const userDetails = 'userDetails';
  static const userList = 'userList';
  static const userAddress = 'userAddress';

  static bool getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  static void setLoggedInFlag(bool value) {
    prefs.write(loggedInFlag, value);
  }

  static int getUserId() {
    return prefs.read(userIdFlag) ?? 0;
  }

  static void setUserIdFlag(int value) {
    prefs.write(userIdFlag, value);
  }

  static String getPasswordFlag() {
    return prefs.read(userPasswordFlag) ?? '';
  }

  static void setPasswordFlag(String value) {
    prefs.write(userPasswordFlag, value);
  }

  static String getNameFlag() {
    return prefs.read(userNameFlag) ?? '';
  }

  static void setNameFlag(String value) {
    prefs.write(userNameFlag, value);
  }

  static String getUserImageFlag() {
    return prefs.read(userImageFlag);
  }

  static void setUserImageFlag(String value) {
    prefs.write(userImageFlag, value);
  }

  static String getAddressFlag() {
    return prefs.read(userAddress) ?? '';
  }

  static void setAddressFlag(String value) {
    prefs.write(userAddress, value);
    print(userAddress);
  }

  static String getEmailFlag() {
    return prefs.read(userEmailFlag) ?? '';
  }

  static void setEmailFlag(String value) {
    prefs.write(userEmailFlag, value);
  }

  static String getPhoneFlag() {
    return prefs.read(userPhoneFlag) ?? '';
  }

  static void setPhoneFlag(String value) {
    prefs.write(userPhoneFlag, value);
  }

  // static CustomerModel getUserDetails() {
  //   var result = prefs.read(userDetails);
  //   return CustomerModel.fromJson(json.decode(result));
  // }

  static void setUserDetails(CustomerModel value) {
    print('User Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }

  static List<EventModel> getUserList() {
    var result = prefs.read(userList);
    return List<EventModel>.from(json.decode(result));
  }

  static void setUserList(EventModel value) {
    print('User list: ${json.encode(value.toJson())}');
    prefs.write(userList, json.encode(value.toJson()));
  }

  static void clearAll() {
    prefs.erase();
  }
}
