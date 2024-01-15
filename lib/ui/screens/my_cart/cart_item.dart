import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../states/controllers/addToCartController.dart';
import '../../../states/data/prefs.dart';
import '../../../states/models/cartListResponseModel.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_image_network.dart';

class CartItem extends StatefulWidget {
  final CartListResponseModel cartItem;
  final VoidCallback totalFn;

  const CartItem({
    Key? key,
    required this.cartItem,
    required this.totalFn,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final AddToCartController _addToCartController =
      Get.put(AddToCartController());

  final StoreController _storeController = Get.put(StoreController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      color: Colors.white,
                      child: CustomImageNetwork(
                          imageUrl: widget.cartItem.smallImage),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.cartItem.productName,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: ConstantStrings.kAppFont,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '350 gm',
                              style: TextStyle(
                                color: HexColor('#838383'),
                                fontSize: 12.sp,
                                fontFamily: ConstantStrings.kAppFontPoppins,
                              ),
                            ),
                          ],
                        ),
                        addH(10.h),
                        CustomRichText(
                          text: "AED",
                          textRich:
                              " ${(widget.cartItem.price * widget.cartItem.quantity).toStringAsFixed(2)}",
                          textRichSize: 18.sp,
                          textRichColor: "#155D84",
                          fontFamily: ConstantStrings.kAppFontPoppins,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              DialogHelper.showConfirmDialog(
                                  rightBtnPressed: () {
                                _addToCartController
                                    .removeFromCart(widget.cartItem.cartId);

                                Get.defaultDialog(
                                    title: 'Processing..',
                                    content: Obx(() {
                                      if (_addToCartController
                                          .removeFromCartLoadingFlag.value) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        if (_addToCartController.response !=
                                            null) {
                                          Future.delayed(
                                              const Duration(seconds: 1),
                                              () async {
                                            _storeController.getCartList(
                                                Preference.getUserId()
                                                    .toString());
                                            Get.back();
                                            Get.back();
                                          });
                                          return const Text(
                                              'Successfully Deleted');
                                        } else {
                                          return Column(
                                            children: [
                                              const Text('Loading... failed'),
                                              addH(20.h),
                                              CustomBtn(
                                                btnFn: () {
                                                  Get.back();
                                                  _storeController.getCartList(
                                                      Preference.getUserId()
                                                          .toString());
                                                },
                                                btnText: 'Try Again',
                                                btnBgClr: Colors.green,
                                                btnSize: Size(120.w, 40.h),
                                              )
                                            ],
                                          );
                                        }
                                      }
                                    }),
                                    radius: 10.0);
                              }, leftBtnPressed: () {
                                if (Get.isDialogOpen!) Get.back();
                              });
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        addH(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // if (count == 1) {
                                  //   count = 1;
                                  // } else {
                                  //   count = count - 1;
                                  // }

                                  if (widget.cartItem.quantity > 1) {
                                    widget.cartItem.quantity--;
                                    widget.totalFn();
                                  }
                                });
                              },
                              child: Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                ),
                                child: Center(
                                    child: Text(
                                  '-',
                                  style: TextStyle(fontSize: 20.sp),
                                )),
                              ),
                            ),
                            //ElevatedButton(onPressed: (){}, child: Icon(Icons.add)),
                            addW(10.h),
                            Text(
                              widget.cartItem.quantity.toInt().toString(),
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            addW(10.h),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // w = count + 1;
                                  widget.cartItem.quantity++;
                                  widget.totalFn();
                                });
                              },
                              child: Container(
                                color: Colors.green,
                                height: 30.h,
                                width: 30.w,
                                child: Center(
                                    child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                )),
                              ),
                            ),
                            addW(10.h),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
