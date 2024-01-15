import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/add_address_model.dart';
import 'package:dogventurehq/states/models/add_pet_model.dart';
import 'package:dogventurehq/states/models/city_model.dart';
import 'package:dogventurehq/states/models/country_model.dart';
import 'package:dogventurehq/states/models/customer_address_model.dart';
import 'package:dogventurehq/states/models/pet_breed_model.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/models/pet_type_model.dart';
import 'package:dogventurehq/states/models/state_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:http/http.dart' as http;

class AddressService {
  static Future<List<CustomerAddressModel>> getDeliveryAddressList() async {
    var response = await BaseClient().get(
        '${ConstantStrings.kGetDeliveryAddressApi}${Preference.getUserId()}');
    List<CustomerAddressModel> obj =
        customerAddressModelFromJson(response.toString());
    print('obj: ${obj.length}');
    return obj;
  }

  static Future<String> deleteAddress(int id) async {
    var response =
        await BaseClient().post('${ConstantStrings.kDeleteAddressApi}$id', '');
    String obj = response.toString();
    return obj;
  }

  static Future<List<CountryModel>> getCountryList() async {
    var response = await BaseClient().get(
      ConstantStrings.kCountryListAddressApi,
    );
    List<CountryModel> obj = countryModelFromJson(response.toString());
    return obj;
  }

  static Future<List<StateModel>> getStateList(int id) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kStateListAddressApi}$id',
    );
    List<StateModel> obj = stateModelFromJson(response.toString());
    return obj;
  }

  static Future<List<CityModel>> getCityList(int id) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kCityListAddressApi}$id',
    );
    List<CityModel> obj = cityModelFromJson(response.toString());
    return obj;
  }

  static Future<AddAddressModel> addAddress(AddAddressModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kAddAddressApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    AddAddressModel obj = addAddressModelFromJson(response.toString());
    return obj;
  }

  static Future<AddAddressModel> updateAddress(
      AddAddressModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kUpdateAddressApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    AddAddressModel obj = addAddressModelFromJson(response.toString());
    return obj;
  }

  static Future<AddPetModel> updatePet(AddPetModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kUpdatePetApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    AddPetModel obj = addPetModelFromJson(response.toString());
    return obj;
  }
}
