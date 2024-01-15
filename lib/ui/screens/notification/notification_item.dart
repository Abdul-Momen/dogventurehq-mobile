import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

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
                    flex: 1,
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      color: Colors.white,
                      child: Image.asset('assets/images/notification.png'),
                    ),
                  ),
                  addW(10.w),
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
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nbNullam venenatis aliquet interdum. Nullam..',
                              style: TextStyle(
                                color: HexColor('#838383'),
                                fontSize: 9.sp,
                                fontFamily: ConstantStrings.kAppFontPoppins,
                              ),
                            ),

                          ],
                        ),
                        addH(10.h),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        
                        Text('2 hr',style: TextStyle(
                          fontFamily:ConstantStrings.kAppFont
                        ),)

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
