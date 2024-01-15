import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Membership extends StatelessWidget {
  const Membership({Key? key}) : super(key: key);

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
            title: "MemberShip", img_bg: 'assets/images/day_care_bg.png'),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Stack(
              children: [
                Image.asset(
                  height: 150.h,
                  'assets/images/membership_bg.png',
                ),
                Positioned(
                  bottom: 50.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'Dogventure Membership',
                        style: TextStyle(
                            fontFamily: ConstantStrings.kAppFont,
                            fontSize: 13.sp),
                      ),
                      Center(
                          child: Text(
                            'MEMBERSHIP',
                            style: TextStyle(
                                fontFamily: ConstantStrings.kAppFont,
                                color: HexColor('#33B1C4'),
                                fontSize: 35.sp),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          addH(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()=>_launchWhatsapp(),
                  child: Image.asset(
                    width: 180.w,
                    height:  160.h,
                    'assets/images/silver.png',
                    fit: BoxFit.fill,
                  ),
                ),  InkWell(
                  onTap: ()=>_launchWhatsapp(),
                  child: Image.asset(
                    width: 180.w,
                    height:  160.h,
                    'assets/images/gold.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          addH(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: ()=> _launchWhatsapp(),
                  child: Center(
                    child: Image.asset(
                      width: 180.w,
                      height:  160.h,
                      'assets/images/vip.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      
    );
  }


  _launchWhatsapp() async {
    //const url = "https://wa.me/?text=YourTextHere"
    const url = "https://api.whatsapp.com/message/GWMI3X2GSNASC1?autoload=1&app_absent=0";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}


