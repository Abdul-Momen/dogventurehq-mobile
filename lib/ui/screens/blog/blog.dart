import 'package:dogventurehq/ui/screens/blog/blog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../states/controllers/blog_controller.dart';
import '../../../states/methods/all_methods.dart';
import '../../widgets/custom_titlebar.dart';

class MyBlog extends StatefulWidget {
  static String routeName = '/blog';

  const MyBlog({Key? key}) : super(key: key);

  @override
  State<MyBlog> createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlog> {
  // final BlogController _blogController= Get.find<BlogController>();
  final BlogController _blogController= Get.put(BlogController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _blogController.getBlogList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#f5b342"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: CustomTitlebar(
            title: "Blog", img_bg:AllMethods.changeAppbarImage(3)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx((){
            if(_blogController.blogLoadingFlag.value){
              return Center(child: CircularProgressIndicator());
            }
            else{
              if(_blogController.blogList.isEmpty){
                return Text('data is empty');
              }else{
                return SizedBox(
                  width: double.infinity.w,
                  height: 759.h,
                  child:
                  ListView.builder(
                    itemCount: _blogController.blogList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BlogItem(model: _blogController.blogList[index],);
                    },
                  ),
                );
              }
            }
          })

        ],
      ),
    );
  }
}
