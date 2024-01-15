import 'package:dogventurehq/states/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

import '../../../constants/strings.dart';
import '../../widgets/custom_image_network.dart';
import '../../widgets/helper.dart';
import 'blog_details/blog_details.dart';

class BlogItem extends StatelessWidget {
  final BlogModel model;
  const BlogItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dateTime = DateFormat("MM/dd/yyyy hh:mm a").format( model.publishDate);

    return InkWell(
      onTap:() {
        Get.to(BlogDetailsPage(model: model,));

      },
      child: Card(
        child: SizedBox(
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180.h,
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180.h,
                      child: CustomImageNetwork(
                        imageUrl:
                        model.mediumImage,
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
                                dateTime
                               ,
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    model.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFontPoppins,
                        fontSize: 14.sp,
                        color: Colors.deepOrangeAccent
                      ),
                    ),
                    addH(5.h),
                    Text(
                      model.subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                        fontSize: 20.sp,
                      ),
                    ),
                    addH(5.h),
                    Text(
                    model.smallDetails,
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
            ],
          ),
        ),
      ),
    );
  }
}
