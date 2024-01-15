import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PackageRowItem extends StatelessWidget {
  final String img;
  final String text;
  final String color;

  const PackageRowItem({
    Key? key,
    required this.img,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          img,
          height: 30.h,
        ),
        addH(5.h),
        Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: ConstantStrings.kAppFontPoppins,
              fontSize: 12.sp,
            ),
          ),
        )
      ],
    );
  }
}
