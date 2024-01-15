import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/about/about.dart';
import 'package:dogventurehq/ui/screens/blog/blog.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/membership/membership.dart';
import 'package:dogventurehq/ui/screens/my_appointments/my_appointments.dart';
import 'package:dogventurehq/ui/screens/my_cart/my_cart.dart';
import 'package:dogventurehq/ui/screens/my_events/my_event.dart';
import 'package:dogventurehq/ui/screens/my_orders/my_orders.dart';
import 'package:dogventurehq/ui/screens/my_pets/my_pets.dart';
import 'package:dogventurehq/ui/screens/my_profile/profile.dart';
import 'package:dogventurehq/ui/screens/price_guide/price_guide.dart';
import 'package:dogventurehq/ui/screens/privacy_policy/privacy_policy.dart';
import 'package:dogventurehq/ui/screens/store_wishlist/store_wishlist.dart';
import 'package:dogventurehq/ui/screens/terms_and_conditions/terms_and_conditions.dart';
import 'package:dogventurehq/ui/screens/wallet/my_wallet.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/drawer_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../wishlist/wishlist.dart';

class CustomDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawer({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250.h,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Image.asset(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 200,
                    'assets/images/drawer_bg.png',
                  ),
                  Positioned(
                    top: 80.h,
                    right: 50.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(70.0.h),
                              child: CustomImageNetwork(
                                imageUrl: Preference.getUserImageFlag(),
                              )),
                        ),
                        addH(10.h),
                        Text(
                          Preference.getNameFlag(),
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: ConstantStrings.kAppFont),
                        ),
                        Text(
                          Preference.getPhoneFlag(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: ConstantStrings.kAppFontPoppins),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1265.h,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Image.asset(
                    fit: BoxFit.fill,
                    width: 400.w,
                    height: 860.h,
                    'assets/images/drawer_item_bg.png',
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Column(
                            children: [
                              DrawerItem(
                                onClick: () {
                                  scaffoldKey.currentState?.openEndDrawer();
                                  Get.to(const HomeScreen());
                                },
                                name: 'Home',
                                icon: 'assets/svg/home_icon.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const MyProfilePage());
                                },
                                name: 'My Profile',
                                icon: 'assets/svg/profile.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.toNamed(MyPetsPage.routeName);
                                },
                                name: 'My Pets',
                                icon: 'assets/svg/pet.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.toNamed(PriceGuideScreen.routeName);
                                },
                                name: 'Price Guide',
                                icon: 'assets/svg/appoinment.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const MyCartPage());
                                },
                                name: 'My Cart',
                                icon: 'assets/svg/cart.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const MyOrderPage());
                                },
                                name: 'My Orders',
                                icon: 'assets/svg/appoinment.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const MyAppointments());
                                },
                                name: 'My Appointments',
                                icon: 'assets/svg/appoinment.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const MyEvents());
                                },
                                name: 'My Events',
                                icon: 'assets/svg/appoinment.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const MyWalletPage());
                                },
                                name: 'My Wallet',
                                icon: 'assets/svg/appoinment.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const Membership());
                                },
                                name: 'Membership',
                                icon: 'assets/svg/membership_icon.svg',
                              ),
                              // DrawerItem(
                              //   onClick: () {
                              //     Get.to(PackagePage());
                              //   },
                              //   name: 'Activites',
                              //   icon: 'assets/svg/home_icon.svg',
                              // ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const StoreWishlist());
                                },
                                name: 'MY Wish List',
                                icon: 'assets/svg/wishlist.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  Get.to(const Wishlist());
                                },
                                name: 'Event Wish List',
                                icon: 'assets/svg/wishlist.svg',
                              ),
                              // DrawerItem(
                              //   onClick: () {
                              //     Get.to(AddressBook());
                              //   },
                              //   name: 'Address Book',
                              //   icon: 'assets/svg/home_icon.svg',
                              // ),
                              //
                              DrawerItem(
                                onClick: () {
                                  Get.to(const MyBlog());
                                },
                                name: 'Blog',
                                icon: 'assets/svg/about.svg',
                              ),

                              DrawerItem(
                                onClick: () {
                                  Get.to(const AboutUsPage());
                                },
                                name: 'About us',
                                icon: 'assets/svg/about.svg',
                              ),
                              DrawerItem(
                                onClick: () {
                                  scaffoldKey.currentState?.openEndDrawer();
                                  Get.to(const LoginScreen());
                                  Preference.clearAll();
                                },
                                name: Preference.getLoggedInFlag()
                                    ? 'Logout'
                                    : 'LogIn',
                                icon: 'assets/svg/logout.svg',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 180.h,
                          width: double.infinity.w,
                          child: Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Image.asset(
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: 180.h,
                                'assets/images/drawer_bottom_bg.png',
                              ),
                              Positioned(
                                top: 40,
                                right: 20,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            _launchUrl(
                                                'https://www.facebook.com/DogventureHQ/');
                                          },
                                          child: SvgPicture.asset(
                                            'assets/svg/fb.svg',
                                            height: 25.h,
                                          ),
                                        ),
                                        addW(35.w),
                                        InkWell(
                                          onTap: () {
                                            _launchUrl(
                                                'https://www.instagram.com/dogventurehq/?hl=en');
                                          },
                                          child: SvgPicture.asset(
                                            'assets/svg/instra.svg',
                                            height: 25.h,
                                          ),
                                        ),
                                        addW(35.w),
                                        InkWell(
                                          onTap: () {
                                            _launchUrl('');
                                          },
                                          child: SvgPicture.asset(
                                            'assets/svg/linkdin.svg',
                                            height: 25.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    addH(15.h),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(const TermsAndConditions());
                                          },
                                          child: Text(
                                            "Terms & Conditions",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: ConstantStrings
                                                    .kAppFontPoppins),
                                          ),
                                        ),
                                        addW(25.w),
                                        InkWell(
                                          onTap: () {
                                            Get.to(const PrivacyPolicy());
                                          },
                                          child: Text(
                                            "Privacy Policy",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: ConstantStrings
                                                    .kAppFontPoppins),
                                          ),
                                        ),
                                      ],
                                    ),
                                    addH(20.h),
                                    Text(
                                      "© 2022 Dogventure HQ. All Right Reserved",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontFamily:
                                              ConstantStrings.kAppFontPoppins),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_launchUrl(String url) async {
  //const url = "https://wa.me/?text=YourTextHere"
  // const url = "http://dogventure.okommerce.com//Content/ActivityWavier/event/DHQEvent.pdf";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
