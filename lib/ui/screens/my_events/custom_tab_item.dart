import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/my_events_model.dart';
import 'package:dogventurehq/states/services/pet_services.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTabItem extends StatefulWidget {
  MyEventsModel eventModel;

  CustomTabItem({Key? key, required this.eventModel}) : super(key: key);

  @override
  State<CustomTabItem> createState() => _CustomTabItemState();
}

class _CustomTabItemState extends State<CustomTabItem> {
  final EventController _eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Get.toNamed(EventsDetails.routeName,arguments: eventModel.eventDetailsViewModel.eventId);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                              height: 80.h,
                              width: 80.w,
                              color: Colors.white,
                              child: CustomImageNetwork(
                                imageUrl: widget.eventModel
                                    .eventDetailsViewModel.eventSmallLogo,
                              )),
                        ),
                        addW(10.w),
                        Flexible(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.eventModel.eventDetailsViewModel.title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: ConstantStrings.kAppFont,
                                ),
                              ),
                              addH(5.h),
                              Row(
                                children: [
                                  Text(
                                    'BOOKING ID:',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 19.sp,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                  addW(5.w),
                                  Text(
                                    '#' + widget.eventModel.refNumber,
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                ],
                              ),
                              addH(5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'START DATE',
                                      style: TextStyle(
                                          fontFamily: ConstantStrings.kAppFont,
                                          fontSize: 13.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'END DATE',
                                      style: TextStyle(
                                          fontFamily: ConstantStrings.kAppFont,
                                          fontSize: 13.sp),
                                    ),
                                  ),
                                ],
                              ),
                              addH(5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.eventModel.eventDetailsViewModel
                                          .startDate,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10.sp,
                                          fontFamily:
                                              ConstantStrings.kAppFontPoppins),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.eventModel.eventDetailsViewModel
                                          .endDate,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10.sp,
                                          fontFamily:
                                              ConstantStrings.kAppFontPoppins),
                                    ),
                                  ),
                                ],
                              ),
                              addH(10.h),

                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomRichText(
                                text: "AED ",
                                textRich: '${widget.eventModel.totalAmount}',
                                textRichSize: 16.sp,
                                textRichColor: "#155D84",
                                fontFamily: ConstantStrings.kAppFontPoppins,
                              ),
                              Text(
                                widget.eventModel.invoiceViewModels[0].status,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 14.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: Text('Name:\n${Preference.getNameFlag()}'),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child:Container(
                            child: Text('Email:\n${Preference.getEmailFlag()}'),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: Text('Phone:\n ${Preference.getPhoneFlag()}'),
                          ),
                        )
                      ],
                    ),
                    addH(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Icon(Icons.edit),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                _eventController.deleteEvent(widget
                                    .eventModel
                                    .invoiceViewModels[0]
                                    .invoiceId);

                                DialogHelper.showConfirmDialog(
                                    rightBtnPressed: () {
                                      Get.defaultDialog(
                                          title: 'Processing..',
                                          content: Obx(() {
                                            if (_eventController
                                                .deleteEventLoadingFlag
                                                .value) {
                                              return const Center(
                                                  child:
                                                  CircularProgressIndicator());
                                            } else {
                                              if (_eventController
                                                  .deleteResponse!
                                                  .isNotEmpty) {
                                                Future.delayed(
                                                    const Duration(
                                                        seconds: 0),
                                                        () async {
                                                      Get.back();
                                                      Get.back();
                                                      _eventController.getMyCurrentEventList();
                                                    });

                                                return const Text(
                                                    'Success');
                                              } else {
                                                return const Text(
                                                    'Failed');
                                              }
                                            }
                                          }),
                                          radius: 10.0);
                                    }, leftBtnPressed: () {
                                  if (Get.isDialogOpen!) Get.back();
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
