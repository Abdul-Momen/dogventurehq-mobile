import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/helper.dart';

class RowContactImg extends StatelessWidget {
  final String imgLeft;
  final String imgRight;
  String? leftIcon;
  String? leftTitle;
  String? leftSubTitle;

  String? rightIcon;
  String? rightTitle;
  String? rightSubTitle;

  VoidCallback? leftImgFn;
  VoidCallback? rightImgFn;
  double? imgHight;

  RowContactImg({
    Key? key,
    required this.imgLeft,
    required this.imgRight,
    this.imgHight,
    this.leftImgFn,
    this.leftTitle,
    this.leftSubTitle,
    this.rightIcon,
    this.rightTitle,
    this.rightSubTitle,
    this.rightImgFn,
    this.leftIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: rightImgFn,
            child: Stack(
              children: [
                Image.asset(
                  imgRight,
                  width: 170.w,
                  height: imgHight ?? 100.h,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 15,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            leftIcon??'',
                            width: 20.w,
                            height: imgHight ?? 30.h,
                          ),
                          addW(10.w),
                          Text(
                            leftTitle??'',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: ConstantStrings.kAppFont,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                          leftSubTitle??'',style: TextStyle(
                        color: Colors.white,
                          fontFamily: ConstantStrings.kAppFontPoppins,
                          fontSize: 12.sp
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
          addW(10.w),
          InkWell(
            onTap: leftImgFn,
            child: Stack(
              children: [
                Image.asset(
                  imgLeft,
                  width: 170.w,
                  height: imgHight ?? 100.h,
                  fit: BoxFit.fill,
                ),

                Positioned(
                  top: 15,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            rightIcon??'',
                            width: 20.w,
                            height: imgHight ?? 30.h,
                          ),
                          addW(10.w),
                          Text(
                            rightTitle??'',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: ConstantStrings.kAppFont,

                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        rightSubTitle??'',style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp
                      ),),
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
