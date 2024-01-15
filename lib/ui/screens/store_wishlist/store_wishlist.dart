import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/ui/screens/events/event_item.dart';
import 'package:dogventurehq/ui/screens/wishlist/wishlist_item.dart';
import 'package:dogventurehq/ui/widgets/custom_dropdown.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'store_wishlist_item.dart';

class StoreWishlist extends StatefulWidget {
  static String routeName = '/events';

  const StoreWishlist({Key? key}) : super(key: key);

  @override
  State<StoreWishlist> createState() => _WishlistState();
}

class _WishlistState extends State<StoreWishlist> {

 // final StoreController _storeController=Get.find<StoreController>();
  final StoreController _storeController=Get.put(StoreController());

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
            title: "MY Wishlist", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Column(
        children: [
          addH(20.h),
          SizedBox(
            width: double.infinity,
            height: 740.h,
            child: Obx(() {
              if (_storeController.productWishListLoadingFlag.value) {
                //print(_eventCon.eventlist.toString());
                return Center(child: CircularProgressIndicator());
              } else {
                if (_storeController.wishlist.isEmpty) {
                  return Text('No data found');
                } else {
                  return ListView.builder(
                      itemCount: _storeController.wishlist.length,
                      itemBuilder: (context, index) {
                        return StoreWishListItem(
                          model: _storeController.wishlist[index],
                        );
                      });
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
