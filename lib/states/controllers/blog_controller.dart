import 'package:dogventurehq/states/models/blog_details_model.dart';
import 'package:dogventurehq/states/services/blog_services.dart';
import 'package:get/get.dart';
import '../models/blog_model.dart';

class BlogController extends GetxController {
  RxBool blogLoadingFlag = true.obs;
  RxBool blogDetailsLoadingFlag = true.obs;

  BlogDetailsModel? blogDetails;
  List<BlogModel> blogList = <BlogModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBlogList();
  }

  void getBlogDetails(String slug) async {
    blogDetailsLoadingFlag.value = true;
    try {
      blogDetails = await BlogService.getBlogDetails(slug);
    } finally {
      blogDetailsLoadingFlag.value = false;
    }
  }

  void getBlogList() async {
    blogLoadingFlag.value = true;
    try {
      blogList = await BlogService.getBlogList();
    } finally {
      blogLoadingFlag.value = false;
    }
  }
}
