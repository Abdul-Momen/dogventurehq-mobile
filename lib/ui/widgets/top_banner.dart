import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBanner extends StatelessWidget {
  final String topImg;
  final String titleImg;
  const TopBanner({
    Key? key,
    required this.topImg,
    required this.titleImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390.h,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            height: 287.h,
            child: Image.asset(
              topImg,
              // height: 287.h,
            ),
          ),
          Image.asset(
            titleImg,
            width: 320.w,
          ),
        ],
      ),
    );
  }
}
