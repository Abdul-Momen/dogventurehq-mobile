import 'dart:io';

import 'package:dogventurehq/states/models/add_pet_model.dart';

import 'package:dogventurehq/states/models/pet_breed_model.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/models/pet_type_model.dart';

import 'package:dogventurehq/states/services/pet_services.dart';
import 'package:dogventurehq/states/services/profile_services.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPetController extends GetxController {
  RxBool petLoadingFlag = true.obs;
  RxBool petTypeLoadingFlag = true.obs;
  RxBool petBreedLoadingFlag = true.obs;
  RxBool petDeleteLoadingFlag = true.obs;
  RxBool addPetLoadingFlag = true.obs;
  RxBool updatePetLoadingFlag = true.obs;
  RxBool petProfileUploadLoadingFlag = true.obs;
  RxBool petMedicalBookUploadLoadingFlag = true.obs;

  List<PetModel> petList = <PetModel>[].obs;
  List<PetBreedModel> petBreedList = <PetBreedModel>[].obs;
  List<PetTypeModel> petTypeList = <PetTypeModel>[].obs;
  AddPetModel? addPetObj;
  AddPetModel? updatePetObj;

  String? deleteResponse;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPetList();
    getPetTypeList();
    getPetBreedList();
  }

  void getPetList() async {
    petLoadingFlag.value = true;
    try {
      petList = await PetService.getPets();
    } finally {
      petLoadingFlag.value = false;
    }
  }

  void getPetTypeList() async {
    petTypeLoadingFlag.value = true;
    try {
      petTypeList = await PetService.getPetTypeList();
    } finally {
      petTypeLoadingFlag.value = false;
    }
  }

  void getPetBreedList() async {
    petBreedLoadingFlag.value = true;
    try {
      petBreedList = await PetService.getPetBreedList();
    } finally {
      petBreedLoadingFlag.value = false;
    }
  }

  void addNewPet(
      AddPetModel payloadObj, File imageFile, File imageMedicalFile) async {
    addPetLoadingFlag.value = true;
    try {
      addPetObj = await PetService.addNewPet(payloadObj);
      if (kDebugMode) {
        print('uploade Response Model: ${payloadObj.toJson()}');
      }

      if (addPetObj != null) {
        //// for pet image upload
        var response = await ProfileService.uploadFileForPet(
            imageFile.path, imageMedicalFile.path,
            cId: addPetObj!.profileId);

        if (response.statusCode == 200) {
          // print('ressss');
          // print(response);
          //get image url from api response
          Get.snackbar('Success', 'Image uploaded successfully',
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
        } else if (response.statusCode == 401) {
          // Get.offAllNamed('/sign_up');
        } else {
          Get.snackbar('Failed', 'Error Code: ${response.statusCode}',
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
        }
      }
    } finally {
      addPetLoadingFlag.value = false;
      //addPetLoadingFlag.value = false;

    }
  }

  void updatePet(AddPetModel payloadObj) async {
    updatePetLoadingFlag.value = true;

    try {
      updatePetObj = await PetService.updatePet(payloadObj);
      if (kDebugMode) {
        print('uploade Response Model: ${payloadObj.toJson()}');
      }
    } finally {
      updatePetLoadingFlag.value = false;
      // addPetLoadingFlag.value = false;
    }
  }

  void getPetDelete(int id) async {
    petDeleteLoadingFlag.value = true;
    try {
      deleteResponse = await PetService.deletePet(id);
    } finally {
      petDeleteLoadingFlag.value = false;
    }
  }
}
