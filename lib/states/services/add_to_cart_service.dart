import '../../constants/strings.dart';
import '../models/cartRequestModel.dart';
import 'base_client.dart';

class AddToCartService {

  static Future<CartRequestModel> addToCart(CartRequestModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kAddToCartApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    CartRequestModel obj = cartRequestModelFromJson(response.toString());
    print('cart test ');
    print(obj);
    return obj;
  }

  static Future<CartRequestModel> removeAllFromCart(CartRequestModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kRemoveAllFromCartApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');
    CartRequestModel obj = cartRequestModelFromJson(response.toString());
    print('cart test ');
    print(obj);
    return obj;
  }

  static Future removeFromCart(int id) async {
    var response = await BaseClient().get(
      "${ConstantStrings.kRemoveFromCartApi}$id"
    );
    return response;
  }

}