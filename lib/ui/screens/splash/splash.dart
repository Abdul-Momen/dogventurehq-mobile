import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/onboard/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigating();
  }

  void navigating() async {
    // if (Preference.getLoggedInFlag()) {
    //   Future.delayed(
    //     const Duration(seconds: 2),
    //     () => Get.toNamed(HomeScreen.routeName),
    //   );
    // } else {
    //   Future.delayed(
    //     const Duration(seconds: 2),
    //     () => Get.toNamed(OnboardScreen.routeName),
    //   );
    // }

    Future.delayed(
            const Duration(seconds: 2),
            () => Get.offAndToNamed(HomeScreen.routeName),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo_shadow.png',
                  width: 336.w,
                  height: 333.h,
                ),
              ],
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 200.w,
                height: 245.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
