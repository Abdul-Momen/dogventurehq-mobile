import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaymentItem extends StatelessWidget {
  final double? totalPrice;
  const CustomPaymentItem({Key? key, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200.h,
      width: double.infinity.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SUMMARY',
            style: TextStyle(
              fontSize: 25.sp,
              fontFamily: ConstantStrings.kAppFont,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Sub total ',
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: ConstantStrings.kAppFontPoppins),
                  ),
                  const Text(
                    '(Induding VAT)',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  )
                ],
              ),
              CustomRichText(
                text: "AED ",
                textRich: totalPrice.toString(),
                textSize: 12.sp,
                textRichSize: 25.sp,
                fontFamily: ConstantStrings.kAppFont,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('Service Charge',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: ConstantStrings.kAppFontPoppins)),
              CustomRichText(
                text: "SDG",
                textRich: " 0",
                textSize: 12.sp,
                textRichSize: 25.sp,
                fontFamily: ConstantStrings.kAppFont,
              )
            ],
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 56.h,
                width: double.infinity.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Total Payable Amount',style: TextStyle(
                        fontSize: 11,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomRichText(
                        text: "SDG ",
                        textRich: totalPrice.toString(),
                        textSize: 8,
                        textRichSize: 24,
                        textRichColor: "#F98C10",
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
