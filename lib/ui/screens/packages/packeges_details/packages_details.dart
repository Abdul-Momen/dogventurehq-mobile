import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/packages/packeges_details/package_card_drop_btn.dart';
import 'package:dogventurehq/ui/screens/payment/payment.dart';
import 'package:dogventurehq/ui/screens/registration/date_item.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_select_date.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../widgets/custom_titlebar.dart';

class PackageDetails extends StatelessWidget {
  const PackageDetails({Key? key}) : super(key: key);

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
            title: "Packages Details", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addH(20.h),
              Text(
                "Package 1",
                style: TextStyle(
                    fontSize: 33.sp, fontFamily: ConstantStrings.kAppFont),
              ),
              Text(
                "04 services",
                style: TextStyle(
                  fontSize: 17.sp,
                ),
              ),
              addH(20.h),
              Text(
                "Lorem Ipsum is simply dummy text of \n the printing and typesetting",
                style: TextStyle(fontSize: 15.sp, color: HexColor('#B9B9B9')),
              ),
              addH(20.h),
              PackageCardBtn(text: 'Indoor Dog Park',),
              addH(20.h),
              Text(
                "Zabeel Day Care Center",
                style: TextStyle(
                  fontFamily: ConstantStrings.kAppFont,
                  fontSize: 30.0,
                ),
              ),
              addH(7.h),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting",
                style: TextStyle(
                    color: HexColor("#B9B9B9"),
                    fontFamily: ConstantStrings
                        .kAppFontPoppins,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
              addH(10.h),
              CustomIconWithText(address: '56 3 B St - Al QuozAl Quoz 1 - Dubai 26 km.',logoSize: 20,fontSize: 15.sp,),
              addH(20.h),
              CustomSelectDate(),
              addH(10.h),
              const Text('Select Time:'),
              addH(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateItem(time: "07 AM - 08 AM", onTimeTap: (String value) {  },),
                  DateItem(time: "07 AM - 08 AM", onTimeTap: (String value) {  },),
                  DateItem(time: "07 AM - 08 AM", onTimeTap: (String value) {  },),
                ],
              ),
              addH(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateItem(time: "07 AM - 08 AM", onTimeTap: (String value) {  },),
                  DateItem(time: "07 AM - 08 AM", onTimeTap: (String value) {  },),
                  DateItem(time: "07 AM - 08 AM", onTimeTap: (String value) {  },),
                ],
              ),
              // password
              addH(10.h),
              // CustomCardItem(),
              addH(10.h),
              const PackageCardBtn(text: 'Guard Dog Training',),
              addH(10.h),
              const PackageCardBtn(text: 'Medical Bath',),
              addH(10.h),
              CustomBtn(
                btnSize: Size(388.w, 52.h),
                btnFn: () {
                  Get.toNamed(PaymentPage.routeName,arguments: 3);

                },
                btnText: 'Book Now',
                btnBgClr:  Colors.green.shade600 ,
              ),
              addH(20.h),

            ],
          ),
        ),
      ),
    );
  }
}
