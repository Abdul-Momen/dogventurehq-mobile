import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/ui/screens/day_care/day_care_details/day_care_details.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_consultation/consultation.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayCareItem extends StatelessWidget {
  final ServicesListModel servicesListModel;

  const DayCareItem({Key? key, required this.servicesListModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(DayCareDetailsPage.routeName,
          arguments: [servicesListModel.productMasterId.toString()]),
      child: Card(
        child: SizedBox(
          height: 125.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 85.h,
                  width: 123.w, // fixed width and height
                  child:
                      servicesListModel.productMasterMediaViewModels.length > 0
                          ? CustomImageNetwork(
                              imageUrl: servicesListModel
                                  .productMasterMediaViewModels[0].fileLocation,
                            )
                          : Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/logo.png'),
                            )),
              addH(10.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  servicesListModel.productName,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: ConstantStrings.kAppFont,
                    fontSize: 14.0.sp,
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
