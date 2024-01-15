import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/ui/screens/my_events/custom_tab_item.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

class MyEvents extends StatefulWidget {
  static String routeName = '/my_events';

  const MyEvents({Key? key}) : super(key: key);

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  final EventController _eventController = Get.put(EventController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eventController.getMyCurrentEventList();
    _eventController.getMyCancelEventList();
    _eventController.getMyPreviousEventList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("#84551E"),
          ),
          toolbarHeight: 129.h,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: const CustomTitlebar(
            title: 'My Events',
            img_bg: 'assets/images/events_bg.png',
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
              if (_eventController.myCurrentEventLoadingFlag.value) {
                print(_eventController.myCurrentEventList.toString());
                return Center(child: CircularProgressIndicator());
              } else {
                if (_eventController.myCurrentEventList.isEmpty) {
                  return Text('No data found');
                } else {
                  return ListView.builder(
                      itemCount: _eventController.myCurrentEventList.length,
                      itemBuilder: (context, index) {
                        return CustomTabItem(
                          eventModel:
                              _eventController.myCurrentEventList[index],
                        );
                      });
                }
              }
            }),
            Obx(() {
              if (_eventController.myPreviousEventLoadingFlag.value) {
                print(_eventController.myPreviousEventList.toString());
                return Center(child: CircularProgressIndicator());
              } else {
                if (_eventController.myPreviousEventList.isEmpty) {
                  return Text('No data found');
                } else {
                  return ListView.builder(
                      itemCount: _eventController.myPreviousEventList.length,
                      itemBuilder: (context, index) {
                        return CustomTabItem(
                          eventModel:
                              _eventController.myPreviousEventList[index],
                        );
                      });
                }
              }
            }),
            Obx(() {
              if (_eventController.myCancelEventLoadingFlag.value) {
                print(_eventController.myCancelEventList.toString());
                return Center(child: CircularProgressIndicator());
              } else {
                if (_eventController.myCancelEventList.isEmpty) {
                  return Text('No data found');
                } else {
                  return ListView.builder(
                      itemCount: _eventController.myCancelEventList.length,
                      itemBuilder: (context, index) {
                        return CustomTabItem(
                          eventModel:
                              _eventController.myCancelEventList[index],
                        );
                      });
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
