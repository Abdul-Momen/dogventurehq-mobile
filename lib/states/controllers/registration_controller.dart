import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/states/models/payment_info.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/models/registration_model.dart';
import 'package:dogventurehq/states/models/rooms_model.dart';

import 'package:dogventurehq/states/services/registration_services.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  RxString selectDate = ''.obs;
  RxString checkOutDate = ''.obs;
  RxString selectTime = ''.obs;
  RxString countryCode = ''.obs;
  RxString selectPetName = 'Select-Pet'.obs;
  RxString selectPetImage = ''.obs;
  RxBool oPaymentLoading = true.obs;
  var petId = RxInt(1);

  RxBool petLoadingFlag = true.obs;
  RxBool roomsLoading = true.obs;
  RxBool registrationLoadingFlag = true.obs;

  var petList = <PetModel>[].obs;
  var roomList = <RoomsModel>[].obs;
  RegistrationModel? registrationModel;

  List<int> customerIds = List.empty(growable: true);
  List<int> selectPetList = List.empty(growable: true);

  PaymentInfoModel? pInfoModel;

  int counter = 1;

  @override
  void onInit() {
    getPetList();
    getAllRooms();
    super.onInit();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  void getPetList() async {
    petLoadingFlag.value = true;
    try {
      petList.value = await RegistrationService.getPets();
    } finally {
      petLoadingFlag.value = false;
    }
  }

  void getOrderPayment({
    required int cID,
    required double totalAmount,
    required String fromPage,
  }) async {
    oPaymentLoading(true);
    try {
      var response = await RegistrationService.orderPayment(
        cID: cID,
        totalAmount: totalAmount,
        fromPage: fromPage,
      );
      pInfoModel = paymentInfoModelFromJson(response);
    } finally {
      oPaymentLoading(false);
    }
  }

  Future<bool> getPamymentStatus({
    required String reference,
    required String token,
  }) async {
    AllMethods.showLoading();
    try {
      var response = await RegistrationService.paymentChecking(
        ref: reference,
        tkn: token,
      );
      if (response.contains('Faild')) {
        return false;
      } else {
        return true;
      }
    } finally {
      AllMethods.hideLoading();
    }
  }

  void getAllRooms() async {
    roomsLoading.value = true;
    try {
      roomList.value = await RegistrationService.allRooms();
    } finally {
      roomsLoading.value = false;
    }
  }

  void userRegistration({
    required List<RegistrationModel> rModels,
    required bool isFirstTime,
  }) async {
    // print(rModels.length);
    registrationLoadingFlag.value = true;
    try {
      if (isFirstTime) {
        counter = 1;
        customerIds.clear();
        registrationModel =
            await RegistrationService.userRegistration(rModels[0]);
      } else {
        registrationModel =
            await RegistrationService.userRegistration(rModels[counter++]);
      }
      //print('Response Model: ${registrationModel!.toJson()}');
      if (registrationModel != null) {
        //  print("Customer ID: ${registrationModel!.customerId}");
        customerIds.add(registrationModel!.customerId!);
      }
    } finally {
      if (counter == rModels.length) {
        // print(rModels.length);
        // print("Counter value is: $counter");
        registrationLoadingFlag.value = false;
        //  print("Setting flag value: ${registrationLoadingFlag.value}");
        return;
      }
      // print("Counter value: $counter");
      // print(rModels.length);
      // print("Calling userReg. Fn again");
      if (counter < rModels.length) {
        userRegistration(
          rModels: rModels,
          isFirstTime: false,
        );
      }
    }
  }
}
