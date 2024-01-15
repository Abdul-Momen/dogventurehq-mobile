import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/about/about_item.dart';
import 'package:dogventurehq/ui/screens/add_pet/add_pet.dart';
import 'package:dogventurehq/ui/screens/my_events/custom_tab_item.dart';
import 'package:dogventurehq/ui/screens/my_order_details/order_item.dart';
import 'package:dogventurehq/ui/screens/my_pets/pets_item.dart';
import 'package:dogventurehq/ui/screens/wallet/wallet_item.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
            title: "About us", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We're The World's Most Trusted Company",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontFamily: ConstantStrings.kAppFontPoppins),
                ),
                Text(
                  "About Us",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 50.sp, fontFamily: ConstantStrings.kAppFont),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AboutItem(img: 'assets/images/pet_rg.png', text: '5,200', subText: 'pet registration',),
              AboutItem(img: 'assets/images/event_or.png', text: '8,500', subText: 'Event Organizer',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AboutItem(img: 'assets/images/happy_clint.png', text: '7,100', subText: 'Happy Clients',),
              AboutItem(img: 'assets/images/pet_traning.png', text: '5,200', subText: 'Pet Trained',),
            ],
          ),

          addH(10.h),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: 40.sp,
              child: CustomBtn(
                btnFn: () {
                  //Get.to();
                  // _launchWhatsapp();
                },
                btnText: 'Know More',
                txtColor: Colors.white,
                btnSize: Size(100.w, 20.h),
                textFontFamily: ConstantStrings.kAppFont,
                btnBgClr: Colors.green,),
            ),
          ),

        ],
      ),
    );
  }
}
