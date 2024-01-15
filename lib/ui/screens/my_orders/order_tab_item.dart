import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/my_events_model.dart';
import 'package:dogventurehq/ui/screens/my_order_details/my_order_details.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderTabItem extends StatelessWidget {

  final MyEventsModel model ;
  const OrderTabItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () {
           // Get.to(MyOrderDetails());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
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
                        child:  CustomImageNetwork(imageUrl: model.invoiceDetailsViewModels[0].mediumImage,) ,
                      ),
                    ),
                    addW(20.w),
                    Flexible(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            model.invoiceViewModels[0].storeViewModel.shopName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: ConstantStrings.kAppFont,
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                'BOOKING ID:',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.sp,
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                model.refNumber,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontFamily: ConstantStrings.kAppFont,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomRichText(
                            text: model.paymentViewModels[0].currencyViewModel.symbol,
                            textRich:" "+ model.invoiceDetailsViewModels[0].price.toString(),
                            textRichSize: 18.sp,
                            textRichColor: "#155D84",
                            fontFamily: ConstantStrings.kAppFontPoppins,
                          ),
                          Text(
                            model.status,
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: ConstantStrings.kAppFont,
                                fontSize: 18.sp),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
