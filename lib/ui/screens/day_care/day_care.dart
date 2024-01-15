import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/states/controllers/day_care_controller.dart';
import 'package:dogventurehq/ui/screens/day_care/day_care_item.dart';
import 'package:dogventurehq/ui/screens/registration/registration.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DayCare extends StatefulWidget implements RegistrationPage {
  static String routeName = '/day_care';

  const DayCare({Key? key}) : super(key: key);

  @override
  State<DayCare> createState() => _DayCareState();
}

class _DayCareState extends State<DayCare> {
  final DayCareController _dayCareController = Get.put(DayCareController());

  int? screenNumValue;
  @override
  void initState() {
    super.initState();
    screenNumValue = Get.arguments ?? 0;
    Future.delayed(
      const Duration(milliseconds: 200),
      () => _dayCareController.getDayCareServicesList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ConstantColors.kDayCareClr,
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
            title: "Day Care", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Column(
        children: [
          Obx(() {
            if (_dayCareController.dayServicesLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_dayCareController.servicesList.isEmpty) {
                return const Center(child: Text('data not found'));
              } else {
                return SizedBox(
                  width: 488.w,
                  height: 750.h,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(3, (index) {
                      return SizedBox(
                        height: 125.h,
                        child: DayCareItem(
                          servicesListModel:
                              _dayCareController.servicesList[index],
                        ),
                      ); //robohash.org api provide you different images for any number you are giving
                    }),
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
