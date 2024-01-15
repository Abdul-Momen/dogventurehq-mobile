import 'package:dogventurehq/ui/screens/packages/packages_item.dart';
import 'package:dogventurehq/ui/screens/packages/packeges_details/packages_details.dart';
import 'package:dogventurehq/ui/widgets/custom_product_item.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PackagePage extends StatelessWidget {
  const PackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#f5b342"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
            title: "Packages", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 428.w,
              height: 60.h,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/accessories_bg.png',
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    right: 10.w,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.amber.shade800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(10.h),
            SizedBox(
              width: double.infinity,
              height: 760.h,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                crossAxisCount: 2,
                childAspectRatio:
                    MediaQuery.of(context).size.height / (10 * 100),
                children: List.generate(17, (index) {
                  return InkWell(
                    onTap: (){
                      Get.to(PackageDetails());
                    },
                      child: PackageItem());
                  //bohash.org api provide you different images for any number you are giving
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
