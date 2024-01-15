import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/my_appointment_controller.dart';
import 'package:dogventurehq/ui/screens/my_appointments/appointments_item.dart';
import 'package:dogventurehq/ui/screens/my_events/custom_tab_item.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {

 final MyAppointmentController _myAppointmentController=Get.put(MyAppointmentController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _myAppointmentController.getMyCancelAppointmentList();
    _myAppointmentController.getMyCurrentAppointmentList();
    _myAppointmentController.getMyPreviousAppointmentList();

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("#e6a420"),
          ),
          toolbarHeight: 129.h,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: const CustomTitlebar(
            title: 'My Appointments',
            img_bg: 'assets/images/day_care_bg.png',
          ),
          bottom: TabBar(
            indicatorColor: Colors.green,
            indicatorWeight: 4,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Text(
                  'CURRENT',
                  style: TextStyle(
                      fontSize: 22.sp, fontFamily: ConstantStrings.kAppFont),
                ),
              ),
              Tab(
                child: Text(
                  'PREVIOUS',
                  style: TextStyle(
                      fontSize: 22.sp, fontFamily: ConstantStrings.kAppFont),
                ),
              ),
              Tab(
                child: Text(
                  'CANCELLED',
                  style: TextStyle(
                      fontSize: 22.sp, fontFamily: ConstantStrings.kAppFont),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Obx(() {
              if(_myAppointmentController.myCurrentAppointmentLoadingFlag.value){
                return Center(child: CircularProgressIndicator());
              }else{
                if(_myAppointmentController.myCurrentAppointmentList.isEmpty){
                  return Text('no data found...');
                }else{
                  return  ListView.builder(
                      itemCount: _myAppointmentController.myCurrentAppointmentList.length,
                      itemBuilder: (context, index) {
                        return AppointmentTabItem(
                          appointModel:
                          _myAppointmentController.myCurrentAppointmentList[index],
                        );
                      });
                }
              }
            }),
            Obx(() {
              if(_myAppointmentController.myPreviousAppointmentLoadingFlag.value){
                return Center(child: CircularProgressIndicator());
              }else{
                if(_myAppointmentController.myPreviousAppointmentList.isEmpty){
                  return Center(child: Text('no data found...'));
                }else{
                  return  ListView.builder(
                      itemCount: _myAppointmentController.myPreviousAppointmentList.length,
                      itemBuilder: (context, index) {
                        return CustomTabItem(
                          eventModel:
                          _myAppointmentController.myPreviousAppointmentList[index],
                        );
                      });
                }
              }
            }),
            Obx(() {
              if(_myAppointmentController.myCancelAppointmentLoadingFlag.value){
                return Center(child: CircularProgressIndicator());
              }else{
                if(_myAppointmentController.myCancelAppointmentList.isEmpty){
                  return Text('no data found...');
                }else{
                  return  ListView.builder(
                      itemCount: _myAppointmentController.myCancelAppointmentList.length,
                      itemBuilder: (context, index) {
                        return CustomTabItem(
                          eventModel:
                          _myAppointmentController.myCancelAppointmentList[index],
                        );
                      });
                }
              }
            })

          ],
        ),
      ),
    );
  }
}

