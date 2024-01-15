import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/day_care_controller.dart';
import 'package:dogventurehq/states/controllers/vet_clinic_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/day_care/day_care_registration/day_care_registration.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/payment/payment.dart';
import 'package:dogventurehq/ui/screens/registration/registration.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/html_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DayCareDetailsPage extends StatefulWidget {
  static String routeName = '/day_care_details';

  const DayCareDetailsPage({Key? key}) : super(key: key);

  @override
  State<DayCareDetailsPage> createState() => _DayCareDetailsPageState();
}

class _DayCareDetailsPageState extends State<DayCareDetailsPage> {
  final DayCareController _dayCareController = Get.put(DayCareController());

  String productMasterId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productMasterId = Get.arguments[0];
    _dayCareController.getDayCareDetails(id: productMasterId);
    _dayCareController.getGroomingServicesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (_dayCareController.dayCareLoadingFlag.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (_dayCareController.dayCareDetails == null) {
            return Text('No data found');
          } else {
            return Column(
              children: [
                Container(
                  height: 900.h,
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300.h,
                                  child: CustomImageNetwork(
                                    imageUrl: _dayCareController
                                        .dayCareDetails!
                                        .productMasterMediaViewModels[0]
                                        .mediumImage,
                                  ),
                                ),
                              ),
                              addH(15.h),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _dayCareController
                                          .dayCareDetails!.productName,
                                      style: TextStyle(
                                        fontFamily: ConstantStrings.kAppFont,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    addH(10.h),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_sharp,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 45.h,
                                          width: 300.w,
                                          child: Text(
                                            "DogventureHQ,25c street, AlQuoz 3 industrial, Dubai, UAE",
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: ConstantColors.kGrayClr,
                                                fontFamily: ConstantStrings
                                                    .kAppFontPoppins,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    addH(10.h),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'AED  ',
                                            style: TextStyle(
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: _dayCareController
                                                .dayCareDetails!.productDecimal
                                                .toString(),
                                            style: TextStyle(
                                              color: ConstantColors.kContactUs,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' (VAT included)',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    addH(20.h),
                                    Text(
                                      "About",
                                      style: TextStyle(
                                        fontFamily:
                                            ConstantStrings.kAppFontPoppins,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    addH(10.h),
                                    CustomHtmlText(
                                      text: _dayCareController
                                          .dayCareDetails!.description,
                                    )
                                  ],
                                ),
                              ),
                              // Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //
                              //     // Container(
                              //     //   width: double.infinity,
                              //     //   height: 40.h,
                              //     //   child: Padding(
                              //     //     padding: const EdgeInsets.all(8.0),
                              //     //     child: Text("Show more",
                              //     //         style: TextStyle(
                              //     //           color: HexColor("#F98C10"),
                              //     //           fontFamily:
                              //     //               ConstantStrings.kAppFont_Poppins,
                              //     //           fontWeight: FontWeight.bold,
                              //     //           fontSize: 10.0,
                              //     //         )),
                              //     //   ),
                              //     // ),
                              //   ],
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(left: 20.0, bottom: 20),
                              //   child: CustomBtn(
                              //     btnSize: Size(380.w, 35.h),
                              //     btnText: 'Go to Packages',
                              //     btnBgClr: Colors.indigo,
                              //     btnFn: () {},
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20.0),
                              //   child: CustomBtn(
                              //     btnSize: Size(380.w, 62.h),
                              //     btnFn: () =>
                              //         Get.toNamed(RegistrationPage.routeName,arguments: 3),
                              //
                              //     btnText: 'Book Consultation',
                              //     btnBgClr: Colors.green,
                              //   ),
                              // ),
                              addH(30.h)
                            ],
                          ),
                        ],
                      ),
                      CustomTitlebar(
                        title: "DAY CARE",
                        img_bg: 'assets/images/day_care_bg.png',
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }
      }),
      bottomSheet: SizedBox(
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (_dayCareController.dayCareLoadingFlag.value) {
                return SizedBox.shrink();
              } else {
                if (_dayCareController.dayCareDetails == null) {
                  return SizedBox.shrink();
                } else {
                  return Center(
                    child: CustomBtn(
                      btnFn: () {
                        if (Preference.getLoggedInFlag()) {
                          Get.toNamed(
                            DayCareRegistrationScreen.routeName,
                            arguments: [
                              3,
                              1,
                              _dayCareController.dayCareDetails!.productDecimal,
                            ],
                          );
                        } else {
                          Get.toNamed(LoginScreen.routeName, arguments: 2);
                        }
                      },
                      btnText: "Book Service Now",
                      btnBgClr: Colors.green,
                      textFontFamily: ConstantStrings.kAppFont,
                    ),
                  );
                }
              }
            }),
            addH(10.h),
          ],
        ),
      ),
    );
  }
}
