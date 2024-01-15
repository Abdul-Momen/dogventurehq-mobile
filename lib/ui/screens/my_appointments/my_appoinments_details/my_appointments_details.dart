import 'dart:ui';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/payment/payment.dart';
import 'package:dogventurehq/ui/screens/registration/registration.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/custom_bottom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_payment.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AppointmentsDetails extends StatefulWidget {
  static String routeName = '/vet_consultation';

  const AppointmentsDetails({Key? key}) : super(key: key);

  @override
  State<AppointmentsDetails> createState() => _AppointmentsDetailsState();
}

class _AppointmentsDetailsState extends State<AppointmentsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 920.h,
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Image.asset(
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: 300.h,
                                'assets/images/banner_consultaion.png',
                              ),
                            ),
                            addH(15.h),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Zabeel Day Care Center",
                                    style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontSize: 30.0.sp,
                                    ),
                                  ),
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting",
                                    style: TextStyle(
                                      color: HexColor("#B9B9B9"),
                                      fontFamily:
                                          ConstantStrings.kAppFontPoppins,
                                      fontSize: 16.0.sp,
                                    ),
                                  ),
                                  addH(10.h),
                                  CustomIconWithText(
                                      address:
                                          '56 3 B St - Al QuozAl Quoz 1 - Dubai 27 km.'),
                                  addH(10.h),
                                  CustomRichText(
                                    text: 'AED',
                                    textRich: 'b440',
                                    textRichColor: "#F98C10",
                                    textRichSize: 34.sp,
                                    textSize: 22.sp,
                                  ),
                                  addH(20.h),
                                  Text(
                                    "Reshedule",
                                    style: TextStyle(
                                      fontFamily:
                                          ConstantStrings.kAppFontPoppins,
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  addH(15.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Select Date",
                                          style: TextStyle(
                                            fontFamily: ConstantStrings
                                                .kAppFontPoppins,
                                            fontSize: 18.0.sp,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Select Time",
                                          style: TextStyle(
                                            fontFamily: ConstantStrings
                                                .kAppFontPoppins,
                                            fontSize: 18.0.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  addH(10.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: null,
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                width: 1.0,
                                                color: Colors.black54),
                                            minimumSize: Size.fromHeight(50),
                                          ),
                                          child: const Text(
                                            'Select Date',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      addW(20.w),
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: null,
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                width: 1.0,
                                                color: Colors.black54),
                                            minimumSize: Size.fromHeight(50),
                                          ),
                                          child: const Text(
                                            'Select Time',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  addH(15.h),
                                  Card(
                                    child: SizedBox(
                                      height: 50.h,
                                      width: 150.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 16.0,
                                            child: ClipRRect(
                                              child: Image.asset(
                                                  'assets/images/circular_img.png'),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                          addW(10.w),
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 16.0,
                                            child: ClipRRect(
                                              child: Image.asset(
                                                  'assets/images/animal_img.png'),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                          addW(10.w),
                                          Text(
                                            "Alex",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addH(10.h),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomPaymentItem(totalPrice: 10,),
                            ),
                            CustomBottomBtn(rightBtnTxt: 'Update  Now', lftBtnTxt: 'Cancel Schedule', lftBtnFn: () {  }, rightBtnFn: () {  },),
                            addH(30.h),
                          ],
                        ),
                      ],
                    ),
                    CustomTitlebar(
                      title: 'my appointments Details',
                      img_bg: 'assets/images/day_care_bg.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
