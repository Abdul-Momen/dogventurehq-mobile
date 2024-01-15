import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/customer_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class CreateAccountService {

  static Future<CustomerModel> createAccount(CustomerModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kRegistrationApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    CustomerModel obj = customerModelFromJson(response.toString());
    return obj;
  }

}
