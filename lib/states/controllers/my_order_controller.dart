import 'package:dogventurehq/states/models/my_events_model.dart';

import 'package:dogventurehq/states/services/my_appointments_services.dart';

import 'package:dogventurehq/states/services/my_order_services.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  RxBool myCurrentOrderLoadingFlag = true.obs;
  RxBool myPreviousOrderLoadingFlag = true.obs;
  RxBool myCancelOrderLoadingFlag = true.obs;
  RxBool myOrderLoadingFlag = true.obs;
  RxBool deleteOrderLoadingFlag = true.obs;

  var myCurrentOrderList = <MyEventsModel>[].obs;
  var myPreviousOrderList = <MyEventsModel>[].obs;
  var myCancelOrderList = <MyEventsModel>[].obs;

  String? deleteResponse;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyCurrentOrderList();
    getMyPreviousOrderList();
    getMyCancelOrderList();
  }

  void getMyCurrentOrderList() async {
    myCurrentOrderLoadingFlag.value = true;
    try {
      myCurrentOrderList.value = await MyOrderService.getMyCurrentOrderList();
    } finally {
      myCurrentOrderLoadingFlag.value = false;
    }
  }

  void getMyPreviousOrderList() async {
    myPreviousOrderLoadingFlag.value = true;
    try {
      myPreviousOrderList.value = await MyOrderService.getMyPreviousOrderList();
    } finally {
      myPreviousOrderLoadingFlag.value = false;
    }
  }

  void getMyCancelOrderList() async {
    myCancelOrderLoadingFlag.value = true;
    try {
      myCancelOrderList.value = await MyOrderService.getMyCancelOrderList();
    } finally {
      myCancelOrderLoadingFlag.value = false;
    }
  }

  void deleteOrder(int invoicedId) async {
    deleteOrderLoadingFlag.value = true;
    try {
      deleteResponse = await MyAppointmentService.deleteAppointment(invoicedId);
      // print('Response Model: $deleteResponse');
    } finally {
      deleteOrderLoadingFlag.value = false;
    }
  }
}
