import 'dart:ui';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/controllers/my_pet_controller.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:dogventurehq/ui/screens/add_pet/add_pet.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class PetsItem extends StatefulWidget {
  PetModel petModel;

  PetsItem({Key? key, required this.petModel}) : super(key: key);

  @override
  State<PetsItem> createState() => _PetsItemState();
}

class _PetsItemState extends State<PetsItem> {
  final MyPetController _myPetController = Get.put(MyPetController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print(widget.petModel.petMediaDetailsResponseModels[0].image);
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
                          child: Column(
                            children: [
                              Container(
                                  height: 70.h,
                                  width: 70.w,
                                  color: Colors.white,
                                  child: CustomImageNetwork(
                                    imageUrl: widget.petModel.petMediaDetailsResponseModels.length > 0 ? widget.petModel.petMediaDetailsResponseModels[0].medicalBook:'',
                                  )),
                              addH(20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Get.to(AddPet(petModel: widget.petModel,));
                                      },
                                        child: SizedBox(
                                            height: 20.h,
                                            width: 20.w,
                                            child: Image.asset(
                                                'assets/images/edit.png')),),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                        onTap: () {
                                         _myPetController.getPetDelete(widget.petModel.profileId) ;

                                          DialogHelper.showConfirmDialog(
                                              rightBtnPressed: () {
                                            Get.defaultDialog(
                                                title: 'Processing..',
                                                content: Obx(() {
                                                  if (_myPetController
                                                      .petDeleteLoadingFlag
                                                      .value) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  } else {
                                                    if (_myPetController
                                                        .deleteResponse!=null) {
                                                      Future.delayed(
                                                          const Duration(
                                                              seconds: 0),
                                                          () async {
                                                        Get.back();
                                                        Get.back();
                                                        _myPetController
                                                            .getPetList();
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
                        addW(10.w),
                        Flexible(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/pet_type.png')),
                                          addW(3.w),
                                          Text(
                                            'Type/ Species',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/pet_breed.png')),
                                          addW(3.w),
                                          Text(
                                            'Pet Breed Group:',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/age_yr.png')),
                                          addW(3.w),
                                          Text(
                                            'Age (Yr):',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.petModel.name,
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.petModel.profileBreedGroupName,
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.petModel.age.toString(),
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              addH(10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/name.png')),
                                          addW(3.w),
                                          Text(
                                            'Name:',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height:  13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/gender.png')),
                                          addW(3.w),
                                          Text(
                                            'Gender:',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/pet_ges.png')),
                                          addW(3.w),
                                          Text(
                                            'Pet Castrated',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.petModel.name,
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.petModel.gender,
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.petModel.isYourCastrated
                                                ? 'Yes'
                                                : 'No',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              addH(10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/pet_vaccin.png')),
                                          addW(3.w),
                                          Text(
                                            'Pet Vaccinated',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/microchip.png')),
                                          addW(3.w),
                                          Text(
                                            'Microchip Number',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 13.h,
                                              width: 13.w,
                                              child: Image.asset(
                                                  'assets/images/about.png')),
                                          addW(3.w),
                                          Text(
                                            'Medical Book',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.petModel.isYourVaccinated
                                                ? 'Yes'
                                                : 'No',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.petModel.microchipNumber,
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '0',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              addH(10.h),
                            ],
                          ),
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

    //   Card(
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(
    //           children: [
    //             CircleAvatar(
    //               radius: 16.0,
    //               child: ClipRRect(
    //                 child: Image.asset('assets/images/circular_img.png'),
    //                 borderRadius: BorderRadius.circular(50.0),
    //               ),
    //             ),
    //             addW(10.w),
    //             CircleAvatar(
    //               backgroundColor: Colors.white,
    //               radius: 16.0,
    //               child: ClipRRect(
    //                 child: Image.asset('assets/images/animal_img.png'),
    //                 borderRadius: BorderRadius.circular(50.0),
    //               ),
    //             ),
    //             addW(10.w),
    //             Text(
    //               petModel.name,
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 fontFamily: ConstantStrings.kAppFont,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //         InkWell(
    //             onTap: () {
    //               DialogHelper.showConfirmDialog(
    //                   rightBtnPressed: () {
    //                     _eventController.deleteEvent(31940);
    //                     },
    //                 leftBtnPressed: (
    //
    //                     ) {
    //                   if (Get.isDialogOpen!) Get.back();
    //                 }
    //
    //               );
    //             },
    //             child: const Icon(
    //               Icons.dangerous,
    //               color: Colors.red,
    //             )),
    //       ],
    //     ),
    //   ),
    // );
  }
}
