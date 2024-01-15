import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/add_address/add_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AddressRowBtn extends StatelessWidget {
  const AddressRowBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                           Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "Delivery Address",
            style: TextStyle(
                fontSize: 25.sp,
                fontFamily: ConstantStrings.kAppFont),
          ),
        ),
        Expanded(
          flex: 2,
          child: OutlinedButton(
            onPressed: (){
              Get.to(AddAddress());
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                  width: 1.0, color: HexColor('#155D84')),
              minimumSize: Size.fromHeight(40),
            ),
            child: const Text(
              '+ Add New address',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );

  }
}
