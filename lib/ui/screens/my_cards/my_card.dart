import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/my_cards/add_card/add_cards.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#F98C10"),
        ),
        toolbarHeight: 129.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
          title: 'My Cards',
          img_bg: 'assets/images/store_bg.png',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "All Cards",
                    style: TextStyle(
                        fontSize: 25.sp, fontFamily: ConstantStrings.kAppFont),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: (){
                      Get.to(AddCard());
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.orange),
                      minimumSize: Size.fromHeight(40),
                    ),
                    child: const Text(
                      '+ Add / Edit Card',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            addH(20.h),
            
            Card(
              child: Container(
                height: 100.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0,
                    color: Colors.orange,
                  ),
                  borderRadius: const BorderRadius.all
                    (Radius.circular(5.0,
                  ), //                 <--- border radius here
                  ),
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Radio(
                          activeColor: Colors.orange,
                          value: 2,
                          groupValue: 2,
                          onChanged: (value) {
                            print(value); //selected value
                          }),
                    ),
                    addW(10.w),
                    Flexible(
                      flex: 1,
                      child:  Container(
                        height: 80.h,
                        width: 80.w,
                        color: Colors.white,
                        child: Image.asset('assets/images/master_card_logo.png'),
                      ),
                    ),
                    addW(10.w),
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '**** **** **** 9843',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: ConstantStrings.kAppFont,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'expires 10/12-2051',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: ConstantStrings.kAppFontPoppins,
                                  fontSize: 14.sp,
                                ),
                              ),
                              addW(10.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.delete_forever_rounded,
                                size: 15.0,
                                color: Colors.red,
                              ),
                              padding: EdgeInsets.all(5.0),
                              shape: CircleBorder(),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                size: 15.0,
                              ),
                              padding: EdgeInsets.all(5.0),
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: 100.h,
                width: double.infinity.w,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Radio(
                          activeColor: Colors.orange,
                          value: 2,
                          groupValue: 2,
                          onChanged: (value) {
                            print(value); //selected value
                          }),
                    ),
                    addW(10.w),
                    Flexible(
                      flex: 1,
                      child:  Container(
                        height: 80.h,
                        width: 80.w,
                        color: Colors.white,
                        child: Image.asset('assets/images/master_card_logo.png'),
                      ),
                    ),
                    addW(10.w),
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '**** **** **** 9843',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: ConstantStrings.kAppFont,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'expires 10/12-2051',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: ConstantStrings.kAppFontPoppins,
                                  fontSize: 14.sp,
                                ),
                              ),
                              addW(10.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.delete_forever_rounded,
                                size: 15.0,
                                color: Colors.red,
                              ),
                              padding: EdgeInsets.all(5.0),
                              shape: CircleBorder(),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                size: 15.0,
                              ),
                              padding: EdgeInsets.all(5.0),
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
