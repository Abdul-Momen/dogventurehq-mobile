import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
import 'package:dogventurehq/ui/widgets/custom_bottom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_payment.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../states/controllers/registration_controller.dart';
import '../../../states/data/prefs.dart';

class PaymentDialog extends StatefulWidget {
  final int screenNumValue;
  final double totalPrice;
  final String fromPage;
  final VoidCallback orderPlaceFn;
  const PaymentDialog({
    super.key,
    required this.screenNumValue,
    required this.totalPrice,
    required this.fromPage,
    required this.orderPlaceFn,
  });

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  final RegistrationController _regCon = Get.put(RegistrationController());
  bool _isOnline = true;
  bool _showWebView = false;

  InAppWebViewController? _wvCon;

  @override
  void initState() {
    _regCon.getOrderPayment(
      cID: Preference.getUserId(),
      totalAmount: widget.totalPrice,
      fromPage: widget.fromPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:
              HexColor(AllMethods.getStatusBarColor(widget.screenNumValue)),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: CustomTitlebar(
          title: "PAYMENT",
          img_bg: AllMethods.changeAppbarImage(widget.screenNumValue),
        ),
      ),
      body: _showWebView
          ? Center(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    _regCon.pInfoModel!.keyData,
                  ),
                ),
                onWebViewCreated: (controller) {
                  _wvCon = controller;
                },
                onLoadStart: (controller, url) async {
                  print("Starting URL: ${url!.path}");
                  print("Query String: ${url.query}");
                  if (url.path.contains('/${widget.fromPage}/order')) {
                    controller.stopLoading();
                    bool resFlag = await _regCon.getPamymentStatus(
                      reference: url.query.substring(4),
                      token: _regCon.pInfoModel!.ephemeralKey,
                    );
                    if (resFlag) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Payment Completed Successfully!',
                          ),
                        ),
                      );
                      Get.back();
                      Get.offAllNamed(
                        ThankYou.routeName,
                        arguments: [
                          2,
                          '',
                          DateTime.now().toString(),
                        ],
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Payment Failed!',
                          ),
                        ),
                      );
                      Get.back();
                    }
                  }
                },
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 757.h,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addH(30.h),
                            CustomPaymentItem(
                              totalPrice: widget.totalPrice,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SELECT PAYMENT',
                                  style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 25.sp,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _isOnline,
                                      onChanged: (value) => setState(
                                        () => _isOnline = value!,
                                      ),
                                    ),
                                    const Text(
                                      'Online',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    addW(10.w),
                                    Checkbox(
                                      value: !_isOnline,
                                      onChanged: (value) => setState(
                                        () => _isOnline = !value!,
                                      ),
                                    ),
                                    const Text(
                                      'Wallet',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                if (!_isOnline)
                                  Card(
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.orange,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit,
                                            color: Colors.orange,
                                          ),
                                          addW(10.w),
                                          Text(
                                            'USE THE WALLET',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                letterSpacing: 0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomSheet: _showWebView
          ? null
          : Obx(() {
              if (_regCon.oPaymentLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (_regCon.pInfoModel == null) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                } else {
                  return CustomBottomBtn(
                    lftBtnTxt: 'Cancel',
                    lftBtnFn: () {},
                    rightBtnTxt: 'Pay Now',
                    rightBtnFn: () => setState(
                      () => _showWebView = true,
                    ),
                  );
                }
              }
            }),
    );
  }
}
