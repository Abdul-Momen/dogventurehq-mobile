import 'package:dogventurehq/states/models/add_address_model.dart';
import 'package:dogventurehq/states/models/city_model.dart';
import 'package:dogventurehq/states/models/country_model.dart';
import 'package:dogventurehq/states/models/customer_address_model.dart';

import 'package:dogventurehq/states/models/state_model.dart';
import 'package:dogventurehq/states/services/address_services.dart';

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

class AddressController extends GetxController {
  RxBool countryListLoadingFlag = true.obs;
  RxBool stateListLoadingFlag = true.obs;
  RxBool cityListLoadingFlag = true.obs;

  RxBool addressDeleteLoadingFlag = true.obs;
  RxBool addAddressLoadingFlag = true.obs;
  RxBool updateAddressLoadingFlag = true.obs;
  RxBool deliveryAddressListLoadingFlag = true.obs;

  List<CustomerAddressModel> deliveryAddressList = <CustomerAddressModel>[].obs;
  List<CountryModel> countryList = <CountryModel>[].obs;
  List<StateModel> stateList = <StateModel>[].obs;
  List<CityModel> cityList = <CityModel>[].obs;

  AddAddressModel? addAddressObj;
  AddAddressModel? updateAddressObj;

  String? deleteResponse;

  var isLoading = false.obs;
  var imageURL = '';

  @override
  void onInit() {
    super.onInit();
    getDeliveryAddressList();
  }

  void getDeliveryAddressList() async {
    deliveryAddressListLoadingFlag.value = true;
    try {
      deliveryAddressList.clear();
      deliveryAddressList = await AddressService.getDeliveryAddressList();
      if (kDebugMode) {
        print('cartList: ${deliveryAddressList.length}');
      }
    } finally {
      deliveryAddressListLoadingFlag.value = false;
      //isFeatureFavoriteLoadingFlag.value=false;

    }
  }

  void getCountryList() async {
    countryListLoadingFlag.value = true;
    try {
      countryList = await AddressService.getCountryList();
    } finally {
      countryListLoadingFlag.value = false;
    }
  }

  void getStateList(int id) async {
    stateListLoadingFlag.value = true;
    try {
      stateList = await AddressService.getStateList(id);
    } finally {
      stateListLoadingFlag.value = false;
    }
  }

  void getCityList(int id) async {
    cityListLoadingFlag.value = true;
    try {
      cityList = await AddressService.getCityList(id);
    } finally {
      cityListLoadingFlag.value = false;
    }
  }

  void addAddress(AddAddressModel payloadObj) async {
    addAddressLoadingFlag.value = true;
    try {
      addAddressObj = await AddressService.addAddress(payloadObj);
      if (kDebugMode) {
        print('uploade Response Model: ${payloadObj.toJson()}');
      }
    } finally {
      addAddressLoadingFlag.value = false;
      //addPetLoadingFlag.value = false;
    }
  }

  void updateAddress(AddAddressModel payloadObj) async {
    updateAddressLoadingFlag.value = true;
    try {
      updateAddressObj = await AddressService.updateAddress(payloadObj);
      if (kDebugMode) {
        print('uploade Response Model: ${payloadObj.toJson()}');
      }
    } finally {
      updateAddressLoadingFlag.value = false;
      //addPetLoadingFlag.value = false;
    }
  }

  void addressDelete(int id) async {
    addressDeleteLoadingFlag.value = true;
    try {
      deleteResponse = await AddressService.deleteAddress(id);
    } finally {
      addressDeleteLoadingFlag.value = false;
    }
  }
}
