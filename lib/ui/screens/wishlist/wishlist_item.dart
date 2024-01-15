import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/ui/screens/events_details/events_details.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WishListItem extends StatelessWidget {
  EventModel eventModel;

  String? startDate;
  String? startTime;
  int? isFav;

  WishListItem({
    Key? key,
    required this.eventModel,
    this.isFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTimeString = eventModel.startDate;
    final time = DateTime.parse(dateTimeString);

    final format = DateFormat('HH:mm a');
    startTime = format.format(time);

    var outputFormat = DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY);
    startDate = outputFormat.format(time);

    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
                height: 150.h,
                width: 150.w, // fixed width and height
                child: Stack(
                  children: [
                    SizedBox(
                      height: 150.h,
                      width: 180.w,
                      child: CustomImageNetwork(
                        imageUrl: eventModel.eventSmallImage,
                      ),
                    ),
                    Positioned(
                        top: 10.h,
                        right: 10.h,
                        child: InkWell(
                          onTap: (){
                            Get.snackbar('title', 'test');
                          },
                          child: SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: const Icon(Icons.favorite,color: Colors.red,)),
                        ))
                  ],
                )),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(EventsDetails.routeName, arguments: eventModel.guidId);
                    print(eventModel.eventId);
                  },
                  child: Text(
                    eventModel.title,
                    style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      fontSize: 19.0.sp,
                    ),
                  ),
                ),
              )),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 90.h,
                width: 70.w,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: Container(
                  color: HexColor('#F0FAFF'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.black,
                      ),
                      Text(
                        startTime!,
                        style: TextStyle(
                          fontFamily: ConstantStrings.kAppFont,
                          fontSize: 16.0.sp,
                        ),
                      ),
                      Text(
                        startDate!,
                        style: TextStyle(
                          fontFamily: ConstantStrings.kAppFont,
                          fontSize: 16.0.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
