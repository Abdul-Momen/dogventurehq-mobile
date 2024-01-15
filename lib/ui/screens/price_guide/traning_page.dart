import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/price_guide/price_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1.5),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(1),
            4: FlexColumnWidth(1),
          },
          border: TableBorder.all(color: Colors.white),
          children: [
            TableRow(
              children: [
                PriceItem(
                  txt: 'SERVICES',
                  clr: ConstantColors.kTraining,
                ),
                PriceItem(
                  txt: 'AGE',
                  clr: ConstantColors.kTraining,
                ),
                PriceItem(
                  txt: 'DURATION',
                  clr: ConstantColors.kTraining,
                ),
                PriceItem(
                  txt: 'LOCATION',
                  clr: ConstantColors.kTraining,
                ),
                PriceItem(
                  txt: 'PRICE',
                  clr: ConstantColors.kTraining,
                ),
              ],
            ),
            TableRow(
              children: [
                PriceItem(
                  txt: 'CONSULTATION	',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: 'ALL',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '1 HOUR',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: 'DHQ',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '350 AED',
                  clr: ConstantColors.kTrainingAccent2,
                ),
              ],
            ),
            TableRow(
              children: [
                PriceItem(
                  txt: 'PUPPY TRAINING',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '3 MONTHS +',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '10 SESSIONS',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: 'HOME',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '5,500 AED',
                  clr: ConstantColors.kTrainingAccent,
                ),
              ],
            ),
            TableRow(
              children: [
                PriceItem(
                  txt: 'BASIC OBEDIENCE TRAINING - BEGINNERS',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '3 MONTHS +',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '15 SESSIONS',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: 'DHQ',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '4,500 AED',
                  clr: ConstantColors.kTrainingAccent2,
                ),
              ],
            ),
            TableRow(
              children: [
                PriceItem(
                  txt: 'BASIC OBEDIENCE TRAINING - INTERMEDIATE',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: 'AFTER BEGINNERS',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '15 SESSIONS',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: 'DHQ',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '5,000 AED',
                  clr: ConstantColors.kTrainingAccent,
                ),
              ],
            ),
            TableRow(
              children: [
                PriceItem(
                  txt: 'BASIC OBEDIENCE TRAINING - ADVANCED',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: 'AFTER BEGINNERS & INTERMEDIATE',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '15 SESSIONS',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: 'DHQ',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '5,500 AED',
                  clr: ConstantColors.kTrainingAccent2,
                ),
              ],
            ),
            TableRow(
              children: [
                PriceItem(
                  txt: 'AGILITY TRAINING',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '6 MONTHS +',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '5 SESSIONS',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: 'DHQ',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '2,000 AED',
                  clr: ConstantColors.kTrainingAccent,
                ),
              ],
            ),
            TableRow(
              children: [
                PriceItem(
                  txt: 'SWIMMING LESSONS',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '6 MONTHS +',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '5 SESSIONS',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: 'DHQ',
                  clr: ConstantColors.kTrainingAccent2,
                ),
                PriceItem(
                  txt: '85 AED',
                  clr: ConstantColors.kTrainingAccent2,
                ),
              ],
            ),
            TableRow(
              children: [
                PriceItem(
                  txt: 'HOME SESSION',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '3 MONTHS +',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '45 MINUTES',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: 'HOME',
                  clr: ConstantColors.kTrainingAccent,
                ),
                PriceItem(
                  txt: '500 AED',
                  clr: ConstantColors.kTrainingAccent,
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 100.h,
          width: double.infinity,
          color: ConstantColors.kTraining,
          child: Center(
            child: Text(
              'TRAINING SERVICES',
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
