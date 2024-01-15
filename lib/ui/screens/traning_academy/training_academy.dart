import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/training_academy_controller.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/ui/screens/events/event_item.dart';
import 'package:dogventurehq/ui/screens/payment/payment.dart';
import 'package:dogventurehq/ui/screens/traning_academy/training_item.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_clinic_item.dart';
import 'package:dogventurehq/ui/widgets/custom_dropdown.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class TrainingAcademy extends StatefulWidget {
  static String routeName = '/training_academy';

  const TrainingAcademy({Key? key}) : super(key: key);

  @override
  State<TrainingAcademy> createState() => _TrainingAcademyState();
}

class _TrainingAcademyState extends State<TrainingAcademy> {
  int? screenNumValue;
  final TrainingAcademyController _trainingAcademyController =
      Get.put(TrainingAcademyController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenNumValue = Get.arguments ?? 0;
    _trainingAcademyController.getTrainingServicesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#3B651A"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: CustomTitlebar(
          title: "TRAINING ACADEMY",
          img_bg: AllMethods.changeAppbarImage(
            screenNumValue!,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*       Text('TRAINING ACADEMY'),
          Text('What the problem behavior is, what prompts it, and what it accomplishes. To answer these and many more questions and to find out what exactly your pet needs. “Book an Assessment”'),
       */
          Obx(() {
            if (_trainingAcademyController.trainingServicesLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_trainingAcademyController.servicesList.isEmpty) {
                return const Text('Empty');
              } else {
                return SizedBox(
                  width: double.infinity.w,
                  height: 750.h,
                  child: ListView.builder(
                    itemCount: _trainingAcademyController.servicesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TrainingItem(
                        servicesListModel:
                            _trainingAcademyController.servicesList[index],
                      );
                    },
                  ),
                );
              }
            }
          })
        ],
      ),
    );
  }
}
