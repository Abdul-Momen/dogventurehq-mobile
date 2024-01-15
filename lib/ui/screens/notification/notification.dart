import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/my_order_details/order_item.dart';
import 'package:dogventurehq/ui/screens/notification/notification_item.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
            title: "Notification", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: SizedBox(
        height: 775.h,
        width: double.infinity.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addH(20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,),
              child: Text("Today",
              style: TextStyle(
                fontSize: 30.sp,
                fontFamily: ConstantStrings.kAppFont
              ),),
            ),
            addH(10.h),
            Container(
              height: 680.h,
              width: double.infinity.w,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return NotificationItem();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
