import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      color: Colors.white,
                      child: Image.asset('assets/images/product_img.png'),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Suhana Achar Ghost Masala Mix',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: ConstantStrings.kAppFont,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '350 gm',
                              style: TextStyle(
                                  color: HexColor('#838383'),
                                  fontSize: 12.sp,
                                  fontFamily: ConstantStrings.kAppFontPoppins,
                                 ),
                            ),

                          ],
                        ),
                        addH(10.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.green),
                              ),
                              child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(fontSize: 10),
                                  )),
                            ),

                            Text(
                              ' X 2 kg  (8/Kg)',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: ConstantStrings.kAppFontPoppins,
                                  fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomRichText(
                          text: "AED",
                          textRich: " 10.30",
                          textRichSize: 18.sp,
                          textRichColor: "#155D84",
                          fontFamily: ConstantStrings.kAppFontPoppins,
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
