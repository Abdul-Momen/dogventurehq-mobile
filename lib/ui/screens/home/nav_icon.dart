import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavIcon extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String title;
  VoidCallback? onTapFn;
  NavIcon({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.title,
    this.onTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      child: Container(
        height: 65.h,
        width: 70.w,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: Colors.green.shade800,
                )
              : null,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              icon,
              color: isSelected ? Colors.green.shade800 : Colors.black,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                color: isSelected ? Colors.green.shade800 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
