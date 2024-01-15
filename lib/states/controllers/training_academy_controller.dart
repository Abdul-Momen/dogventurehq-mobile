import 'package:dogventurehq/states/models/consultation_model.dart';
import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/states/services/training_services.dart';
import 'package:get/get.dart';

class TrainingAcademyController extends GetxController {
  RxBool trainingDetailsLoadingFlag = true.obs;
  RxBool trainingServicesLoadingFlag = true.obs;

  ConsultationModel? trainingDetails;
  List<ServicesListModel> servicesList = <ServicesListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTrainingServicesList();
  }

  void getTrainingDetails(String productMasterId) async {
    trainingDetailsLoadingFlag.value = true;
    try {
      trainingDetails =
          await TrainingAcademyService.getTrainingDetails(productMasterId);
    } finally {
      trainingDetailsLoadingFlag.value = false;
    }
  }

  void getTrainingServicesList() async {
    trainingServicesLoadingFlag.value = true;
    try {
      servicesList = await TrainingAcademyService.getTrainingServicesList();
    } finally {
      trainingServicesLoadingFlag.value = false;
    }
  }
}
