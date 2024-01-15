import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/home.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/contact_us/contact_us.dart';
import 'package:dogventurehq/ui/screens/day_care/day_care.dart';
import 'package:dogventurehq/ui/screens/events/events.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_product_item.dart';
import 'package:dogventurehq/ui/screens/home/nav_icon.dart';
import 'package:dogventurehq/ui/screens/home/row_img.dart';
import 'package:dogventurehq/ui/screens/membership/membership.dart';
import 'package:dogventurehq/ui/screens/membership/membership_details/membership_details.dart';
import 'package:dogventurehq/ui/screens/my_cart/my_cart.dart';
import 'package:dogventurehq/ui/screens/notification/notification.dart';
import 'package:dogventurehq/ui/screens/services/services.dart';
import 'package:dogventurehq/ui/screens/traning_academy/training_academy.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_clinic.dart';
import 'package:dogventurehq/ui/widgets/custom_bottom_navigation.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/screens/home/custom_drawer.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../states/controllers/my_wallet_controller.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selectedNavIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 200),
      () => _homeController.getBannerList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawerEnableOpenDragGesture: false,
        drawer: CustomDrawer(
          scaffoldKey: scaffoldKey,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                // color: Colors.pink,
                width: double.infinity,
                height: 540.h,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Positioned(
                      top: 10.h,
                      child: SizedBox(
                        height: 400.h,
                        child: Obx(() {
                          if (_homeController.bannerListLoadingFlag.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                            /*      return Image.asset(
                              'assets/images/home_banner.png',
                              fit: BoxFit.cover,
                            );*/
                          } else {
                            if (_homeController.bannerList.isNotEmpty) {
                              return CustomImageNetwork(
                                imageUrl:
                                    _homeController.bannerList[0].smallImage,
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                              /*  return Image.asset(
                                'assets/images/home_banner.png',
                                fit: BoxFit.cover,
                              );*/
                            }
                          }
                        }),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 100.h,
                      left: 0,
                      child: SizedBox(
                        height: 170.h,
                        child: Image.asset(
                          'assets/images/home_banner_shape.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      right: 5,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 72.w,
                        height: 84.h,
                      ),
                    ),
                    Positioned(
                      top: 100.h,
                      left: 30.w,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              if (_homeController.bannerListLoadingFlag.value) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Live the Best, With \nyour Pet',
                                      style: TextStyle(
                                          fontSize: 35.sp,
                                          fontFamily: ConstantStrings
                                              .kAppFontBarbesNeuekai,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Your pet\'s best lifestyle begins at Dogventure HQ, we offer\neverything they need for a comfortabel and enjoyable life.',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                if (_homeController.bannerList.isNotEmpty) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Live the Best, With \nyour Pet',
                                        style: TextStyle(
                                            fontSize: 35.sp,
                                            fontFamily: ConstantStrings
                                                .kAppFontBarbesNeuekai,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'Your pet\'s best lifestyle begins at Dogventure HQ, we offer\neverything they need for a comfortabel and enjoyable life.',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Live the Best, With \nyour Pet',
                                        style: TextStyle(
                                            fontSize: 35.sp,
                                            fontFamily: ConstantStrings
                                                .kAppFontBarbesNeuekai,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'Your pet\'s best lifestyle begins at Dogventure HQ, we offer\neverything they need for a comfortabel and enjoyable life.',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              }

                              return const Text('data');
                            }),
                            addH(10.h),
                            SizedBox(
                              height: 40.sp,
                              child: CustomBtn(
                                btnFn: () {
                                  Get.to(const ContactUsPage());
                                  // _launchWhatsapp();
                                },
                                btnText: 'Contact Us',
                                txtColor: Colors.white,
                                btnSize: Size(100.w, 20.h),
                                textFontFamily: ConstantStrings.kAppFont,
                                btnBgClr: ConstantColors.kContactUs,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addH(50.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 70.w,
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                // margin: EdgeInsets.only(left: 20.w),
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade700,
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if (Preference.getLoggedInFlag()) {
                                      scaffoldKey.currentState!.openDrawer();
                                    } else {
                                      Get.toNamed(LoginScreen.routeName,
                                          arguments: 2);
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    'assets/svg/drawer.svg',
                                  ),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: Center(
                            //     child: Image.asset(
                            //       'assets/images/logo.png',
                            //       width: 52.w,
                            //       height: 64.h,
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   width: 70.w,
                            //   height: 52.h,
                            //   margin: EdgeInsets.only(right: 20.w),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [
                            //       InkWell(
                            //         onTap: () {
                            //           Get.to(NotificationPage());
                            //         },
                            //         child: SvgPicture.asset(
                            //           'assets/svg/fb.svg',
                            //         ),
                            //       ),
                            //       addW(20.w),
                            //       InkWell(
                            //         onTap: () {
                            //           Get.to(MyCartPage());
                            //         },
                            //         child: SvgPicture.asset(
                            //           'assets/svg/instra.svg',
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Padding(
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
                    ),
                  ],
                ),
              ),
              // RowImg(
              //   imgLeft: 'assets/images/vet.png',
              //   imgRight: 'assets/images/training.png',
              //   leftImgFn: () => _launchWhatsapp()  ,
              //   rightImgFn: () => _launchWhatsapp(),
              //   imgAnimal: 'assets/images/vet_animal.png',
              //   imgRightAnimal: 'assets/images/training_animal.png',
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
              //   imgRightAnimal: 'assets/images/day_care_animal.png',
              //   imgServicesName: 'Events',
              //   imgLeftBtnTxt: 'Know More',
              //   imgRightServicesName: 'Day\nCare',
              //
              // ),
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 25.0.sp,
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 25.0.sp,
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 25.0.sp,
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
                                Get.toNamed(DayCare.routeName, arguments: 2);
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 35.0.sp,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Stack(
                  children: [
                    Image.asset(
                      height: 150.h,
                      'assets/images/membership_bg.png',
                    ),
                    Positioned(
                      bottom: 50.h,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            'Dogventure Membership',
                            style: TextStyle(
                                fontFamily: ConstantStrings.kAppFont,
                                fontSize: 13.sp),
                          ),
                          Center(
                              child: Text(
                            'MEMBERSHIP',
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

              // SizedBox(
              //   width: 428.w,
              //   height: 90.h,
              //   child: Stack(
              //     alignment: AlignmentDirectional.bottomCenter,
              //     children: [
              //       Positioned(
              //         top: -10,
              //         left: 0,
              //         right: 0,
              //         child: Image.asset(
              //           'assets/images/membership.png',
              //         ),
              //       ),
              //       addH(10.h),
              //       // Row(
              //       //   mainAxisAlignment: MainAxisAlignment.center,
              //       //   children: [
              //       //     CustomBtn(
              //       //       btnFn: () {},
              //       //       btnText: 'DAY CARE',
              //       //       btnBgClr: Colors.green.shade600,
              //       //       btnSize: Size(92.w, 32.h),
              //       //       txtSize: 12.sp,
              //       //       btnRadius: BorderRadius.circular(15.r),
              //       //     ),
              //       //     addW(10.w),
              //       //     CustomBtn(
              //       //       btnFn: () {},
              //       //       btnText: 'VET CLINIC',
              //       //       btnBgClr: Colors.white,
              //       //       btnSize: Size(92.w, 32.h),
              //       //       txtSize: 12.sp,
              //       //       txtColor: Colors.black,
              //       //       borderColor: Colors.black,
              //       //       btnRadius: BorderRadius.circular(15.r),
              //       //     ),
              //       //   ],
              //       // ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _launchWhatsapp(),
                        child: Image.asset(
                          height: 100.h,
                          'assets/images/silver.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    addW(5.w),
                    Expanded(
                      child: InkWell(
                        onTap: () => _launchWhatsapp(),
                        child: Image.asset(
                          height: 100.h,
                          'assets/images/gold.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    addW(5.w),
                    Expanded(
                      child: InkWell(
                        onTap: () => _launchWhatsapp(),
                        child: Image.asset(
                          height: 100.h,
                          'assets/images/vip.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // addH(10.h),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       InkWell(
              //         onTap: ()=> _launchWhatsapp(),
              //         child: Center(
              //           child: Image.asset(
              //             width: 180.w,
              //             height:  160.h,
              //             'assets/images/vip.png',
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
              // RowImg(
              //   imgLeft: 'assets/images/silver.png',
              //   imgRight: 'assets/images/gold.png',
              //   imgHight: 132.h,
              //   leftImgFn:()=>Get.to(MembershipDetailsPage(img: 'assets/images/silver.png',)) ,
              //   rightImgFn:()=>Get.to(MembershipDetailsPage(img: 'assets/images/gold.png',)) ,
              // ),
              // addH(20.h),
              // RowImg(
              //   imgLeft: 'assets/images/platinum.png',
              //   imgRight: 'assets/images/diamond.png',
              //   imgHight: 132.h,
              //   leftImgFn:()=>Get.to(MembershipDetailsPage(img: 'assets/images/platinum.png',)) ,
              //   rightImgFn:()=>Get.to(MembershipDetailsPage(img: 'assets/images/diamond.png',)) ,
              // ),
              // addH(20.h),
              // SizedBox(
              //   width: 428.w,
              //   height: 135.h,
              //   child: Stack(
              //     alignment: AlignmentDirectional.bottomCenter,
              //     children: [
              //       Positioned(
              //         top: -10,
              //         left: 0,
              //         right: 0,
              //         child: Image.asset(
              //           'assets/images/store.png',
              //         ),
              //       ),
              //       Positioned(
              //         bottom: 50.h,
              //         right: 10.w,
              //         child: TextButton(
              //           onPressed: () {},
              //           child: Text(
              //             'View all',
              //             style: TextStyle(
              //               fontSize: 13.sp,
              //               color: Colors.amber.shade800,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           CustomBtn(
              //             btnFn: () {},
              //             btnText: 'DOG',
              //             btnBgClr: Colors.amber.shade800,
              //             txtSize: 13.sp,
              //             btnSize: Size(90.w, 38.h),
              //             imgUrl: 'assets/svg/dog.svg',
              //             imgHeight: 30.h,
              //           ),
              //           addW(10.w),
              //           CustomBtn(
              //             btnFn: () {},
              //             btnText: 'CAT',
              //             btnBgClr: Colors.white,
              //             txtColor: Colors.black,
              //             borderColor: Colors.grey.shade200,
              //             txtSize: 13.sp,
              //             btnSize: Size(90.w, 38.h),
              //             imgUrl: 'assets/svg/cat.svg',
              //             imgHeight: 30.h,
              //           ),
              //           addW(10.w),
              //           CustomBtn(
              //             btnFn: () {},
              //             btnText: 'OTHERS',
              //             btnBgClr: Colors.white,
              //             txtColor: Colors.black,
              //             borderColor: Colors.grey.shade200,
              //             txtSize: 13.sp,
              //             btnSize: Size(80.w, 38.h),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              addH(40.h),
              // SizedBox(
              //   width: double.infinity,
              //   height: 360.h,
              //   child: ListView.builder(
              //     itemCount: 16,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return  CustomProductItem();
              //     },
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigation(
          selectedNavIndex: _selectedNavIndex,
        ));
  }

  _launchWhatsapp() async {
    //const url = "https://wa.me/?text=YourTextHere"
    const url =
        "https://api.whatsapp.com/message/GWMI3X2GSNASC1?autoload=1&app_absent=0";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: const Text("whatsapp no installed")));
      throw 'Could not launch $url';
    }
  }
}
