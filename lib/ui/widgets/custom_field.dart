import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  final String hintTxt;
  String? initialValue;
  TextInputType inputType;
  double? w;
  double? h;
  Color? borderClr;
  bool? obsecureFlag;
  int? numOfLines;
  TextEditingController? textEditingController;

  String? Function(String?)? validator;

  CustomField({
    Key? key,
    required this.hintTxt,
    required this.inputType,
    this.w,
    this.h,
    this.borderClr,
    this.obsecureFlag,
    this.numOfLines,
    this.textEditingController,
    this.validator,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w ?? 336.w,
      height: h ?? 50.h,
      child: TextFormField(
        maxLines: numOfLines ?? 1,
        keyboardType: inputType,
        obscureText: obsecureFlag ?? false,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintTxt,
          hintStyle: TextStyle(fontSize: 14.sp),
          focusedBorder: borderDesign(),
          enabledBorder: borderDesign(),
        ),
        onChanged: (value) {},
        autocorrect: false,
        validator: validator,
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
