import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/price_guide/price_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          columnWidths: const {
            0: FlexColumnWidth(1.8),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(1.5),
            3: FlexColumnWidth(1),
            4: FlexColumnWidth(1.2),
            5: FlexColumnWidth(1.5),
          },
          border: TableBorder.all(color: Colors.white),
          children: [
            TableRow(
              children: [
                PriceItem(txt: 'OFFER',clr: ConstantColors.kEvent,tClr: Colors.white,),
                PriceItem(txt: '  ',clr: ConstantColors.kEvent,tClr: Colors.white,),
                PriceItem(txt: 'PRICE (PER PERSON)',clr: ConstantColors.kEvent,tClr: Colors.white,),
                PriceItem(txt: 'AT DHQ',clr: ConstantColors.kEvent,tClr: Colors.white,),
                PriceItem(txt: 'OUTDOORS',clr: ConstantColors.kEvent,tClr: Colors.white,),
                PriceItem(txt: 'COMMENTS',clr: ConstantColors.kEvent,tClr: Colors.white,),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 5,
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.8),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1.5),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1.2),
                  5: FlexColumnWidth(1.5),
                },
                border: TableBorder.all(color: Colors.white),
                children: [
                  TableRow(
                    children: [
                      PriceItem(txt: 'POOL PARTY',height: 40.h,clr: ConstantColors.kEvent2),
                      PriceItem(txt: '  ',height: 40.h,clr: ConstantColors.kEvent2),
                      PriceItem(txt: '75',height: 40.h,clr: ConstantColors.kEvent2),
                      PriceItem(txt: '',height: 40.h,clr: ConstantColors.kEvent2),
                      PriceItem(txt: ' ',height: 40.h,clr: ConstantColors.kEvent2),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'MOVIE NIGHT',height: 40.h,clr:ConstantColors.kEvent,),
                      PriceItem(txt: '  ',height: 40.h,clr:ConstantColors.kEvent,),
                      PriceItem(txt: '75',height: 40.h,clr:ConstantColors.kEvent,),
                      PriceItem(txt: '',height: 40.h,clr:ConstantColors.kEvent,),
                      PriceItem(txt: ' ',height: 40.h,clr:ConstantColors.kEvent,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'SOCIAL EVENT',height: 40.h,clr: ConstantColors.kEvent2),
                      PriceItem(txt: '  ',height: 40.h,clr: ConstantColors.kEvent2),
                      PriceItem(txt: '150',height: 40.h,clr: ConstantColors.kEvent2),
                      PriceItem(txt: '',height: 40.h,clr: ConstantColors.kEvent2),
                      PriceItem(txt: '',height: 40.h,clr: ConstantColors.kEvent2),
                    ],
                  ),

                  TableRow(
                    children: [
                      PriceItem(txt: 'HIKING',height: 40.h,clr: ConstantColors.kEvent),
                      PriceItem(txt: '  ',height: 40.h,clr: ConstantColors.kEvent),
                      PriceItem(txt: '175',height: 40.h,clr: ConstantColors.kEvent),
                      PriceItem(txt: ' ',height: 40.h,clr: ConstantColors.kEvent),
                      PriceItem(txt: '',height: 40.h,clr: ConstantColors.kEvent),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'HIKING WITH LUNCH',height: 40.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: '  ',height: 40.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: '285',height: 40.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: ' ',height: 40.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: '',height: 40.h,clr:ConstantColors.kEvent2,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'AGILITY COMPETITION	',height: 40.h,clr: ConstantColors.kEvent),
                      PriceItem(txt: '  ',height: 40.h,clr: ConstantColors.kEvent),
                      PriceItem(txt: '50',height: 40.h,clr: ConstantColors.kEvent),
                      PriceItem(txt: '',height: 40.h,clr: ConstantColors.kEvent),
                      PriceItem(txt: '',height: 40.h,clr: ConstantColors.kEvent),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'CAMPING',height: 40.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: '  ',height: 40.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: '300',height: 40.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: ' ',height: 40.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: '',height: 40.h,clr:ConstantColors.kEvent2,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'SNORKELING',height: 40.h,clr:ConstantColors.kEvent,),
                      PriceItem(txt: '  ',height: 40.h,clr:ConstantColors.kEvent,),
                      PriceItem(txt: '180',height: 40.h,clr:ConstantColors.kEvent,),
                      PriceItem(txt: ' ',height: 40.h,clr:ConstantColors.kEvent,),
                      PriceItem(txt: '',height: 40.h,clr:ConstantColors.kEvent,),
                    ],
                  ),
                  TableRow(
                    children: [
                      PriceItem(txt: 'BIRTHDAY PACKAGE',height: 330.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: 'CUSTOM E-CARD, SNACK AND DRINKS FOR HUMAN CAKE AND TREATS FOR DOGS THEMED DECOR, PARTY HATS, NAME TAGSPARTY BAGS, PROFESSIONAL PHOTOSFUN GAMES, MOUNTAIN & POOLMINIMUM 12 DOGS WITH PARENTS (2)EXTRA DOG WITH OWNERS (2) AED 300 EXTRA ADULT AED 100',
                        height: 330.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: 'AED 5000 12 DOGS EXTRA AED 180 KIDS FREE',
                        height: 330.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: '',height: 330.h,clr:ConstantColors.kEvent2,),
                      PriceItem(txt: ' ',height: 330.h,clr:ConstantColors.kEvent2,),
                    ],
                  ),

                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: 650.h,
                width: double.infinity,
                color: ConstantColors.kEvent2,
                child: Center(
                  child: Text(
                    'MUST REGISTER AT DHQ MUST PROVIDE COPY OF MEDICAL BOOK NO ASSESSMENT REQUIRED NON-NEUTERED ACCEPTED',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontFamily: ConstantStrings.kAppFont,
                  ),
                  ),
                ),
              ),
            ),

          ],
        ),
        Container(
          height: 100.h,
          width: double.infinity,
          color: ConstantColors.kEvent,
          child: Center(
            child: Text(
              'EVENT SERVICES',
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
