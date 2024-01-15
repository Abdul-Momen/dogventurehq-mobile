import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/price_guide/price_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayCarePage extends StatelessWidget {
  const DayCarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(color: Colors.white),
          children: const [
            TableRow(
              children: [
                PriceItem(txt: 'SERVICES',tClr: Colors.white,),
                PriceItem(txt: 'OFFER',tClr: Colors.white,),
                PriceItem(txt: 'TIMING',tClr: Colors.white,),
                PriceItem(txt: 'VALIDITY',tClr: Colors.white,),
                PriceItem(txt: 'PRICE',tClr: Colors.white,),
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
                color: Colors.amber,
                child: Center(
                  child: Text(
                    'DAY CARE',style: TextStyle(
                    fontFamily: ConstantStrings.kAppFont,
                  ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Table(
                border: TableBorder.all(color: Colors.white),
                children: [
                  TableRow(
                    children: [
                      PriceItem(txt: 'DAILY (7 AM TO 8 PM)',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: 'PER DAY',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: 'SAME DAY',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '85 AED',height: 40.h,clr:Colors.amber,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'PER HOUR (7 AM TO 8 PM)',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: 'PER DAY',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: 'SAME DAY',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: '100 AED',height: 40.h,clr:Colors.amberAccent,),
                    ],
                  ),

                  TableRow(
                    children: [
                      PriceItem(txt: '1 MONTH',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '30 DAYS (10% OFF)',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '45 DAYS',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '2,300 AED',height: 40.h,clr:Colors.amber,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: '3 MONTHS',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: '90 DAYS (15% OFF)',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: '4 MONTHS',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: '6,500 AED',height: 40.h,clr:Colors.amberAccent,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: '6 MONTHS',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '180 DAYS (20% OFF)',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '10 MONTHS',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '12,200 AED',height: 40.h,clr:Colors.amber,),
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
                height: 160.h,
                width: double.infinity,
                color: Colors.amberAccent,
                child: Center(
                  child: Text(
                    'BOARDING',style: TextStyle(
                    fontFamily: ConstantStrings.kAppFont,
                  ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Table(
                border: TableBorder.all(color: Colors.white),
                children: [
                  TableRow(
                    children: [
                      PriceItem(txt: 'DAILY (STANDARD ROOM)',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: 'CHECK - IN 7 AM',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: 'CHECK - OUT 7 PM',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: '120 AED PER DOG',height: 40.h,clr:Colors.amberAccent,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'DAILY (SUITE)',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: 'CHECK - IN 7 AM',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: 'CHECK - OUT 7 PM',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '180 AED PER DOG',height: 40.h,clr:Colors.amber,),
                    ],
                  ),

                  TableRow(
                    children: [
                      PriceItem(txt: '1ST SIBLING',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: 'CHECK - IN 7 AM',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: 'CHECK - OUT 7 PM',height: 40.h,clr:Colors.amberAccent,),
                      PriceItem(txt: '20 % OFF',height: 40.h,clr:Colors.amberAccent,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: '2ND SIBLING',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: 'CHECK - IN 7 AM',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: 'CHECK - OUT 7 PM',height: 40.h,clr:Colors.amber,),
                      PriceItem(txt: '30 % OFF',height: 40.h,clr:Colors.amber,),
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
        Container(
          height: 100.h,
          width: double.infinity,
          color: ConstantColors.kYClr,
          child: Center(
            child: Text(
              'DAY CARE SERVICES',
              style: TextStyle(
                fontFamily: ConstantStrings.kAppFont,
                fontSize: 30.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
