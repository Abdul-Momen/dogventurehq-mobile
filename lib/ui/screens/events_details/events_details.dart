import 'dart:math';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/favorite_model.dart';
import 'package:dogventurehq/ui/screens/events_details/price_item.dart';
import 'package:dogventurehq/ui/screens/events_details/row_item.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/screens/registration/registration.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';

import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/html_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class EventsDetails extends StatefulWidget {
  static String routeName = '/events_details';

  const EventsDetails({Key? key}) : super(key: key);

  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
  final EventController _eventDetailsCon = Get.find<EventController>();

  String guidId = '';
  bool isReadmore = false;

  final int _numberOfTickets = 1;
  final int _numberOfHumen = 0;
  final int _counter = 0;

  //print(datetime1);
  //output: 2021-10-17

  @override
  void initState() {
    _eventDetailsCon.totalPrice.value = 0;

    // TODO: implement initState
    guidId = Get.arguments;
    _eventDetailsCon.getEventDetails(guidId, Preference.getUserId().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#58381D"),
        ),
        toolbarHeight: 119.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
          title: "Events Details",
          img_bg: 'assets/images/events_bg.png',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (_eventDetailsCon.eventDetailsLoadingFlag.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (_eventDetailsCon.eventDetails == null) {
                  return const Text('No data found');
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 300.h,
                        width: double.infinity,
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 300.h,
                              child: CustomImageNetwork(
                                imageUrl: _eventDetailsCon
                                    .eventDetails!.eventLargeImage,
                              ),
                            ),
                            Positioned(
                              top: 20.h,
                              left: 20.w,
                              child: Container(
                                height: 90.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                child: Container(
                                  color: HexColor('#F0FAFF'),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        _eventDetailsCon.startTime!,
                                        style: TextStyle(
                                          fontFamily: ConstantStrings.kAppFont,
                                          fontSize: 16.0.sp,
                                        ),
                                      ),
                                      Text(
                                        _eventDetailsCon.startDate!,
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addH(25.h),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _eventDetailsCon.eventDetails!.title,
                                    style: TextStyle(
                                      color: HexColor("#58381D"),
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontSize: 30.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 40.h,
                                      width: 40.w,
                                      child: Obx(() {
                                        if (_eventDetailsCon
                                            .isFavoriteLoadingFlag.value) {
                                          return const CircularProgressIndicator();
                                        } else {
                                          return InkWell(
                                            onTap: () {
                                              if (!Preference
                                                  .getLoggedInFlag()) {
                                                return DialogHelper.showToast(
                                                    'You have must login');
                                              }
                                              _eventDetailsCon
                                                      .eventDetails!.isWished
                                                  ? methodCall()
                                                  : methodCall();
                                              setState(
                                                () => _eventDetailsCon
                                                        .eventDetails!
                                                        .isWished =
                                                    !_eventDetailsCon
                                                        .eventDetails!.isWished,
                                              );
                                            },
                                            child: Icon(
                                              _eventDetailsCon
                                                      .eventDetails!.isWished
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined,
                                              color: _eventDetailsCon
                                                      .eventDetails!.isWished
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          );
                                        }
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addH(20.h),
                            Row(
                              children: [
                                Expanded(
                                  child: RowItem(
                                    title: "DATE",
                                    subtitle:
                                        '${_eventDetailsCon.startDate!} | ${_eventDetailsCon.startTime!}',
                                    svgIcon: "assets/svg/date.svg",
                                  ),
                                ),
                                Expanded(
                                  child: RowItem(
                                    title: "Price (Tax Included)",
                                    subtitle:
                                        '${_eventDetailsCon.totalPrice.value}',
                                    svgIcon: 'assets/svg/rm_ticket.svg',
                                  ),
                                ),
                              ],
                            ),

                            // addH(10.h),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: RowItem(
                            //         title: "STATUS",
                            //         subtitle:
                            //             _eventDetailsCon.eventDetails!.status,
                            //         svgIcon: "assets/svg/status.svg",
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: RowItem(
                            //         title: "ORGANIZER",
                            //         subtitle: '',
                            //         svgIcon: 'assets/svg/org.svg',
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // addH(10.h),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: RowItem(
                            //         title: "PHONE",
                            //         subtitle:
                            //             // _eventDetailsCon.eventDetails!.phone,
                            //             '+8801314986798',
                            //         svgIcon: 'assets/svg/phone.svg',
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: RowItem(
                            //         title: "EMAIL",
                            //         subtitle:
                            //             // _eventDetailsCon.eventDetails!.email,
                            //             'test@email.com',
                            //         svgIcon: 'assets/svg/email.svg',
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            addH(10.h),

                            Row(
                              children: [
                                Expanded(
                                  child: RowItem(
                                    title: "TICKETS",
                                    subtitle:
                                        _eventDetailsCon.eventDetails!.note,
                                    svgIcon: 'assets/svg/ticket.svg',
                                  ),
                                ),
                              ],
                            ),

                            addH(20.h),
                            // Center(
                            //   child: CustomBtn(
                            //     btnFn: () async {
                            //       DateTime? pickedDate = await showDatePicker(
                            //           context: context,
                            //           initialDate: DateTime.now(),
                            //           firstDate: DateTime(1950),
                            //           //DateTime.now() - not to allow to choose before today.
                            //           lastDate: DateTime(2100));
                            //
                            //       if (pickedDate != null) {
                            //         print(
                            //             pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            //         String formattedDate =
                            //             DateFormat('yyyy-MM-dd')
                            //                 .format(pickedDate);
                            //         print(
                            //             formattedDate); //formatted date output using intl package =>  2021-03-16
                            //         setState(() {
                            //           // dateInput.text = formattedDate; //set output date to TextField value.
                            //         });
                            //       } else {}
                            //     },
                            //     btnText: 'ADD TO CALENDAR',
                            //     btnBgClr: Colors.indigo,
                            //   ),
                            // ),
                            // addH(10.h),

                            Text(
                              "About Event",
                              style: TextStyle(
                                fontFamily: ConstantStrings.kAppFontPoppins,
                                fontSize: 15.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            addH(10.h),
                            CustomHtmlText(
                              text: _eventDetailsCon.eventDetails!.description +
                                  _eventDetailsCon
                                      .eventDetails!.itineraryDetails,
                            ),
                            //text widget to display long text

                            addH(250.h),
                          ],
                        ),
                      )
                    ],
                  );
                }
              }
            }),
          ],
        ),
      ),
      bottomSheet: Obx(() {
        if (_eventDetailsCon.eventDetailsLoadingFlag.value) {
          return const SizedBox.shrink();
        } else {
          if (_eventDetailsCon.eventDetails == null) {
            return const Text('No data found');
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                addH(10.h),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _eventDetailsCon.eventDetails!
                      .eventTicketsProductMasterViewModels!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomPriceItem(
                      eventTicketsProductMasterViewModel: _eventDetailsCon
                          .eventDetails!
                          .eventTicketsProductMasterViewModels![index],
                      onSubOnClick: () {
                        _eventDetailsCon.totalPrice.value = 0;
                        //add quantity
                        _eventDetailsCon.eventDetails!
                            .eventTicketsProductMasterViewModels![index].item--;

                        //calculate price
                        _eventDetailsCon
                                .eventDetails!
                                .eventTicketsProductMasterViewModels![index]
                                .productPrice *
                            _eventDetailsCon
                                .eventDetails!
                                .eventTicketsProductMasterViewModels![index]
                                .item;
                        setState(() {});
                        _eventDetailsCon.totalEventPrice();
                      },
                      onAddOnClick: () {
                        _eventDetailsCon.totalPrice.value = 0;

                        //add quantity
                        _eventDetailsCon.eventDetails!
                            .eventTicketsProductMasterViewModels![index].item++;

                        //calculate price
                        _eventDetailsCon
                                .eventDetails!
                                .eventTicketsProductMasterViewModels![index]
                                .productPrice *
                            _eventDetailsCon
                                .eventDetails!
                                .eventTicketsProductMasterViewModels![index]
                                .item;
                        setState(() {});
                        _eventDetailsCon.totalEventPrice();
                      },
                    );
                  },
                ),
                addH(10.h),
                CustomBtn(
                  btnFn: () {
                    if (Preference.getLoggedInFlag()) {
                      if (_eventDetailsCon.eventDetails != null) {
                        Get.toNamed(
                          RegistrationPage.routeName,
                          arguments: [
                            2,
                            1,
                            _eventDetailsCon.totalPrice.value,
                          ],
                        );
                      } else {
                        DialogHelper.showToast('Empty Details');
                      }
                    } else {
                      Get.toNamed(LoginScreen.routeName, arguments: 2);
                    }
                  },
                  btnText: "Book Tickets",
                  btnBgClr: Colors.green,
                ),
                addH(10.h),
              ],
            );
          }
        }
      }),
    );
  }

  methodCall() {
    FavoriteModel fav = FavoriteModel(
      eventWiseListId: 0,
      eventId: _eventDetailsCon.eventDetails!.eventId,
      customerId: Preference.getUserId(),
    );

    log(Preference.getUserId());
    _eventDetailsCon.addFavoriteEvent(fav);
  }
}
