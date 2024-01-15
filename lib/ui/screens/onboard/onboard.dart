import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/screens/create_account/create_account.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnboardScreen extends StatefulWidget {
  static String routeName = '/onboard';
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/on1.png',
              width: double.infinity,
              height: 666.h,
              fit: BoxFit.fill,
            ),
            CustomBtn(
              btnFn: () => Get.toNamed(CreateAccountScreen.routeName),
              btnText: 'Create Account',
              btnBgClr: ConstantColors.kBtnBgClr,
            ),
            addH(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                line(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
                line(),
              ],
            ),
            addH(20.h),
            Container(
              width: 348.w,
              height: 52.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 74.w,
                    child: SvgPicture.asset(
                      'assets/svg/google.svg',
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(
                    width: 255.w,
                    child: const Center(
                      child: Text(
                        'Continue With Google',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                ),
                addW(5.w),
                InkWell(
                  onTap: () => Get.toNamed(LoginScreen.routeName),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget line() {
    return Container(
      height: 1,
      width: 145.w,
      color: Colors.grey.shade900,
    );
  }
}
