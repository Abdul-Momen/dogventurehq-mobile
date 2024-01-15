

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/add_contact_model.dart';
import 'package:dogventurehq/states/models/user_profile_update_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class AddContactService {

  static Future<AddContactModel> addContactUs(AddContactModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kAddContact,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    AddContactModel obj = addContactModelFromJson(response.toString());
    return obj;
  }



}
