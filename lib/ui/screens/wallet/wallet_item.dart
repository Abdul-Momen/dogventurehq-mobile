import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../states/models/my_wallet_transection_model.dart';

class WalletItem extends StatelessWidget {
  final MyWalletTransectionModel model;
  final bool isOut;

  const WalletItem({Key? key, required this.model, required this.isOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child:  Container(
                height: 80.h,
                width: 80.w,
                color: Colors.white,
                child:isOut?Image.asset('assets/images/debit_icon.png'):Image.asset('assets/images/in_wallet.png'),
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
                    'Invoice Payment',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantStrings.kAppFontPoppins,
                    ),
                  ),
                  Text(
                   "Added on- "+ DateFormat('yyyy-MM-dd – kk:mm aa').format(model.transactionDate),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppFontPoppins,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '+AED '+ model.amount.toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 24.sp,
                          fontFamily: ConstantStrings.kAppFont,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
