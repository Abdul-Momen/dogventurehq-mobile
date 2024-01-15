import 'dart:developer';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/activity_waiver_model.dart';
import 'package:dogventurehq/states/models/consultation_model.dart';
import 'package:dogventurehq/states/models/event_category_model.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/states/models/favorite_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/order_model.dart';
import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VetClinicService {

  static Future<ConsultationModel> getConsultationDetails(String productMasterId) async {
    var response = await BaseClient().get(
      ///adding gid (url+gid) when it needed
      '${ConstantStrings.kConsultationDetailsApi}$productMasterId&languageId=4',
    );
    ConsultationModel obj = consultationModelFromJson(response.toString());
    return obj;
  }


  static Future<List<ServicesListModel>> getVetClinicServicesList() async {
    var response = await BaseClient().get(
      ConstantStrings.kVetClinicServiceListApi,
    );
    List<ServicesListModel> obj = sevicesListModelFromJson(response.toString());
    return obj;
  }


}
