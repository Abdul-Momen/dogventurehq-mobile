import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/ui/screens/events/event_item.dart';
import 'package:dogventurehq/ui/widgets/custom_dropdown.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Events extends StatefulWidget {
  static String routeName = '/events';

  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final EventController _eventCon = Get.find<EventController>();
  final List<String> _ddPeriods = [
    'Weekly',
    'Monthly',
  ];

  final List<String> _eventTypes = [
    'All',
    'Hiking',
    'Swimming',
    'Walking',
    'Running',
    'Desert Camp',
  ];
  String _selectedEventType = 'All';
  String _period = 'Weekly';

  @override
  void initState() {
    // TODO: implement initState
    _eventCon.getEventList();
    _eventCon.getEventCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#84551E"),
        ),
        toolbarHeight: 119.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
          title: "Events",
          img_bg: 'assets/images/events_bg.png',
        ),
      ),
      body: Column(
        children: [
          addH(20.h),
          SizedBox(
            width: 126.w,
            height: 34.h,
            child: CustomDropDown(
              initialValue: _period,
              itemList: _ddPeriods,
              onChangedFn: (value) => setState(() => _period = value),
            ),
          ),
          addH(15.h),
          SizedBox(
            width: 388.w,
            height: 34.h,
            child: Obx(() {
              if (_eventCon.eventCategoryLoadingFlag.value) {
                // print(_eventCon.eventlist.toString());
                return const Text('');
              } else {
                if (_eventCon.eventCategoryList.isEmpty) {
                  return const Text('No data found');
                } else {
                  return ListView.builder(
                    itemCount: _eventCon.eventCategoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          _selectedEventType =
                              _eventCon.eventCategoryList[index].name;
                          setState(() {
                            _eventCon.getFilterEvent(
                                _eventCon.eventCategoryList[index].categoryId);
                          });
                        },
                        child: Obx(
                          () => Container(
                            height: 34.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: BoxDecoration(
                              color: _eventCon.eventCategoryList[index].name ==
                                      _selectedEventType
                                  ? Colors.brown.shade600
                                  : Colors.white,
                              border: Border.all(color: Colors.brown.shade600),
                            ),
                            child: Text(
                              _eventCon.eventCategoryList[index].name,
                              style: TextStyle(
                                color:
                                    _eventCon.eventCategoryList[index].name ==
                                            _selectedEventType
                                        ? Colors.white
                                        : Colors.black,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }
            }),
          ),
          addH(20.h),
          SizedBox(
            width: double.infinity,
            height: 630.h,
            child: Obx(() {
              if (_eventCon.eventLoadingFlag.value) {
                //print(_eventCon.eventlist.toString());
                return const Center(child: CircularProgressIndicator());
              } else {
                if (_eventCon.eventList.isEmpty) {
                  return const Text('No data found');
                } else {
                  return ListView.builder(
                      itemCount: _eventCon.eventList.length,
                      itemBuilder: (context, index) {
                        return EventItem(
                          eventModel: _eventCon.eventList[index],
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
