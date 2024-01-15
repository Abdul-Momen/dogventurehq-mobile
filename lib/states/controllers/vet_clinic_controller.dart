import 'package:dogventurehq/states/models/consultation_model.dart';

import 'package:dogventurehq/states/models/services_list_model.dart';

import 'package:dogventurehq/states/services/vet_clinic_services.dart';
import 'package:get/get.dart';

class VetClinicController extends GetxController {
  RxBool consultationLoadingFlag = true.obs;
  RxBool vetClinicServicesLoadingFlag = true.obs;

  ConsultationModel? consultationDetails;
  List<ServicesListModel> servicesList = <ServicesListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getVetClinicServicesList();
  }

  void getConsultationDetails(String productMasterId) async {
    consultationLoadingFlag.value = true;
    try {
      consultationDetails =
          await VetClinicService.getConsultationDetails(productMasterId);
    } finally {
      consultationLoadingFlag.value = false;
    }
  }

  void getVetClinicServicesList() async {
    vetClinicServicesLoadingFlag.value = true;
    try {
      servicesList = await VetClinicService.getVetClinicServicesList();
    } finally {
      vetClinicServicesLoadingFlag.value = false;
    }
  }
}
