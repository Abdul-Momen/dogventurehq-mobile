import 'package:country_code_picker/country_code_picker.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/create_account_controller.dart';
import 'package:dogventurehq/states/models/customer_model.dart';
import 'package:dogventurehq/ui/screens/add_pet/custom_checkbox.dart';
import 'package:dogventurehq/ui/screens/create_account/cc_picker.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/otp/otp.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/footer_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CreateAccountScreen extends StatefulWidget {
  static String routeName = '/create_account';

  const CreateAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String countryCode = '+971';
  bool _agreeFlag = false;

  final CreateAccountController _createAccountController =
      Get.put(CreateAccountController());

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

   CustomerAddressViewModel? customerAddressViewModel ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              // banner with title
              Image.asset(
                'assets/images/banner_ca.png',
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
                        Text(
                          'Please Register Below Account Detail',
                          style: TextStyle(
                              fontFamily: ConstantStrings.kAppFontPoppins,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp),
                        ),
                        Center(
                            child: Text(
                          'Create Account',
                          style: TextStyle(
                              fontFamily: ConstantStrings.kAppFont,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#33B1C4'),
                              fontSize: 40.sp),
                        )),
                      ],
                    ),
                  )
                ],
              ),

              // Input Fields
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name:'),
                    addH(10),
                    CustomField(
                        hintTxt: 'Enter Your Name',
                        validator: (val){
                          if(val!.isEmpty)return "Enter you name";
                        },
                        textEditingController: _nameTextEditingController,
                        inputType: TextInputType.name),
                    addH(20.h),
                    const Text('Email:'),
                    addH(10.h),
                    CustomField(
                      hintTxt: 'alex@example.com',
                      validator: (val){
                        return val!.isEmpty
                            ? 'enter your email'
                            : _createAccountController
                            .validateEmail(val);
                      },
                      textEditingController: _emailTextEditingController,
                      inputType: TextInputType.emailAddress,
                    ),
                    addH(20.h),
                    const Text('Mobile Number:'),
                    addH(10.h),
                    // mobile number
                    Container(
                      width: 336.w,
                      height: 50.h,
                      padding: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 115.w,
                            child: CCPicker(onChangedFn: changeCountryCode),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            indent: 18.h,
                            endIndent: 18.h,
                            color: Colors.grey.shade600,
                          ),
                          CustomField(
                              hintTxt: '554830683',
                              w: 178.w,
                              validator: (val) {
                                if(val!.isEmpty){
                                  return "Enter your phone number";
                                }
                              },
                              textEditingController:
                                  _phoneTextEditingController,
                              borderClr: Colors.transparent,
                              inputType: TextInputType.number),
                        ],
                      ),
                    ),
                    // password
                    addH(20.h),
                    const Text('Address:'),
                    addH(10.h),
                    CustomField(
                      hintTxt: 'Enter address',
                      textEditingController: _addressTextEditingController,
                      inputType: TextInputType.text,
                    ),
                    addH(20.h),
                    const Text('Password:'),
                    addH(10.h),
                    CustomField(
                        hintTxt: '********',
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                          return null;
                        },
                        obsecureFlag: true,
                        textEditingController: _passwordTextEditingController,
                        inputType: TextInputType.visiblePassword),
                    addH(20.h),
                    const Text('Confirm Password:'),
                    addH(10.h),
                    CustomField(
                        textEditingController:
                            _confirmPasswordTextEditingController,
                        hintTxt: '********',
                        obsecureFlag: true,
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                          if (val != _passwordTextEditingController.text) {
                            return 'Not Match';
                          }
                          return null;
                        },
                        inputType: TextInputType.visiblePassword),

                    addH(10.h),

                    CustomCheckbox(
                      initialValue: _agreeFlag,
                      onChangedFn: (value) => setState(
                        () => _agreeFlag = value!,
                      ),
                      title: ConstantStrings.kAgreeTermsTxt,
                      numOfLine: 2,
                    ),

                    addH(20.h),

                    CustomBtn(
                      btnFn: _agreeFlag
                          ? () {
                              // Get.toNamed(OtpScreen.routeName);
                              if (_key.currentState!.validate()) {
                                setState(() {
                                  _createAccount();
                                });
                              } else {}
                            }
                          : () {},
                      btnText: 'REGISTER',
                      btnBgClr:
                          _agreeFlag ? Colors.green.shade600 : Colors.grey,
                    ),

                    addH(20.h),

                    FooterText(
                      normalTxt: 'Have an Account?',
                      navigatingTxt: 'Login',
                      onTapFn: () => Get.toNamed(LoginScreen.routeName),
                    ),

                    addH(50.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeCountryCode(CountryCode code) {
    countryCode = code.dialCode ?? '+971';
    print(countryCode);
  }

  void _createAccount() {

    customerAddressViewModel=CustomerAddressViewModel(
      customerAddressId: 0,
      stateId: 0,
      cityId: 0,
      nearByLocation: '',
      customerId: 0,
      longitude: 0,
      latitude: 0,
      stateName: '',
      updatedAt: '',
      createdAt: '',
      addressType: '',
      cityName: '',
      buildingName: '',
      countryId: 0,
      flatNo: '',
      countryName: '',
      status: '',
      address: _addressTextEditingController.text,
    );
    CustomerModel customerModel = CustomerModel(
      customerId: 0,
      userName: _emailTextEditingController.text,
      firstName: _nameTextEditingController.text,
      middleName: '',
      lastName: '',
      email: _emailTextEditingController.text,
      email2: '',
      phoneNo: _phoneTextEditingController.text,
      phoneNo2: '',
      phoneNo3: '',
      gender: 0,
      password: _confirmPasswordTextEditingController.text,
      status: '',
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
      image: '',
      aboutCustomer: 'add',
      customerAddressViewModel: customerAddressViewModel,
      firstLastName: _nameTextEditingController.text,
    );

    _createAccountController.createAccount(customerModel);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_createAccountController.createAccountLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_createAccountController.customerObj != null) {
              Future.delayed(const Duration(seconds: 1), () async {
                Get.back();
                Get.offAndToNamed(LoginScreen.routeName);
                // Get.toNamed(LoginScreen.routeName);
              });
              return const Text('Successfully Registration');
            } else {
              return Column(
                children: [
                  const Text('Loading... failed'),
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
              );
            }
          }
        }),
        radius: 10.0);
  }
}
