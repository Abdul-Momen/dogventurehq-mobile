import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(
          5.0,
        ) //                 <--- border radius here
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
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: ConstantStrings.kAppFont,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Asif Rahaman',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: ConstantStrings.kAppFontPoppins,
                        fontSize: 14.sp,
                      ),
                    ),
                    addW(10.w),
                    CustomIconWithText(address: '+971 0554830687',logo: "assets/svg/call.svg",)
                  ],
                ),
                CustomIconWithText(address: '56 3 B St - Al QuozAl Quoz 1 - Dubai 26 km')
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
    );
  }
}
