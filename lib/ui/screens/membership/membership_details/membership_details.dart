import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class MembershipDetailsPage extends StatelessWidget {

  final String img;
  const MembershipDetailsPage({Key? key, required this.img}) : super(key: key);

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
        title: const CustomTitlebar(
            title: "Membership Details",
            img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            addH(20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Image.asset(
                img,
                width: double.infinity.w,
                height: 160.h,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                  CustomIconWithText(
                    address: 'Lorem ipsum dolor sit Ectetur',
                    logo: 'assets/svg/done.svg',
                    fontSize: 18.sp,
                  ),
                  addH(10.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
