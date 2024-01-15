import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RowImg extends StatelessWidget {
  final String imgLeft;
  final String imgRight;
  final String? imgAnimal;
  final String? imgRightAnimal;
  final String? imgLeftBtnTxt;
  final String? imgRightBtnTxt;
  final String? imgServicesName;
  final String? imgRightServicesName;
  final String? imgTopName;
  VoidCallback? leftImgFn;
  VoidCallback? rightImgFn;
  double? imgHight;

  RowImg({
    Key? key,
    required this.imgLeft,
    required this.imgRight,
    this.imgHight,
    this.leftImgFn,
    this.rightImgFn,
    this.imgAnimal,
    this.imgTopName,
    required this.imgServicesName,
    this.imgRightServicesName,
    this.imgRightAnimal,
    this.imgLeftBtnTxt,
    this.imgRightBtnTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: leftImgFn,
            child: Container(
              width: 187.w,
              height: imgHight ?? 160.h,
              child: Stack(
                children: [
                  Image.asset(
                    width: 187.w,
                    height: imgHight ?? 160.h,
                    imgLeft,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 20.h,
                    left: 20.w,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                height: 80.h,
                                width: 80.w,
                                imgAnimal!,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                imgServicesName!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 28.0.sp,
                                ),
                              ),
                            ],
                          ),
                          addH(5.h),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 20.w,
                    child: Container(
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Text(
                              imgLeftBtnTxt ?? 'Contact Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: ConstantStrings.kAppFont,
                                fontSize: 20.0.sp,
                              ),
                            ),
                          ),
                          // child: CustomBtn(
                          //     btnFn: () {},
                          //     btnText: imgLeftBtnTxt??'Whatsapp',
                          //     txtColor: Colors.black,
                          //     btnSize: Size(90.w, 20.h),
                          //     textFontFamily: ConstantStrings.kAppFont,
                          //
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          addW(10.w),
          InkWell(
            onTap: rightImgFn,
            child: Container(
              width: 187.w,
              height: imgHight ?? 160.h,
              child: Stack(
                children: [
                  Image.asset(
                    width: 187.w,
                    height: imgHight ?? 160.h,
                    imgRight,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 20.h,
                    left: 20.w,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                height: 80.h,
                                width: 80.w,
                                imgRightAnimal!,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                imgRightServicesName!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 28.0.sp,
                                ),
                              ),

                            ],
                          ),
                          addH(5.h),


                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 20.w,
                    child: Container(
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Text(
                              imgRightBtnTxt ?? 'Contact Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: ConstantStrings.kAppFont,
                                fontSize: 20.0.sp,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
