import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeetTeamItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String img;

  const MeetTeamItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Container(
        height: 300.h,
        width: 160.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.w,
              height: 140.h,
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
            ),
            addH(5.h),
            Text(
              title,
              style: TextStyle(
                fontFamily: ConstantStrings.kAppFont,
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            addH(5.h),
            Text(
              subTitle,
              style: TextStyle(
                fontFamily: ConstantStrings.kAppFontPoppins,
                fontSize: 10.0.sp,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
              maxLines: 8,
            ),
          ],
        ),
      ),
    );
  }
}
