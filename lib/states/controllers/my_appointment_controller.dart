import 'package:dogventurehq/states/models/activity_waiver_model.dart';
import 'package:dogventurehq/states/models/event_category_model.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/states/models/favorite_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/my_events_model.dart';
import 'package:dogventurehq/states/models/order_model.dart';
import 'package:dogventurehq/states/services/event_services.dart';
import 'package:dogventurehq/states/services/my_appointments_services.dart';
import 'package:dogventurehq/states/services/my_event_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyAppointmentController extends GetxController {

  RxBool myCurrentAppointmentLoadingFlag = true.obs;
  RxBool myPreviousAppointmentLoadingFlag = true.obs;
  RxBool myCancelAppointmentLoadingFlag = true.obs;
  RxBool myAppointmentLoadingFlag = true.obs;
  RxBool deleteAppointmentLoadingFlag = true.obs;

  var myCurrentAppointmentList = <MyEventsModel>[].obs;
  var myPreviousAppointmentList = <MyEventsModel>[].obs;
  var myCancelAppointmentList = <MyEventsModel>[].obs;


  String? deleteResponse;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyCurrentAppointmentList();
    getMyPreviousAppointmentList();
    getMyCancelAppointmentList();

  }

  void getMyCurrentAppointmentList() async {
    myCurrentAppointmentLoadingFlag.value = true;
    try {
      myCurrentAppointmentList.value=await MyAppointmentService.getMyCurrentAppointmentList();
    } finally {
      myCurrentAppointmentLoadingFlag.value = false;
    }
  }

  void getMyPreviousAppointmentList() async {
    myPreviousAppointmentLoadingFlag.value = true;
    try {
      myPreviousAppointmentList.value=await MyAppointmentService.getMyPreviousAppointmentList();
    } finally {
      myPreviousAppointmentLoadingFlag.value = false;
    }
  }

  void getMyCancelAppointmentList() async {
    myCancelAppointmentLoadingFlag.value = true;
    try {
      myCancelAppointmentList.value=await MyAppointmentService.getMyCancelAppointmentList();
    } finally {
      myCancelAppointmentLoadingFlag.value = false;
    }
  }

  void deleteAppointment(int invoicedId) async {
    deleteAppointmentLoadingFlag.value = true;
    try {
     deleteResponse = await MyAppointmentService.deleteAppointment(invoicedId);
      print('Response Model: $deleteResponse');
    } finally {
      deleteAppointmentLoadingFlag.value = false;
    }
  }

}
