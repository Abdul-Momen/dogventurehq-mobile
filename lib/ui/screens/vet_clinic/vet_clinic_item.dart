import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_consultation/consultation.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VetClinicItem extends StatelessWidget {
  final ServicesListModel servicesListModel;

  final String image ;
  const VetClinicItem({Key? key, required this.servicesListModel, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(ConsultationPage.routeName,
        //   arguments: servicesListModel.productMasterId);
      },
      child: Card(
        child: SizedBox(
          height: 118.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 55.h,
                width: 123.w, // fixed width and height
                child: Image.asset(
                  'assets/images/$image',
                ),
              ),
              addH(10.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  servicesListModel.productName,
                  style: TextStyle(
                    fontFamily: ConstantStrings.kAppFont,
                    fontSize: 12.sp,
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
