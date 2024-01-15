import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_consultation/consultation.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainingDHQItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const TrainingDHQItem({
    Key? key,
    required this.title,
    required this.image,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(ConsultationPage.routeName,
        //   arguments: servicesListModel.productMasterId);
      },
      child: Card(
        child: SizedBox(
          height: 150.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
                width: 123.w, // fixed width and height
                child: Image.asset(
                  'assets/images/$image',
                  color: Colors.green,
                ),
              ),
              addH(5.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: ConstantStrings.kAppFont,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  subTitle,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: ConstantStrings.kAppFontPoppins,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
