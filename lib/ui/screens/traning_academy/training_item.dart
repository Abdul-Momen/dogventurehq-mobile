import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/ui/screens/traning_academy/training_academy_details/training_academy_details.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_consultation/consultation.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainingItem extends StatelessWidget {
  final ServicesListModel servicesListModel;
   const TrainingItem({Key? key, required this.servicesListModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(TrainingDetailsPage.routeName,arguments: servicesListModel.productMasterId),
      child: Card(
        child: SizedBox(
          height: 118.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 110.h,
                  width: 123.w, // fixed width and height
                  child: CustomImageNetwork(
                    imageUrl: servicesListModel.productMasterMediaViewModels[0].fileLocation,
                  )
              ),
              addH(20.h),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    servicesListModel.productName,
                    style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold
                    ),
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
