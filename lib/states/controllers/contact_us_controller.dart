import 'package:dogventurehq/states/models/add_contact_model.dart';
import 'package:dogventurehq/states/services/add_contact_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  RxBool addContactUsLoadingFlag = true.obs;

  AddContactModel? addContact;

  void addContactUs(AddContactModel payloadObj) async {
    addContactUsLoadingFlag.value = true;
    try {
      addContact = await AddContactService.addContactUs(payloadObj);
      if (kDebugMode) {
        print('uploade Response Model: ${payloadObj.toJson()}');
      }
    } finally {
      addContactUsLoadingFlag.value = false;
    }
  }
}
