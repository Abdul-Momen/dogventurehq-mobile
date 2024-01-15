import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCalenderField extends StatelessWidget {
  final String hintTxt;
  TextInputType? inputType;
  double? w;
  double? h;
  Color? borderClr;
  bool? obsecureFlag;
  int? numOfLines;
  CustomCalenderField({
    Key? key,
    required this.hintTxt,
    this.inputType,
    this.w,
    this.h,
    this.borderClr,
    this.obsecureFlag,
    this.numOfLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w ?? 336.w,
      height: h ?? 50.h,
      child: TextField(
        maxLines: numOfLines ?? 1,
        keyboardType: inputType,
        obscureText: obsecureFlag ?? false,
        decoration: InputDecoration(
          hintText: hintTxt,
          hintStyle: TextStyle(fontSize: 14.sp),
          focusedBorder: borderDesign(),
          enabledBorder: borderDesign(),
        ),
      ),
    );
  }

  OutlineInputBorder borderDesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: borderClr ?? Colors.grey.shade300),
    );
  }
}
