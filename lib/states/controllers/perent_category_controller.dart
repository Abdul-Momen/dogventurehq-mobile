import 'package:dogventurehq/states/models/parent_category.dart';

import 'package:dogventurehq/states/services/parent_category_services.dart';
import 'package:get/get.dart';

class ParentCategoryController extends GetxController {
  RxBool parentCategoryLoadingFlag = true.obs;
  List<ParentCategory> parentCategoryList = <ParentCategory>[].obs;
  List<ParentCategory> filterCategoryList = <ParentCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    getParentCategory();
  }

  void getParentCategory() async {
    parentCategoryLoadingFlag.value = true;
    try {
      parentCategoryList = await ParentCategoryService.getParentCategory();

      //filter list
      filterCategoryList =
          parentCategoryList.where((i) => i.isService == false).toList();
    } finally {
      parentCategoryLoadingFlag.value = false;
    }
  }
}
