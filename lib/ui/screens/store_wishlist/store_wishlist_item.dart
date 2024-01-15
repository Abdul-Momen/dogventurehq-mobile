import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/states/models/product_model.dart';
import 'package:dogventurehq/states/models/store_wishlist_model.dart';
import 'package:dogventurehq/ui/screens/events_details/events_details.dart';
import 'package:dogventurehq/ui/screens/store/store_details/store_details.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_rech_text.dart';

class StoreWishListItem extends StatefulWidget {
  StoreWishListModel model;

  StoreWishListItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<StoreWishListItem> createState() => _StoreWishListItemState();
}

class _StoreWishListItemState extends State<StoreWishListItem> {
  String? startDate;

  String? startTime;

  @override
  Widget build(BuildContext context) {
    // var dateTimeString = model.startDate;
    // final time = DateTime.parse(dateTimeString);
    //
    // final format = DateFormat('HH:mm a');
    // startTime = format.format(time);
    //
    // var outputFormat = DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY);
    // startDate = outputFormat.format(time);
    // return Card(
    //   child: Column(
    //     children: [
    //       addH(10.h),
    //       Row(
    //         children: [
    //           Center(
    //             child: SizedBox(
    //                 height: 100.h,
    //                 width: 100.w, // fixed width and height
    //                 child: CustomImageNetwork(
    //                   imageUrl: ConstantStrings.kBaseUrl+"/"+widget.model.smallImage,
    //                 )),
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   // Container(
    //                   //   decoration: BoxDecoration(
    //                   //     borderRadius: BorderRadius.circular(10.0),
    //                   //     color: Colors.red,
    //                   //   ),
    //                   //   height: 30.h,
    //                   //   width: 50.w,
    //                   //   child: Row(
    //                   //     mainAxisAlignment: MainAxisAlignment.center,
    //                   //     children: [
    //                   //       addW(5.w),
    //                   //       Flexible(
    //                   //         child: Text(
    //                   //           '20% off',
    //                   //           style:
    //                   //               TextStyle(fontSize: 12.sp, color: Colors.white),
    //                   //         ),
    //                   //       ),
    //                   //     ],
    //                   //   ),
    //                   // ),
    //                   SizedBox(
    //                     height: 30.h,
    //                     width: 50.w,
    //                     child: Row(
    //                       children: [
    //                         Icon(
    //                           Icons.star,
    //                           color: Colors.yellow,
    //                         ),
    //                         Text('4.5'),
    //                       ],
    //                     ),
    //                   ),
    //                   Icon(Icons.favorite_border_outlined),
    //                 ],
    //               ),
    //               Text(
    //                 widget.model.productName,
    //                 style: TextStyle(
    //                   fontFamily: ConstantStrings.kAppFontPoppins,
    //                   fontSize: 10.0.sp,
    //                 ),
    //               ),
    //               Text(
    //                 "1.2kg Pack",
    //                 style: TextStyle(
    //                   color: HexColor("#838383"),
    //                   fontFamily: ConstantStrings.kAppFontPoppins,
    //                   fontSize: 9.0.sp,
    //                 ),
    //               ),
    //               SizedBox(
    //                   width: 100.w,
    //                   child: CustomRichText(
    //                     text: '',
    //                     textRich: '  ' + widget.model.price.toString(),
    //                     textRichColor: '#155D84',
    //                   )),
    //               Center(
    //                 child: CustomBtn(
    //                   btnFn: () {
    //                     Get.toNamed(StoreDetails.routeName,
    //                         arguments: widget.model.productMasterId);
    //                   },
    //                   btnText: 'View Details',
    //                   btnBgClr: Colors.green,
    //                   btnSize: Size(160.w, 20.h),
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(

                  height: 150.h,
                  width: 150.w, // fixed width and height
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 120.h,
                        width: 120.w,
                        child: CustomImageNetwork(
                          imageUrl: ConstantStrings.kBaseUrl +
                              "/" +
                              widget.model.smallImage,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.productName,
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                        fontSize: 20.0.sp,

                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 50.w,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text('4.5'),
                        ],
                      ),
                    ),

                    Text(
                      "1.2kg Pack",
                      style: TextStyle(
                        color: HexColor("#838383"),
                        fontFamily: ConstantStrings.kAppFontPoppins,
                        fontSize: 9.0.sp,
                      ),
                    ),
                    SizedBox(
                        width: 100.w,
                        child: CustomRichText(
                          text: '',
                          textRich: '  ' + widget.model.productPrice.toString(),
                          textRichColor: '#155D84',
                        )),
                    Center(
                      child: CustomBtn(
                        btnFn: () {
                          Get.toNamed(StoreDetails.routeName,
                              arguments: widget.model.productMasterId);
                        },
                        btnText: 'View Details',
                        btnBgClr: Colors.green,
                        btnSize: Size(160.w, 20.h),
                      ),
                    ),

                  ],
                ),

              )),
          Expanded(
            flex: 1,
            child: Container(
              height: 90.h,
              width: 70.w,
              child: InkWell(
                onTap: () {
                  Get.snackbar('title', 'test');
                },
                child: SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
