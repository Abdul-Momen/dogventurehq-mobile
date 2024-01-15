import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/packages/row_item.dart';
import 'package:dogventurehq/ui/screens/store/store_details/store_details.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageItem extends StatefulWidget {
  const PackageItem({Key? key}) : super(key: key);

  @override
  State<PackageItem> createState() => _PackageItemState();
}

class _PackageItemState extends State<PackageItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        width: 168.w,
        height: 320.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 120.h,
                width: double.infinity, // fixed width and height
                child: Image.asset(
                  'assets/images/package.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Package 1",
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontFamily: ConstantStrings.kAppFont),
                      ),
                      Text(
                        "04 services",
                        style: TextStyle(
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: 70.w,
                    child: CustomRichText(
                      text: 'AED',
                      textRich: ' 250',
                      textRichColor: '#155D84',
                      textRichSize: 24.sp,
                    )),
              ],
            ),
            addH(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: PackageRowItem(
                    img: 'assets/svg/medical.svg',
                    text: 'Medical Grooming',
                    color: 'color',
                  ),
                ),
                Expanded(
                  child:PackageRowItem(
                    img: 'assets/svg/guard.svg',
                    text: 'Guard Dog Training',
                    color: 'color',
                  ),
                ),
                Expanded(
                  child: PackageRowItem(
                    img: 'assets/svg/dog_park.svg',
                    text: 'Dog Park',
                    color: 'color',
                  ),
                ),
              ],
            ),
            addH(5.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ut At Quam Sit",
                  style: TextStyle(
                      fontSize: 19.sp,
                      fontFamily: ConstantStrings.kAppFont),
                ),
                Text(
                  "Lorem ipsum dolor sit Ectetur Condimentum, mattis urna sit Phasellus commodo justo nec Lorem ipsum dolor sit Ectetur Condimentum, mattis urna sit",
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                  maxLines: 4,
                ),
              ],
            ),
            addH(5.h),
          ],
        ),
      ),
    );
  }
}
