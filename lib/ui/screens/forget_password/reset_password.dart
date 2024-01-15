import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/login_controller.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/custom_titlebar.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController otpTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  final LoginController _loginController = Get.put(LoginController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
            title: "Back To Login", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // banner with title
            Stack(
              children: [
                Image.asset(
                  'assets/images/title_login.png',
                  width: double.infinity,
                  height: 140.h,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 30.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontFamily: ConstantStrings.kAppFontPoppins,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp),
                      ),
                      Center(
                          child: Text(
                        'Reset Password',
                        style: TextStyle(
                            fontFamily: ConstantStrings.kAppFont,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#33B1C4'),
                            fontSize: 50.sp),
                      )),
                    ],
                  ),
                )
              ],
            ),
            addH(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.w),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your OTP',
                    ),
                    addH(10.h),
                    CustomField(
                      hintTxt: 'Enter OTP',
                      textEditingController: otpTextController,
                      inputType: TextInputType.name,
                      validator: (value) {
                        return value!.isEmpty ? 'Enter your OTP' : null;
                      },
                    ),
                    addH(20.h),
                    const Text(
                      'NewPassword',
                    ),
                    addH(10.h),
                    CustomField(
                      hintTxt: 'Enter NewPassword',
                      textEditingController: newPasswordTextController,
                      inputType: TextInputType.name,
                      validator: (value) {
                        return value!.isEmpty ? 'Enter New Password' : null;
                      },
                    ),
                    addH(20.h),
                    const Text(
                      'Confirm Password',
                    ),
                    addH(10.h),
                    CustomField(
                      hintTxt: 'Enter Confirm Password',
                      textEditingController: confirmPasswordTextController,
                      inputType: TextInputType.name,
                      validator: (value) {
                        return value!.isEmpty ? 'Enter Confirm Password' : null;
                      },
                    ),
                    addH(20.h),
                    addH(20.h),
                    CustomBtn(
                      btnFn: () {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            _resetPasswordFun();
                          });
                        } else {}
                      },
                      btnText: 'SAVE',
                      btnBgClr: Colors.green.shade600,
                    ),
                    addH(20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _resetPasswordFun() {
    _loginController.resetPassword(otpTextController.text,
        newPasswordTextController.text, confirmPasswordTextController.text);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_loginController.resetPasswordLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_loginController.resetMassage != null) {
              Future.delayed(const Duration(seconds: 1), () {
                Get.back();
                Get.to(const HomeScreen());
              });
              return Text(_loginController.resetMassage.toString());
            } else {
              return InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Column(
                    children: [
                      const Text('Invalid Email'),
                      addH(20.h),
                      CustomBtn(
                        btnFn: () {
                          Get.back();
                        },
                        btnText: 'Try Again',
                        btnBgClr: Colors.green,
                        btnSize: Size(120.w, 40.h),
                      )
                    ],
                  ));
            }
          }
        }),
        radius: 10.0);
  }
}
