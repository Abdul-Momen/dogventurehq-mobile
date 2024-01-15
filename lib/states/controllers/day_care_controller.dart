import 'package:dogventurehq/states/models/consultation_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/order_model.dart';

import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/states/services/day_care_services.dart';
import 'package:dogventurehq/states/services/event_services.dart';

import 'package:get/get.dart';

class DayCareController extends GetxController {
  RxBool dayCareLoadingFlag = true.obs;
  RxBool dayServicesLoadingFlag = true.obs;
  RxBool groomingServicesLoadingFlag = true.obs;
  RxBool eventBookingLoadingFlag = true.obs;

  GetOders? getOderList;

  ConsultationModel? dayCareDetails;
  List<ServicesListModel> servicesList = <ServicesListModel>[].obs;
  List<ServicesListModel> groomingServicesList = <ServicesListModel>[].obs;

  void getDayCareDetails({required String id}) async {
    dayCareLoadingFlag.value = true;
    try {
      dayCareDetails = await DayCareService.getDayCareDetails(id);
    } finally {
      dayCareLoadingFlag.value = false;
    }
  }

  void getDayCareServicesList() async {
    dayServicesLoadingFlag.value = true;
    try {
      servicesList = await DayCareService.getDayCareServicesList();
      print("daycare list " + servicesList.length.toString());
    } finally {
      dayServicesLoadingFlag.value = false;
    }
  }

  void postEventBooking(OrderModel payloadObj) async {
    eventBookingLoadingFlag.value = true;
    try {
      getOderList = await EventService.postBookingEvent(payloadObj);
    } finally {
      eventBookingLoadingFlag.value = false;
    }
  }

  void getGroomingServicesList() async {
    groomingServicesLoadingFlag.value = true;
    try {
      groomingServicesList = await DayCareService.getGroomingServicesList();

      print("groming list lenth " + groomingServicesList.length.toString());
    } finally {
      groomingServicesLoadingFlag.value = false;
    }
  }
}
