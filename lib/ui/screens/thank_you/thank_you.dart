import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/my_orders/my_orders.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ThankYou extends StatefulWidget {
  static String routeName = '/thank_you';

  const ThankYou({
    Key? key,
  }) : super(key: key);

  @override
  State<ThankYou> createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    String datetime1 = DateFormat("yyyy-MM-dd").format(data[2]);
    print(datetime1);
    //output: 2021-10-17

    String time = DateFormat.Hms().format(data[2]);
    print(time);
    //output (Time): 20:04:17

    String date = DateFormat.MMMMEEEEd().format(data[2]);
    print(date);

    String datetime4 =
        DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(data[2]);
    print(datetime4);
    //output: Sun, Oct 17, 2021

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 142.h,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(
                  AllMethods.changeAppbarImage(data[0]),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'THANK YOU',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: ConstantStrings.kAppFont,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          addH(30.h),
          SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/img_1.png')),
          addH(30.h),
          Center(
              child: Text(
            'THANK YOU',
            style: TextStyle(
                fontSize: 41.sp, fontFamily: ConstantStrings.kAppFont),
          )),
          addH(25.h),
          const Center(
              child: Text(
            'Your Request Has Been Received',
            style: TextStyle(color: Colors.grey),
          )),
          addH(10.h),
          Center(child: Text('Ticket Number:${data[1]}')),
          addH(10.h),
          Center(child: Text('Event Date And Time: $datetime4 | $time')),
          addH(25.h),
          Center(
              child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed(HomeScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // background (button) color
            ),
            child: Text(
              'BACK TO HOME',
              style: TextStyle(
                  color: Colors.white, fontFamily: ConstantStrings.kAppFont),
            ),
          )),
          if (data[0] == 4)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(HomeScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // background (button) color
                  ),
                  child: Text(
                    'BACK TO HOME',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: ConstantStrings.kAppFont),
                  ),
                )),
                addW(10.w),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(const MyOrderPage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // background (button) color
                  ),
                  child: Text(
                    'Track Your Order',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: ConstantStrings.kAppFont),
                  ),
                )),
              ],
            )
        ],
      ),
    );
  }
}
