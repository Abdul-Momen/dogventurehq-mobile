import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../states/controllers/store_controller.dart';
import '../../states/data/prefs.dart';

class CustomTitlebar extends StatefulWidget {
  final String img_bg;
  final String title;

  const CustomTitlebar({
    Key? key,
    required this.title,
    required this.img_bg,
  }) : super(key: key);

  @override
  State<CustomTitlebar> createState() => _CustomTitlebarState();
}

class _CustomTitlebarState extends State<CustomTitlebar> {
  final StoreController _storeController = Get.put(StoreController());

  @override
  void initState() {
    _storeController.getCartList(Preference.getUserId().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 129.h,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.asset(
            widget.img_bg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Positioned(
            top: 46.h,
            left: 18.w,
            right: 18.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset(
                    'assets/svg/back.svg',
                    height: 40.h,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.sp,
                      fontFamily: ConstantStrings.kAppFont),
                ),
                SizedBox(
                  width: 70.w,
                  height: 25.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(const NotificationPage());
                      //   },
                      //   child: Badge(
                      //     badgeContent: const Text('0', style: TextStyle(
                      //         color: Colors.white)),
                      //     badgeColor: Colors.red,
                      //     shape: BadgeShape.square,
                      //     child: SvgPicture.asset(
                      //       'assets/svg/notification.svg',
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(const MyCartPage());
                      //   },
                      //   child: Obx(() {
                      //     if(_storeController.cartListLoadingFlag.value){
                      //       return SvgPicture.asset(
                      //         'assets/svg/cart.svg',
                      //       );
                      //     }else{
                      //       return Badge(
                      //         badgeContent: Text(
                      //             _storeController.cartList.length.toString(),
                      //             style: const TextStyle(color: Colors.white)),
                      //         badgeColor: Colors.red,
                      //         shape: BadgeShape.circle,
                      //         child: SvgPicture.asset(
                      //           'assets/svg/cart.svg',
                      //         ),
                      //       );
                      //     }
                      //
                      //   }),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
