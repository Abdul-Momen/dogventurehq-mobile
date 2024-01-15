import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/payment/payment.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_product_item.dart';
import 'package:dogventurehq/ui/screens/my_cart/cart_item.dart';
import 'package:dogventurehq/ui/screens/my_order_details/order_item.dart';
import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  // final CartListController _cartListController = Get.find<CartListController>();
  final StoreController _storeController = Get.put(StoreController());

  @override
  void initState() {
    super.initState();
    _storeController.getCartList(Preference.getUserId().toString());
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
          title: 'My Cart',
          img_bg: 'assets/images/store_bg.png',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 75.0),
        child: SingleChildScrollView(
          child: Obx(() {
            if (_storeController.cartListLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_storeController.cartList == null) {
                return const Text('no data found...');
              } else {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _storeController.cartList.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                        cartItem: _storeController.cartList[index],
                        totalFn: () {
                          setState(() {
                            _totalCartPrice();
                          });
                        },
                      );
                    });
              }
            }
          }),
        ),
      ),
      bottomSheet: Obx(() {
        if (_storeController.cartListLoadingFlag.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (_storeController.cartList.isEmpty) {
            return const Center(child: Text('Cart ist Empty'));
          } else {
            return SizedBox(
              height: 100.h,
              width: double.infinity.w,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: ConstantStrings.kAppFontPoppins,
                            ),
                          ),
                          Obx(() {
                            if (_storeController.cartListLoadingFlag.value) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (_storeController.cartList == null) {
                                return const Text('no data found...');
                              } else {
                                return CustomRichText(
                                  text: "AED",
                                  textRich: _totalCartPrice().toString(),
                                  textRichSize: 30.sp,
                                  textRichColor: "#155D84",
                                  fontFamily: ConstantStrings.kAppFontPoppins,
                                );
                              }
                            }
                          }),
                        ],
                      ),
                    ),
                    addW(10.w),
                    Expanded(
                      flex: 6,
                      child: CustomBtn(
                        btnFn: () {
                          // Get.back();
                          Get.toNamed(PaymentPage.routeName,
                              arguments: [4, _totalCartPrice()]);
                        },
                        btnText: 'CheekOut',
                        btnBgClr: Colors.green,
                        btnSize: Size(120.w, 40.h),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }
      }),
    );
  }

  _totalCartPrice() {
    // price calculation logic
    double totalAmount = 0.0;
    for (int i = 0; i < _storeController.cartList.length; i++) {
      totalAmount = totalAmount +
          (_storeController.cartList[i].price) *
              _storeController.cartList[i].quantity;
    }
    return totalAmount.toDouble();
  }
}
