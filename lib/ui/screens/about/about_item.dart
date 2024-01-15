import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutItem extends StatelessWidget {
  final String img;
  final String text;
  final String subText;

  const AboutItem({
    Key? key,
    required this.img,
    required this.text,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 170.h,
        width: 180.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            addH(10.h),
            Container(
                height: 70.h,
                width: 80.w,
                child: Image.asset(img)),
            addH(10.h),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.sp,
                    fontFamily: ConstantStrings.kAppFont),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
               subText,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontFamily: ConstantStrings.kAppFontPoppins),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
