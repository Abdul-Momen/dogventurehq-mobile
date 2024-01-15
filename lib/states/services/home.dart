import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/banners_model.dart';

import 'base_client.dart';

class HomeService {

  static Future<List<BannersModel>> getBanners() async {
    var response = await BaseClient().get(
        ConstantStrings.kBannerApi
    );
    List<BannersModel> obj = bannersModelFromJson(response.toString());
    return obj;
  }

}
