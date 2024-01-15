import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/add_pet_model.dart';
import 'package:dogventurehq/states/models/pet_breed_model.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/models/pet_type_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:http/http.dart' as http;

class PetService {
  static Future<dynamic> uploadFile(filePath) async {
    //jwt authentication token
    // var authToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbTEyM0BnbWFpbC5jb20iLCJzdWIiOiI2MDViOTgxZDRkOTk4YjMxMjRhODEyMDQiLCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTgyMzQ4NjUsImV4cCI6MTYxODMyMTI2NX0.lYUfZ20TlFZZQO_1JKZbKYZublPRoejqnmxKOAM9CN0';

    //user im use to upload image
    //Note: this authToken and user id parameter will depend on my backend api structure
    //in your case it can be only auth token
    // var _userId = '605b981d4d998b3124a81204';
    try {
      FormData formData = new FormData.fromMap({
        "CustomerId": Preference.getUserId(),
        "image": await MultipartFile.fromFile(filePath, filename: "dp")
      });

      var response = await Dio().post(
          ConstantStrings.kBaseUrl + ConstantStrings.kUserProfilePicChangeApi,
          data: formData,
          options: Options(headers: <String, String>{
            'Authorization': 'Bearer /Token',
            'Content-Type': 'application/json; charset=UTF-8'
          }));
      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {}
  }

  static Future<String> deletePet(int id) async {
    var response =
        await BaseClient().get('${ConstantStrings.kDeletePetsApi}$id');
    String obj = response.toString();
    return obj;
  }

  static Future<List<PetModel>> getPets() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kPetsApi}${Preference.getUserId()}',
    );
    List<PetModel> obj = petModelFromJson(response.toString());
    return obj;
  }

  static Future<List<PetTypeModel>> getPetTypeList() async {
    var response = await BaseClient().get(
      ConstantStrings.kPetTypeApi,
    );
    List<PetTypeModel> obj = petTypeModelFromJson(response.toString());
    return obj;
  }

  static Future<List<PetBreedModel>> getPetBreedList() async {
    var response = await BaseClient().get(
      ConstantStrings.kPetBreedListApi,
    );
    List<PetBreedModel> obj = petBreedModelFromJson(response.toString());
    return obj;
  }

  //
  // static Future<String> deletePet(int id)async{
  //   var response =await BaseClient().deleteData(
  //       '${ConstantStrings.kDeletePetsApi}$id'
  //   );
  //   String obj= response.toString();
  //   return obj;
  //
  // }

  static Future<AddPetModel> addNewPet(AddPetModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kAddNewPetApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    AddPetModel obj = addPetModelFromJson(response.toString());
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
