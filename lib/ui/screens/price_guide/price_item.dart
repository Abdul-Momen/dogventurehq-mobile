import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceItem extends StatelessWidget {
  final double? height;
  final double? width;
  final String txt;
  final Color? clr;
  final Color? tClr;

  const PriceItem({Key? key, required this.txt, this.height, this.clr, this.width, this.tClr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 42.h,
      width: width??80.w,
      color: clr ?? ConstantColors.kYClr,
      child:txt==""?Icon(Icons.check):Center(child: Text(
          txt,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: tClr??Colors.black,
            fontFamily: ConstantStrings.kAppFont,
          ),
        ),),
    );
  }
}
