import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/day_care/day_care.dart';
import 'package:dogventurehq/ui/screens/events/events.dart';
import 'package:dogventurehq/ui/screens/traning_academy/training_academy.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_clinic.dart';
import 'package:dogventurehq/ui/widgets/custom_bottom_navigation.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/helper.dart';
import '../home/row_img.dart';

class ServicesPage extends StatelessWidget {
  static String routeName = '/service';

  const ServicesPage({Key? key}) : super(key: key);

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
              title: "Services", img_bg: 'assets/images/day_care_bg.png'),
        ),
        body: Column(
          children: [
            SizedBox(
              // color: Colors.pink,
              width: double.infinity,
              height: 120.h,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Stack(
                      children: [
                        Image.asset(
                          height: 170.h,
                          'assets/images/services_bg.png',
                        ),
                        Positioned(
                          bottom: 50.h,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Text(
                                'What we do',
                                style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 13.sp),
                              ),
                              Center(
                                  child: Text(
                                    'Our Services',
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          height: 300.h,
                          'assets/images/vetclinic_bg.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(VetClinic.routeName);
                                },
                                child: Text(
                                  ' Vet\nClinic',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 30.0.sp,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  addW(5.w),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          height: 300.h,
                          'assets/images/traning_bg.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(TrainingAcademy.routeName,
                                      arguments: 1);

                                  //  Get.to(TrainingAcademy(screenNumValue: 1));
                                  // Get.dialog(
                                  //   Dialog(
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(16.0),
                                  //       child: Column(
                                  //         mainAxisSize: MainAxisSize.min,
                                  //         children: [
                                  //           Text(
                                  //             'Coming soon..',
                                  //             style: Get.textTheme.headline6,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Text(
                                  'Training\nAcademy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 30.0.sp,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  addW(5.w),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          height: 300.h,
                          'assets/images/event_bg.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Events.routeName);
                                },
                                child: Text(
                                  'Event',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 30.0.sp,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  addW(5.w),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          height: 300.h,
                          'assets/images/daycare_bg.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      DayCare.routeName, arguments: 2);
                                  // Get.dialog(
                                  //   Dialog(
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(16.0),
                                  //       child: Column(
                                  //         mainAxisSize: MainAxisSize.min,
                                  //         children: [
                                  //           Text(
                                  //             'Coming soon..',
                                  //             style: Get.textTheme.headline6,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Text(
                                  'Day\nCare',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 30.0.sp,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // RowImg(
            //   imgLeft: 'assets/images/vet.png',
            //   imgRight: 'assets/images/training.png',
            //   leftImgFn: () => _launchWhatsapp()  ,
            //   rightImgFn: () => _launchWhatsapp(),
            //   imgAnimal: 'assets/images/event_animal.png',
            //   imgRightAnimal: 'assets/images/event_animal.png',
            //   imgServicesName: ' Vet\nClinic',
            //   imgRightServicesName: 'Traning\nAcademey',
            // ),
            // addH(20.h),
            // RowImg(
            //   imgLeft: 'assets/images/events.png',
            //   imgRight: 'assets/images/day_care.png',
            //   leftImgFn: () => Get.toNamed(Events.routeName),
            //   rightImgFn: () => _launchWhatsapp(),
            //   imgAnimal: 'assets/images/event_animal.png',
            //   imgRightAnimal: 'assets/images/event_animal.png',
            //   imgServicesName: 'Events',
            //   imgLeftBtnTxt: 'Know More',
            //   imgRightServicesName: 'Day\nCare',
            //
            // ),

            addH(20.h),
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
