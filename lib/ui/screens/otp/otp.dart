import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/add_pet/add_pet.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/footer_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = '/otp';
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 46.h, left: 18.w),
            child: InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                'assets/svg/back.svg',
                height: 40.h,
              ),
            ),
          ),
          Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200.w,
                  height: 245.h,
                ),
              ),
              addH(50.h),
              Text(
                'OTP VERIFY !',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              addH(10.h),
              SizedBox(
                width: 220.w,
                child: Text(
                  ConstantStrings.kOtpScreenTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              addH(20.h),
              SizedBox(
                height: 50.h,
                width: 280.h,
                child: Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    margin: EdgeInsets.only(left: 10.h),
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      border: Border.all(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ),
              addH(20.h),
              CustomBtn(
                btnFn: () => Get.toNamed(AddPet.routeName),
                btnText: 'Submit',
                btnBgClr: Colors.green.shade600,
                btnSize: Size(260.w, 52.h),
              ),
              addH(10.h),
              FooterText(
                normalTxt: "Didn't Receive a OTP?",
                navigatingTxt: 'Resend',
                onTapFn: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
