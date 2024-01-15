import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/blog_model.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/html_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../../../states/controllers/blog_controller.dart';
import '../../../../states/methods/all_methods.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_titlebar.dart';

class BlogDetailsPage extends StatefulWidget {
  static String routeName = '/blogdetails';
  final BlogModel model;

  const BlogDetailsPage({Key? key, required this.model}) : super(key: key);

  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  final BlogController _blogController = Get.put(BlogController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //  dateTime = DateFormat("MM/dd/yyyy hh:mm a").format( _blogController.blogDetails!.publishDate);
  }

  @override
  Widget build(BuildContext context) {
    String dateTime =
        DateFormat("MM/dd/yyyy hh:mm a").format(widget.model.publishDate);

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
            title: "Blog Details", img_bg: AllMethods.changeAppbarImage(3)),
      ),
      body: Card(
        child: SizedBox(
          height: double.infinity.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200.w,
                        child: Text(
                          widget.model.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: ConstantStrings.kAppFontPoppins,
                              fontSize: 14.sp,
                              color: Colors.deepOrangeAccent),
                        ),
                      ),
                      addH(5.h),
                      Text(
                        widget.model.subTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: ConstantStrings.kAppFont,
                          fontSize: 20.sp,
                        ),
                      ),
                      addH(5.h),
                      Text(
                        widget.model.smallDetails,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: ConstantStrings.kAppFontPoppins,
                          fontSize: 14.sp,
                        ),
                      ),

                      Text(
                      'By - Admin',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: ConstantStrings.kAppFontPoppins,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250.h,
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250.h,
                        child: CustomImageNetwork(
                          imageUrl: widget.model.mediumImage,
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        right: 20.w,
                        child: Container(
                          height: 30.h,
                          width: 140.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green)),
                          child: Container(
                            color: HexColor('#F0FAFF'),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dateTime,
                                  style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 16.0.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                addH(10.h),
                CustomHtmlText(text: widget.model.bigDetails),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
