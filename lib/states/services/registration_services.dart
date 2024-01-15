import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/models/registration_model.dart';
import 'package:dogventurehq/states/models/rooms_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class RegistrationService {
  static Future<List<PetModel>> getPets() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kPetsApi}${Preference.getUserId()}',
    );
    List<PetModel> obj = petModelFromJson(response.toString());
    return obj;
  }

  static Future<List<RoomsModel>> allRooms() async {
    var response = await BaseClient().get(
      ConstantStrings.kAllRooms,
    );
    List<RoomsModel> obj = roomsModelFromJson(response.toString());
    return obj;
  }

  static Future<dynamic> orderPayment({
    required int cID,
    required double totalAmount,
    required String fromPage,
  }) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kOrderPayment}$cID&TotalAmount=$totalAmount&FromPage=$fromPage',
    );
    return response;
  }

  static Future<dynamic> paymentChecking({
    required String ref,
    required String tkn,
  }) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kPaymentStatus}$ref&token=$tkn',
    );
    return response;
  }

  static Future<RegistrationModel> userRegistration(payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kRegistrationApi,
      payloadObj.toJson(),
    );

    RegistrationModel obj = registrationModelFromJson(response.toString());
    return obj;
  }
}
