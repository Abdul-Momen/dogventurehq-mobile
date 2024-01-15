import 'package:dogventurehq/states/models/user_profile_update_model.dart';

import 'package:dogventurehq/states/services/profile_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/prefs.dart';

class ProfileController extends GetxController {
  RxBool profileUpdateLoadingFlag = true.obs;

  UserProfileUpdateModel? profileUpdate;

  var isLoading = false.obs;
  var imageURL = '';

  void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().getImage(source: imageSource);
      isLoading(true);
      if (pickedFile != null) {
        var response = await ProfileService.uploadFile(pickedFile.path,
            cId: Preference.getUserId());

        if (response.statusCode == 200) {
          //get image url from api response
          imageURL = response.data['image'];
          Preference.setUserImageFlag(imageURL.toString());

          Get.snackbar('Success', 'Image uploaded successfully',
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
        } else if (response.statusCode == 401) {
          Get.offAllNamed('/sign_up');
        } else {
          Get.snackbar('Failed', 'Error Code: ${response.statusCode}',
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
        }
      } else {
        Get.snackbar('Failed', 'Image not selected',
            margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
      }
    } finally {
      isLoading(false);
    }
  }

  void userProfileUpdate(UserProfileUpdateModel payloadObj) async {
    profileUpdateLoadingFlag.value = true;
    try {
      profileUpdate = await ProfileService.userProfileUpdate(payloadObj);
      if (kDebugMode) {
        print('uploade Response Model: ${payloadObj.toJson()}');
      }
    } finally {
      profileUpdateLoadingFlag.value = false;
    }
  }
}
