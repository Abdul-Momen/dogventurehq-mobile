import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/filter_product_model.dart';
import 'package:dogventurehq/states/models/product_favorite_model.dart';
import 'package:dogventurehq/ui/screens/store/store_details/store_details.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomFilterProductItem extends StatefulWidget {
  final ProductListRequestModel productModel;
  const CustomFilterProductItem({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<CustomFilterProductItem> createState() =>
      _CustomFilterProductItemState();
}

class _CustomFilterProductItemState extends State<CustomFilterProductItem> {
  final StoreController _storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        width: 168.w,
        height: 310.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addH(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.0),
                //     color: Colors.red,
                //   ),
                //   height: 30.h,
                //   width: 50.w,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       addW(5.w),
                //       Flexible(
                //         child: Text(
                //           '20% off',
                //           style:
                //               TextStyle(fontSize: 12.sp, color: Colors.white),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 03.h,
                  width: 50.w,
                ),

                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),

                Text(widget.productModel.totalRating.toString()),
                addW(10.w),
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Obx(() {
                    if (_storeController.isFilterFavoriteLoadingFlag.value) {
                      return CircularProgressIndicator();
                    } else {
                      return InkWell(
                        onTap: () {
                          if (!Preference.getLoggedInFlag()) {
                            return DialogHelper.showToast(
                                'You have must login');
                          }
                          widget.productModel.isWished
                              ? methodCall()
                              : methodCall();
                          setState(
                            () => widget.productModel.isWished =
                                !widget.productModel.isWished,
                          );
                        },
                        child: Icon(
                          widget.productModel.isWished
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: widget.productModel.isWished
                              ? Colors.red
                              : Colors.grey,
                        ),
                      );
                    }
                  }),
                )
              ],
            ),
            Center(
              child: SizedBox(
                  height: 100.h,
                  width: 100.w, // fixed width and height
                  child: CustomImageNetwork(
                    imageUrl: widget.productModel
                        .productMasterMediaViewModels[0].fileLocation,
                  )),
            ),
            Text(
              widget.productModel.productName,
              style: TextStyle(
                fontFamily: ConstantStrings.kAppFontPoppins,
                fontSize: 10.0.sp,
              ),
            ),
            Text(
              "1.2kg Pack",
              style: TextStyle(
                color: HexColor("#838383"),
                fontFamily: ConstantStrings.kAppFontPoppins,
                fontSize: 9.0.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100.w,
                    child: CustomRichText(
                      text: widget
                          .productModel.productSubSkuRequestModels[0].symbol,
                      textRich: '  ' +
                          widget
                              .productModel.productSubSkuRequestModels[0].price
                              .toString(),
                      textRichColor: '#155D84',
                    )),
                // SizedBox(
                //   width: 90.w,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         "AED",
                //         style: TextStyle(
                //           fontSize: 11.sp,
                //         ),
                //       ),
                //       Text(
                //         "695",
                //         style: TextStyle(
                //           fontSize: 11.sp,
                //           decoration: TextDecoration.lineThrough,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            Center(
              child: CustomBtn(
                btnFn: () {
                  Get.toNamed(StoreDetails.routeName,
                      arguments: widget.productModel.productMasterId);
                },
                btnText: 'View Details',
                btnBgClr: Colors.green,
                btnSize: Size(160.w, 40.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  methodCall() {
    FavoriteProductModel fav = FavoriteProductModel(
      customerId: Preference.getUserId(),
      productMasterId: widget.productModel.productMasterId,
      tempId: '',
      productSubSkuId: 0,
      ipAddress: '',
    );
    _storeController.addFavoriteProduct(fav);
  }
}
