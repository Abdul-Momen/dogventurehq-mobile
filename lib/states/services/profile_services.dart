import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/user_profile_update_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class ProfileService {
  static Future<UserProfileUpdateModel> userProfileUpdate(
      UserProfileUpdateModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kUserProfileUpdateApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    UserProfileUpdateModel obj =
        userProfileUpdateModelFromJson(response.toString());
    return obj;
  }

  static Future<dynamic> uploadFile(
    filePath, {
    required int cId,
  }) async {
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

  static Future<dynamic> uploadFileForPet(
    filePath,
    fileMedicalPath, {
    required int cId,
  }) async {
    //jwt authentication token
    // var authToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbTEyM0BnbWFpbC5jb20iLCJzdWIiOiI2MDViOTgxZDRkOTk4YjMxMjRhODEyMDQiLCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTgyMzQ4NjUsImV4cCI6MTYxODMyMTI2NX0.lYUfZ20TlFZZQO_1JKZbKYZublPRoejqnmxKOAM9CN0';

    //user im use to upload image
    //Note: this authToken and user id parameter will depend on my backend api structure
    //in your case it can be only auth token
    // var _userId = '605b981d4d998b3124a81204';
    try {
      FormData formData = FormData.fromMap({
        "profileId": cId,
        "image": await MultipartFile.fromFile(filePath, filename: "dp"),
        "MedicalBook": await MultipartFile.fromFile(fileMedicalPath,
            filename: "medicalBook"),
      });

      var response = await Dio().post(
          ConstantStrings.kBaseUrl + ConstantStrings.kPetMedicalImageUploadApi,
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
}
