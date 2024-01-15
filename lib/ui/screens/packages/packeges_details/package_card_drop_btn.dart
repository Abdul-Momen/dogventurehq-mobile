import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageCardBtn extends StatelessWidget {
  final String text;
  const PackageCardBtn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: ConstantStrings.kAppFont),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.keyboard_arrow_down),
            ),

          ],
        ),
      ),
    );
  }
}
