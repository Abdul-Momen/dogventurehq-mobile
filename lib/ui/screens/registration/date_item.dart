import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DateItem extends StatefulWidget {
  final String time;

  final Function(String value) onTimeTap;

  DateItem({
    Key? key,
    required this.time,
    required this.onTimeTap,
  }) : super(key: key);

  @override
  State<DateItem> createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  final RegistrationController _registrationController=Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Container(
        height: 50.h,
        width: 120.w,
        decoration: BoxDecoration(
          color: _registrationController.selectTime==widget.time ?  HexColor('#33B1C4'):HexColor('#F0FAFF') ,
          border: Border.all(
            color: Colors.black12, // red as border color
          ),
        ),
        child: OutlinedButton(
          onPressed: () {
            widget.onTimeTap(widget.time);
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: HexColor('#33B1C4')),
            minimumSize: Size.fromHeight(50),
          ),
          child: Text(
            widget.time,
            style: TextStyle(
                color: _registrationController.selectTime==widget.time ?  HexColor('#FFFFFF'):HexColor('#155D84') ,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
