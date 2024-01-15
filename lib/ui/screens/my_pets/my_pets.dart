import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/my_pet_controller.dart';
import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:dogventurehq/ui/screens/add_pet/add_pet.dart';
import 'package:dogventurehq/ui/screens/my_events/custom_tab_item.dart';
import 'package:dogventurehq/ui/screens/my_order_details/order_item.dart';
import 'package:dogventurehq/ui/screens/my_pets/pets_item.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MyPetsPage extends StatefulWidget {
  static String routeName = '/pet_page';

  const MyPetsPage({Key? key}) : super(key: key);

  @override
  State<MyPetsPage> createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {

  final MyPetController _myPetController = Get.put(MyPetController());


  @override
  void initState() {
    // TODO: implement initState
    _myPetController.getPetList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#f5b342"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
            title: "My Pets", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Column(
        children: [

          SizedBox(
            height: 100.h,
            width: 500.w,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Pet Information",
                      style: TextStyle(
                          fontSize: 25.sp, fontFamily: ConstantStrings.kAppFont),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomBtn(
                      btnSize: Size(50.w, 30.h),
                      btnFn: () {
                        Get.to(AddPet());
                      },
                      btnText: 'Add New Pet',
                      txtSize: 16.sp,
                      btnBgClr: HexColor('#155D84'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 670.h,
            width: 500.w,
            child: Obx(() {
              if (_myPetController.petLoadingFlag.value) {
                //print(_eventCon.eventlist.toString());
                return const Center(child: CircularProgressIndicator());
              } else {
                if (_myPetController.petList.isEmpty) {
                  return Text('No data found');
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _myPetController.petList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: PetsItem(
                            petModel: _myPetController.petList[index],
                          ),
                        );
                      });
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
