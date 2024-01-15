import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/ui/screens/wishlist/wishlist_item.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Wishlist extends StatefulWidget {
  static String routeName = '/events';

  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final EventController _eventController = Get.put(EventController());

  @override
  void initState() {
    _eventController.getWishList();
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
            title: "Wishlist", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Column(
        children: [
          addH(20.h),
          SizedBox(
            width: double.infinity,
            height: 740.h,
            child: Obx(() {
              if (_eventController.wishlistLoadingFlag.value) {
                //print(_eventCon.eventlist.toString());
                return const Center(child: CircularProgressIndicator());
              } else {
                if (_eventController.wishList.isEmpty) {
                  return const Text('No data found');
                } else {
                  return ListView.builder(
                      itemCount: _eventController.wishList.length,
                      itemBuilder: (context, index) {
                        return WishListItem(
                          eventModel: _eventController.wishList[index],
                          isFav: 1,
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
