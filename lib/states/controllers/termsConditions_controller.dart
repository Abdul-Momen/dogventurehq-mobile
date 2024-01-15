import 'package:dogventurehq/states/models/terms_conditions_model.dart';

import 'package:dogventurehq/states/services/terms_conditions_services.dart';
import 'package:get/get.dart';

class TermsConditionsController extends GetxController {
  RxBool termsConditionsLoadingFlag = true.obs;
  List<TermsConditionsModel> termsConditionsList = <TermsConditionsModel>[].obs;

  void getTermsConditionsList(String title) async {
    termsConditionsLoadingFlag.value = true;
    try {
      termsConditionsList =
          await TermsConditionsService.getTermsConditions(title);
    } finally {
      termsConditionsLoadingFlag.value = false;
    }
  }
}
