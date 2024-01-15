import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/login_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/customer_model.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/ui/screens/create_account/create_account.dart';
import 'package:dogventurehq/ui/screens/events_details/events_details.dart';
import 'package:dogventurehq/ui/screens/forget_password/email_submit.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/footer_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool loginBtnPressed = false;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // banner with title
            Image.asset(
              'assets/images/banner_login.png',
              width: double.infinity,
              height: 267.h,
              fit: BoxFit.fill,
            ),
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
                      Text('Welcome Back',style: TextStyle(
                          fontFamily: ConstantStrings.kAppFontPoppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp                      ),),
                     Center(child: Text('Login',style: TextStyle(
                       fontFamily: ConstantStrings.kAppFont,
                       fontWeight: FontWeight.bold,
                       color: HexColor('#33B1C4'),
                       fontSize: 50.sp
                     ),)),
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
                      'User name',
                    ),
                    addH(10.h),
                    CustomField(
                        hintTxt: 'Enter username',
                        textEditingController: userNameTextController,
                        inputType: TextInputType.emailAddress),
                    addH(20.h),
                    const Text('Password'),
                    addH(10.h),
                    CustomField(
                      hintTxt: '********',
                      inputType: TextInputType.visiblePassword,
                      obsecureFlag: true,
                      validator: (val) => val!.length < 6
                          ? "Password length should be Greater than 6"
                          : null,
                      textEditingController: passwordTextController,
                    ),
                    addH(20.h),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Get.to(const EmailSubmitPage());
                        },
                        child: Text(
                          'Forget Password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                    addH(20.h),
                    CustomBtn(
                      btnFn: () {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            _loginFun();
                          });
                        } else {

                        }
                      },
                      btnText: 'LOGIN',
                      btnBgClr: Colors.green.shade600,
                    ),
                    addH(20.h),
                    FooterText(
                      normalTxt: "Don't Have an Account?",
                      navigatingTxt: 'Register',
                      onTapFn: () => Get.toNamed(CreateAccountScreen.routeName),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loginFun() {
    if (passwordTextController.text.length < 6) {
      //Get.showSnackbar(SnackBar(content:Text('')));
      ///show toast massage
      DialogHelper.showLoading('password short');
      return;
    }

    _loginController.loginLoadingFlag.value = true;
    _loginController.getLogin(
        userNameTextController.text, passwordTextController.text);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_loginController.loginLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_loginController.customerModel != null) {
              Preference.setLoggedInFlag(true);
              Preference.setUserIdFlag(
                  _loginController.customerModel!.customerId);
              Preference.setPasswordFlag(
                  _loginController.customerModel!.password);
              Preference.setNameFlag(_loginController.customerModel!.firstLastName);
              Preference.setEmailFlag(_loginController.customerModel!.email);
              Preference.setPhoneFlag(_loginController.customerModel!.phoneNo);
              Preference.setAddressFlag(_loginController.customerModel!.customerAddressViewModel!.address);
              Preference.setUserImageFlag(_loginController.customerModel!.image);

              Future.delayed(Duration(seconds: 0), () {
                Get.back();
                Get.back();
              });

              return const Text('Login success');
            } else {
              return InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Column(
                    children: [
                      Text('Invalid username & password'),
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

