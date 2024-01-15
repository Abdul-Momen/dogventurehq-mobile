import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/profile_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/add_contact_model.dart';
import 'package:dogventurehq/states/models/user_profile_update_model.dart';
import 'package:dogventurehq/ui/screens/contact_us/rowImg.dart';
import 'package:dogventurehq/ui/screens/create_account/cc_picker.dart';
import 'package:dogventurehq/ui/screens/home/row_img.dart';
import 'package:dogventurehq/ui/screens/membership/membership_details/membership_details.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../../states/controllers/contact_us_controller.dart';

class ContactUsPage extends StatefulWidget {
  static String routeName = '/contactus';

  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  String countryCode = '+971';

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _subjectTextEditingController =
      TextEditingController();
  final TextEditingController _massageTextEditingController =
      TextEditingController();

  // final ProfileController _profileController = Get.find<ProfileController>();
  // final ContactUsController _contactUsController = Get.find<ContactUsController>();
  final ContactUsController _contactUsController = Get.put(ContactUsController());

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
            title: "Contact Us", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              addH(10.h),
              RowContactImg(
                  rightTitle: 'Phone Number',
                  rightSubTitle:
                      'Support: 04 7026999 \nSales: +971 58 222 0491',
                  rightIcon: 'assets/images/phone.png',
                  rightImgFn: () {
                    _openUrl(
                        'https://www.google.com/maps/place/Dogventure+HQ/@25.1181592,55.2161792,17z/data=!3m1!4b1!4m5!3m4!1s0x3e5f6b25581e617b:0x19d4bfc470ce130e!8m2!3d25.1181592!4d55.2183679?shorturl=1');
                  },
                  leftTitle: 'Address',
                  leftSubTitle:
                      'DogventureHQ,25c street,\nAlQuoz 3 industrial, Dubai, UAE',
                  leftIcon: 'assets/images/location.png',
                  imgLeft: 'assets/images/vet.png',
                  imgRight: 'assets/images/day_care.png',
                  leftImgFn: () {
                    _launchPhoneURL('04 7026999');
                  }),
              addH(10.h),
              RowContactImg(
                rightImgFn: () {
                  launchEmailSubmission();
                },
                rightTitle: 'Business Hours',
                rightSubTitle:
                    'Monday to Friday: 9am to 6pm\nSaturday & Sunday: Closed',
                rightIcon: 'assets/images/clock.png',
                imgLeft: 'assets/images/events.png',
                leftSubTitle: 'Support@dogventurehq.com',
                leftTitle: 'Email',
                leftIcon: 'assets/images/email.png',
                imgRight: 'assets/images/training.png',
              ),
              addH(20.h),
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addH(10),
                    CustomField(
                      textEditingController: _nameTextEditingController,
                      hintTxt: 'First Name*',
                      inputType: TextInputType.name,
                        validator: (value) {
                          return value!.isEmpty ? 'Enter your name' : null;
                        } ,
                    ),
                    addH(10.h),
                    CustomField(
                      textEditingController: _emailTextEditingController,
                      hintTxt: 'Your Email*',
                      inputType: TextInputType.emailAddress,
                    ),
                    addH(10.h),

                    CustomField(
                      hintTxt: 'Contact Number*',
                      textEditingController: _phoneTextEditingController,
                      inputType: TextInputType.number,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                    addH(10.h),
                    CustomField(
                      hintTxt: 'Subject',
                      textEditingController: _subjectTextEditingController,
                      inputType: TextInputType.text,
                    ),

                    addH(10.h),

                    CustomField(
                      textEditingController: _massageTextEditingController,
                      inputType: TextInputType.text,
                      hintTxt: 'Massage',
                      numOfLines: 3,
                      h: 100.h,
                      validator: (value) {
                        return value!.isEmpty ? 'Enter your Massage!' : null;
                      },
                    ),
                    addH(20.h),
                    CustomBtn(
                      btnSize: Size(340.w, 60.h),
                      btnFn: () {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            _addContactUs();
                          });
                        }
                      },
                      btnText: 'Send Massage',
                      btnBgClr: Colors.green.shade600,
                      textFontFamily: ConstantStrings.kAppFont,
                      txtSize: 20.sp,
                    ),
                    addH(10.h),
                  ],
                ),
              ),
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

  void _addContactUs() {

    AddContactModel addContactModel = AddContactModel(
      contactUsId: 0,
      name: _nameTextEditingController.text,
      email: _emailTextEditingController.text,
      phoneNo: _phoneTextEditingController.text,
      subject: _subjectTextEditingController.text,
      message: _massageTextEditingController.text,
      createdAt: DateTime.now(),
    );

    _contactUsController.addContactUs(addContactModel);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_contactUsController.addContactUsLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_contactUsController.addContact != null) {
              Future.delayed(const Duration(seconds: 1), () async {
                Get.back();
              });
              return const Text('Massage Sent');
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

  _openUrl(String urls) async {
    print('Map');
    final url = Uri.parse(urls);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  _launchPhoneURL(String phoneNumber) async {
    UrlLauncher.launch("tel://" + phoneNumber);
  }

  void launchEmailSubmission() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'Support@dogventurehq.com',
        queryParameters: {
          'subject': 'Default Subject',
          'body': 'Default body'
        });
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
