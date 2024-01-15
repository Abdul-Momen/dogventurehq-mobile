import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/price_guide/price_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroomingPage extends StatelessWidget {
  const GroomingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Table(
            border: TableBorder.all(color: Colors.white),
            columnWidths: {
              0: FlexColumnWidth(1.3),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(1.3),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
              5: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: [
                  PriceItem(
                    txt: 'SERVICES',
                    clr: ConstantColors.kGrooming,
                    tClr: Colors.white,
                  ),
                  PriceItem(
                    txt: 'OFFER',
                    clr: ConstantColors.kGrooming,
                    width: 100.w,
                    tClr: Colors.white,

                  ),
                  PriceItem(
                    txt: 'DURATION',
                    clr: ConstantColors.kGrooming,
                    tClr: Colors.white,

                  ),
                  PriceItem(
                    txt: 'SMALL',
                    clr: ConstantColors.kGrooming,
                    tClr: Colors.white,

                  ),
                  PriceItem(
                    txt: 'MEDIUM',
                    clr: ConstantColors.kGrooming,
                    tClr: Colors.white,

                  ),
                  PriceItem(
                    txt: 'LARGE',
                    clr: ConstantColors.kGrooming,
                    tClr: Colors.white,

                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  color: ConstantColors.kGroomingAccent2,
                  child: Center(
                    child: Text(
                      'DOGS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1.3),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1),
                  },
                  border: TableBorder.all(color: Colors.white),
                  children: [
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'BASIC GROOMING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                          width: 100.w,

                        ),
                        PriceItem(
                          txt: '1.5 H	',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '120 AED	',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '150 AED	',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '180 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'FULL GROOMING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                          width: 100.w,

                        ),
                        PriceItem(
                          txt: '2.5 H',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '220 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '250 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '290 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'HAND STRIPPING GROOMING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                          width: 100.w,

                        ),
                        PriceItem(
                          txt: '2.5 H',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '250 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '280 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '320 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'DESHEDDING GROOMING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                          width: 100.w,

                        ),
                        PriceItem(
                          txt: '2 H',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '220 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '250 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '280 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'COMPLETE SHAVING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                          width: 100.w,
                        ),
                        PriceItem(
                          txt: '1.5 H',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '120 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '150 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '180 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 360.h,
                  width: double.infinity,
                  color: ConstantColors.kGroomingAccent,
                  child: Center(
                    child: Text(
                      'ADD-ONS FOR DOGS',
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1.3),
                    2: FlexColumnWidth(3),

                  },
                  border: TableBorder.all(color: Colors.white),
                  children: [
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'DEMATTING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: 'PER 30 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '50 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'PAWDICURE',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '25 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '60 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'MASSAGE',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '25 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '45 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'NAIL CLIPPING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '10 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '35 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'TEETH BRUSHING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '15 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '40 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'EAR CLEANING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '10 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '40 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'MEDICATED SHAMPOO',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '15 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '35 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'DRYING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '30 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                        PriceItem(
                          txt: '80 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        PriceItem(
                          txt: 'BRUSHING',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '45 MIN',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                        PriceItem(
                          txt: '60 AED',
                          height: 40.h,
                          clr: ConstantColors.kGroomingAccent2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Table(
            border: TableBorder.all(color: Colors.white),
            columnWidths: {
              0: FlexColumnWidth(1.3),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(1.3),
              3: FlexColumnWidth(3),

            },
            children: [
              TableRow(
                children: [
                  PriceItem(
                    txt: 'CATS',
                    clr: ConstantColors.kGroomingAccent2,
                  ),
                  PriceItem(
                    txt: 'FULL GROOMING	',
                    clr: ConstantColors.kGroomingAccent2,
                  ),
                  PriceItem(
                    txt: '2.5 H',
                    clr: ConstantColors.kGroomingAccent2,
                  ),
                  PriceItem(
                    txt: '200 AED',
                    clr: ConstantColors.kGroomingAccent2,
                  ),

                ],
              ),
            ],
          ),

          Container(
            height: 100.h,
            width: double.infinity,
            color: ConstantColors.kGrooming,
            child: Center(
              child: Text(
                'GROOMING SERVICES',
                style: TextStyle(
                  fontFamily: ConstantStrings.kAppFont,
                  fontSize: 30.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
