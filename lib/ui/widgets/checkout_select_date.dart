import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CheckInOutSelectDate extends StatefulWidget {
  final String titleText;
  final void Function(DateTime) getSelectedDate;
  const CheckInOutSelectDate({
    Key? key,
    required this.titleText,
    required this.getSelectedDate,
  }) : super(key: key);

  @override
  State<CheckInOutSelectDate> createState() => _CheckInOutSelectDateState();
}

class _CheckInOutSelectDateState extends State<CheckInOutSelectDate> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titleText),
        addH(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              width: 280.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Center(
                child: Text(
                  _selectedDate.toString().substring(0, 10),
                  style: TextStyle(fontSize: 17.sp, color: Colors.grey),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                    widget.getSelectedDate(_selectedDate);
                  });
                }
              },
              child: Container(
                height: 50.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: HexColor('#F0FAFF'),
                  border: Border.all(
                    color: HexColor('#155D84'),
                  ),
                ),
                child: Icon(
                  Icons.calendar_month,
                  color: HexColor('#155D84'),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
