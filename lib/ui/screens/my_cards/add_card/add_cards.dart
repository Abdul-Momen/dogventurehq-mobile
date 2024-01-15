import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_dropdown.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);
  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {

  final List<String> _month = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];
  final List<String> _year = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',

  ];

  String _selectedMonth = '03';
  String _selectedYear= '2022';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#F98C10"),
        ),
        toolbarHeight: 129.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
          title: 'Add Cards',
          img_bg: 'assets/images/store_bg.png',
        ),
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              addH(20.h),
              Text(
                'Card Details',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontFamily: ConstantStrings.kAppFont
                ),
              ),
              addH(20),
              const Text('Card Number'),
              addH(10),
              CustomField(
                  h: 50.h, w: double.infinity, hintTxt: 'Enter Card Number',inputType: TextInputType.number),
              addH(20.h),
              const Text('Card Holder Name'),
              addH(10.h),
              // mobile number
              CustomField(
                h: 50.h,
                w: double.infinity,
                hintTxt: 'Enter Card Number',
                inputType: TextInputType.emailAddress,
              ),
              // password
              addH(20.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:   const Text('Month'),
                  ),
                  Expanded(
                    child:  const Text('Year'),
                  ),
                  Expanded(
                    child:   const Text('CVV'),
                  ),
                ],
              ),
              addH(20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomDropDown(
                      initialValue: _selectedMonth,
                      itemList: _month,
                      onChangedFn: (String? value) =>
                          setState(() => _selectedMonth = value!),
                    ),
                  ),
                  addW(10.w),
                  Expanded(
                    child: CustomDropDown(
                      initialValue: _selectedYear,
                      itemList: _year,
                      onChangedFn: (String? value) =>
                          setState(() => _selectedYear = value!),
                    ),
                  ),
                  addW(10.w),

                  Expanded(
                    child:   CustomField(
                        h: 50.h, w: double.infinity, hintTxt: 'CVV',inputType: TextInputType.number),
                  ),



                ],
              ),

              addH(20.h),
              CustomBtn(
                btnSize: Size(388.w, 52.h),
                btnFn: () {},
                btnText:"Save",
                btnBgClr:  Colors.green.shade600 ,
              ),
              addH(20.h),
            ],
          ),
        ),
      ),

    );
  }
}
