import 'dart:developer';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/activity_waiver_model.dart';
import 'package:dogventurehq/states/models/event_category_model.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/order_model.dart';
import 'package:dogventurehq/states/models/terms_conditions_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TermsConditionsService {
  static Future<List<TermsConditionsModel>> getTermsConditions(title) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kTermsConditionsApi}$title/4',
    );

    List<TermsConditionsModel> obj =
        termsConditionsModelFromJson(response.toString());
    return obj;
  }
}
