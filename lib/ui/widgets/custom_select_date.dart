import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CustomSelectDate extends StatefulWidget {
  const CustomSelectDate({Key? key}) : super(key: key);

  @override
  State<CustomSelectDate> createState() => _CustomSelectDateState();
}

class _CustomSelectDateState extends State<CustomSelectDate> {
  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Date:'),
        addH(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              width: 300.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12, // red as border color
                ),
              ),
              child: Obx(
                () => Center(
                  child: _registrationController.selectDate.value.isNotEmpty
                      ? Text(
                          _registrationController.selectDate.value,
                          style: TextStyle(fontSize: 17.sp, color: Colors.grey),
                        )
                      : Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          style: TextStyle(fontSize: 17.sp, color: Colors.grey),
                        ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate);

                  //formatted date output using intl package =>  2021-03-16
                  _registrationController.selectDate.value = formattedDate;

                  //set output date to TextField value.
                  print(_registrationController.selectDate.value);
                } else {}
              },
              child: Container(
                height: 50.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: HexColor('#F0FAFF'),
                  border: Border.all(
                    color: HexColor('#155D84'), // red as border color
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
