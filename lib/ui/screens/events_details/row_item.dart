import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class RowItem extends StatelessWidget {
  final String title;
  final String? subtitle;
   String? iconColor;
  final String svgIcon;

  RowItem({
    Key? key,
    required this.title,
     this.subtitle,
    required this.svgIcon,
     this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 20.h,
            height: 20.w,
            child: SvgPicture.asset(
              svgIcon,
              height: 15.h,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: ConstantStrings.kAppFont,
                fontSize: 20.0.sp,
              ),
            ),
            SizedBox(
              width: 150.w,
              child: Text(
                subtitle!,
                style: TextStyle(
                  fontFamily: ConstantStrings.kAppFontPoppins,
                  fontSize: 15.0.sp,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
