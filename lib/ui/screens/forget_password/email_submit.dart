import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/login_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/forget_password/reset_password.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/footer_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/custom_titlebar.dart';

class EmailSubmitPage extends StatefulWidget {
  const EmailSubmitPage({Key? key}) : super(key: key);

  @override
  State<EmailSubmitPage> createState() => _EmailSubmitPageState();
}

class _EmailSubmitPageState extends State<EmailSubmitPage> {
  TextEditingController userEmailTextController = TextEditingController();

  final LoginController _loginController = Get.put(LoginController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
      body: Column(
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
                      'Forget Password',
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
                    'User Email',
                  ),
                  addH(10.h),
                  CustomField(
                    hintTxt: 'Enter Email',
                    textEditingController: userEmailTextController,
                    inputType: TextInputType.name,
                      validator: (value) {
                        return value!.isEmpty
                            ? 'enter your email'
                            : _loginController
                            .validateEmail(value);
                      }
                  ),
                  addH(20.h),
                  addH(20.h),
                  CustomBtn(
                    btnFn: () {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          _sendOtpByEmailFun();
                        });
                      } else {}
                    },
                    btnText: 'SEND',
                    btnBgClr: Colors.green.shade600,
                  ),
                  addH(20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendOtpByEmailFun() {
    _loginController.sentOTPbyMail(userEmailTextController.text);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_loginController.forgetPasswordLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_loginController.massage != null) {
              Future.delayed(const Duration(seconds: 1), () {
                Get.back();
                Get.to(const ResetPasswordPage());
              });
              return  Text( _loginController.massage.toString());
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
