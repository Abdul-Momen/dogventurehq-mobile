import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomIconWithText extends StatelessWidget {
  final String address;
  final String? logo;
  final double? fontSize;
  final double? logoSize;

  const CustomIconWithText({
    Key? key,
    required this.address, this.logo, this.fontSize, this.logoSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          logo??'assets/svg/location.svg',
          height: logoSize,
        ),
        addW(10.w),
        Text(
          address,
          style: TextStyle(
              color: HexColor('#B9B9B9'),
              fontFamily: ConstantStrings.kAppFontPoppins,
              fontSize:fontSize??11.0.sp,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
