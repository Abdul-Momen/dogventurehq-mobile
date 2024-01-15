import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/my_order_details/order_item.dart';
import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_payment.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../states/controllers/store_controller.dart';
import '../my_cart/cart_item.dart';

class MyOrderDetails extends StatefulWidget {
  const MyOrderDetails({Key? key}) : super(key: key);

  @override
  State<MyOrderDetails> createState() => _MyOrderDetailsState();
}

class _MyOrderDetailsState extends State<MyOrderDetails> {

  final StoreController _storeController = Get.put(StoreController());

  @override
  void initState() {
    _storeController.getCartList('20220930101254');
    super.initState();
  }

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
          title: 'Order Details',
          img_bg: 'assets/images/store_bg.png',
        ),
      ),
      body: SizedBox(
        height: 776.h,
        width: double.infinity.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              addH(30.h),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Store',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21.sp,
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Oreder ID : ',
                          style: TextStyle(
                            color: HexColor('#B8B8B8'),
                            fontSize: 28.sp,
                            fontFamily: ConstantStrings.kAppFont,
                          ),
                        ),
                        addH(5.h),
                        Text(
                          '#351512414',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontFamily: ConstantStrings.kAppFont,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Obx(() {
              //   if(_storeController.cartListLoadingFlag.value){
              //     return Center(child: CircularProgressIndicator());
              //   }else{
              //     if(_storeController.cartList==null){
              //       return Text('no data found...');
              //     }else{
              //       return ListView.builder(
              //           scrollDirection: Axis.vertical,
              //           physics: const ClampingScrollPhysics(),
              //           shrinkWrap: true,
              //           itemCount: _storeController.cartList.length,
              //           itemBuilder: (context, index) {
              //             return CartItem(_storeController.cartList[index]);//=====================================================================
              //           });
              //     }
              //   }
              // }),

              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return OrderDetailsItem();
                  }),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: CustomPaymentItem(),
              // ),
              Padding(
                padding:
                const EdgeInsets.only( left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Expanded(
                      child: OutlinedButton(
                        onPressed: null,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Colors.red),
                          minimumSize: Size.fromHeight(50),
                        ),
                        child: const Text(
                          'Cancel Order',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    addW(10.w),
                    Expanded(
                      child: CustomBtn(
                        btnFn: () {
                          Get.back();
                        },
                        btnText: 'Try Again',
                        btnBgClr: Colors.green,
                        btnSize: Size(10.w, 40.h),
                      ),
                      ),
                  ],
                ),
              ),
              addH(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
