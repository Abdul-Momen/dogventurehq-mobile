import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/add_address/add_address.dart';
import 'package:dogventurehq/ui/screens/address_book/address_item.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({Key? key}) : super(key: key);

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  int _radioSelected = 1;
  String _radioVal = "one";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#F98C10"),
        ),
        toolbarHeight: 119.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
          title: 'Address book',
          img_bg: 'assets/images/store_bg.png',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "All Address",
                    style: TextStyle(
                        fontSize: 25.sp, fontFamily: ConstantStrings.kAppFont),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: (){
                      Get.to(AddAddress());
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: HexColor('#155D84')),
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
            ),
            addH(20.h),
            AddressItem()
          ],
        ),
      ),
    );
  }
}
