import 'package:dogventurehq/states/services/home.dart';
import 'package:get/get.dart';

import '../models/banners_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;

  RxBool bannerListLoadingFlag = true.obs;
  List<BannersModel> bannerList = <BannersModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBannerList();
  }

  void getBannerList() async {
    bannerListLoadingFlag.value = true;
    try {
      bannerList = await HomeService.getBanners();
    } finally {
      bannerListLoadingFlag.value = false;
    }
  }

}
