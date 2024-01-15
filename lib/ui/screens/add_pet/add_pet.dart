import 'dart:io';
import 'dart:math';

import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/my_pet_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/states/models/add_pet_model.dart';
import 'package:dogventurehq/states/models/pet_breed_model.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/states/models/pet_type_model.dart';
import 'package:dogventurehq/ui/screens/add_pet/custom_checkbox.dart';
import 'package:dogventurehq/ui/screens/add_pet/photo_upload_medical_book_btn.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_dd.dart';
import 'package:dogventurehq/ui/widgets/custom_dropdown.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/photo_upload_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/custom_calender_field.dart';

class AddPet extends StatefulWidget {
  static String routeName = '/add_pet';

  PetModel? petModel;
  AddPet({Key? key, this.petModel}) : super(key: key);

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final List<String> _genders = [
    'Male',
    'Female',
  ];
  final List<String> _age = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];
  PetTypeModel? _selectedPetType;
  PetBreedModel? _selectedBreed;

  String _gender = 'Male';
  bool _vaccinatedFlag = false;
  bool _castrated = false;
  String _selectedAge = '1';

  int _profileId = 0;

  final TextEditingController _petNameTextEditingController =
      TextEditingController();

  final TextEditingController _microchipNumberTextEditingController =
      TextEditingController();

  final TextEditingController _aboutTextEditingController =
      TextEditingController();

  final MyPetController _myPetController = Get.find<MyPetController>();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  File? choosenImg;
  File? choosenMedicalImg;

  @override
  void initState() {
    _myPetController.getPetTypeList();
    _myPetController.getPetBreedList();
    //
    if (widget.petModel != null) {
      _profileId = widget.petModel!.profileId;
      _gender = widget.petModel!.gender;
      _petNameTextEditingController.text = widget.petModel!.name;
      _vaccinatedFlag = widget.petModel!.isYourVaccinated;
      _castrated = widget.petModel!.isYourCastrated;
      _selectedAge = widget.petModel!.age.toString();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            title: "Add/edit Pets", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addH(20.h),
                const Text('Add Photo'),
                addH(10.h),
                PhotoUploadBtn(
                  setPhotoFn: (image) {
                    setState(() {
                      choosenImg = image;
                      print(choosenImg!.path);
                    });
                  },
                ),
                addH(20.h),
                const Text('Name'),
                addH(10.h),
                CustomField(
                  hintTxt: 'Enter pet name',
                  inputType: TextInputType.name,
                  validator: (val) {
                    if (val!.isEmpty) return 'Enter pet name';
                    return null;
                  },
                  textEditingController: _petNameTextEditingController,
                ),
                addH(20.h),
                const Text('Pet Type/Species'),
                addH(10.h),
                Obx(() {
                  if (_myPetController.petTypeLoadingFlag.value) {
                    return SizedBox(
                      height: 50.h,
                      width: 300.w,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (_myPetController.petTypeList.isNotEmpty) {
                      if (widget.petModel != null) {
                        for (PetTypeModel item
                            in _myPetController.petTypeList) {
                          if (item.petTypeId == widget.petModel!.petTypeId) {
                            _selectedPetType = item;
                            break;
                          }
                        }
                      }
                      return CustomDD(
                        givenValue: _selectedPetType,
                        hintTxt: 'Select Pet Type',
                        items: _myPetController.petTypeList.map((e) {
                          return AllMethods.getDDMenuItem(
                            item: e,
                            txt: e.name,
                          );
                        }).toList(),
                        onChangedFn: (value) => setState(() {
                          _selectedPetType = value!;
                          // _selectedCountry = value;
                          // _addressCon.stateList.clear();
                          // _selectedState = null;
                          // _addressCon.cityList.clear();
                          // _selectedCity = null;
                          // _addressCon.getStates(
                          //   countryID: _selectedCountry!.countryId,
                          // );
                        }),
                      );
                    } else {
                      return const Text('no data found');
                    }
                  }
                }),
                addH(20.h),
                const Text('Pet Breed Group'),
                addH(10.h),
                Obx(() {
                  if (_myPetController.petBreedLoadingFlag.value) {
                    return SizedBox(
                      height: 50.h,
                      width: 300.w,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (_myPetController.petBreedList.isNotEmpty) {
                      if (widget.petModel != null) {
                        for (PetBreedModel item
                            in _myPetController.petBreedList) {
                          if (item.profileBreedGroupId ==
                              widget.petModel!.profileBreedGroupId) {
                            _selectedBreed = item;
                            break;
                          }
                        }
                      }
                      return CustomDD(
                        givenValue: _selectedBreed,
                        hintTxt: 'Select Pet Breed',
                        items: _myPetController.petBreedList.map((e) {
                          return AllMethods.getDDMenuItem(
                            item: e,
                            txt: e.name,
                          );
                        }).toList(),
                        onChangedFn: (value) => setState(() {
                          _selectedBreed = value;
                          // _selectedCountry = value;
                          // _addressCon.stateList.clear();
                          // _selectedState = null;
                          // _addressCon.cityList.clear();
                          // _selectedCity = null;
                          // _addressCon.getStates(
                          //   countryID: _selectedCountry!.countryId,
                          // );
                        }),
                      );
                    } else {
                      return const Text('no data found');
                    }

                    ///  cheek if pettype list is empty or not

                  }
                }),

                addH(20.h),
                const Text('Microchip Number'),
                addH(10.h),
                // microchip number field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 286.w,
                      height: 50.h,
                      child: CustomField(
                        hintTxt: 'Enter Microchip Number',
                        inputType: TextInputType.number,
                        textEditingController:
                            _microchipNumberTextEditingController,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svg/qr.svg',
                        height: 50.h,
                      ),
                    ),
                  ],
                ),
                addH(20.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date of Birth',
                        ),
                        addH(10.h),
                        SizedBox(
                          width: 160.w,
                          height: 50.h,
                          child: CustomDropDown(
                            initialValue: _selectedAge,
                            itemList: _age,
                            onChangedFn: (String? value) => setState(() {
                              _selectedAge = value!;
                            }),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: const Text('Gender'),
                        ),
                        addH(10.h),
                        SizedBox(
                          height: 50.h,
                          width: 174.w,
                          child: Row(
                            children: [
                              Radio(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: _genders[0],
                                activeColor: Colors.amber.shade900,
                                groupValue: _gender,
                                onChanged: (String? gender) => setState(() {
                                  _gender = gender!;
                                }),
                              ),
                              const Text('Male'),
                              Radio(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: _genders[1],
                                activeColor: Colors.amber.shade900,
                                groupValue: _gender,
                                onChanged: (String? gender) => setState(() {
                                  _gender = gender!;
                                }),
                              ),
                              const Text('Female'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                addH(20.h),
                const Text('Add Medical Book'),
                addH(10.h),
                PhotoUploadMedicalBtn(
                  setMedicalPhotoFn: (image) {
                    setState(() {
                      choosenMedicalImg = image;
                      print(choosenMedicalImg!.path);
                    });
                  },
                ),
                addH(20.h),
                const Text('About Pet'),
                addH(10.h),
                CustomField(
                  hintTxt: 'Describe your pet here...',
                  numOfLines: 5,
                  inputType: TextInputType.text,
                  textEditingController: _aboutTextEditingController,
                  h: 150.h,
                ),
                addH(10.h),
                CustomCheckbox(
                  initialValue: _vaccinatedFlag,
                  onChangedFn: (value) => setState(
                    () => _vaccinatedFlag = value!,
                  ),
                  title: 'Is Your Pet Vaccinated?',
                ),
                CustomCheckbox(
                  initialValue: _castrated,
                  onChangedFn: (value) => setState(
                    () => _castrated = value!,
                  ),
                  title: 'Is Your Pet Castrated?',
                ),
                addH(20.h),
                // CustomBtn(
                //   btnFn: () {},
                //   btnText: 'Add More Pet',
                //   btnBgClr: Colors.lightBlue.shade900,
                //   btnSize: Size(388.w, 35.h),
                // ),
                // addH(10.h),
                CustomBtn(
                  btnFn: () {
                    if (_key.currentState!.validate()) {
                      setState(() {
                        _addNewPet();
                      });
                    }
                  },
                  btnText: 'Continue',
                  btnBgClr: Colors.green.shade600,
                ),
                addH(30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addNewPet() {
    if (_selectedPetType == null) {
      return DialogHelper.showSnackBar('Select Pet Type');
    }
    if (_selectedBreed == null) {
      return DialogHelper.showSnackBar('Select Pet Breed');
    }
    if (_petNameTextEditingController.text.isEmpty) {
      return DialogHelper.showSnackBar('Enter Per Name');
    }

    AddPetModel addPetModel = AddPetModel(
      profileId: _profileId,
      customerId: Preference.getUserId(),
      name: _petNameTextEditingController.text,
      petTypeId: _selectedPetType!.petTypeId,
      profileBreedGroupId: _selectedBreed!.profileBreedGroupId,
      microchipNumber: _microchipNumberTextEditingController.text,
      dateOfBirth: '2022-09-15T05:15:44.352Z',
      gender: _gender,
      about: _aboutTextEditingController.text,
      isYourVaccinated: _vaccinatedFlag,
      isYourCastrated: _castrated,
      status: "",
      createBy: 0,
      updateDate: DateTime.now().toString(),
      age: int.parse(_selectedAge),
      profileBreedGroupName: _selectedBreed!.name,
      // petMediaDetailsResponseModels:[],
      petName: _petNameTextEditingController.text,
    );

    if (widget.petModel != null) {
      _myPetController.updatePet(addPetModel);
      Get.defaultDialog(
          title: 'Processing..',
          content: Obx(() {
            if (_myPetController.updatePetLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_myPetController.updatePetObj != null) {
                Future.delayed(const Duration(seconds: 1), () async {
                  Get.back();
                  Get.back();
                  _myPetController.getPetList();
                });
                return const Text('Successfully Added');
              } else {
                return Column(
                  children: [
                    const Text('Loading... failed'),
                    addH(20.h),
                    CustomBtn(
                      btnFn: () {
                        Get.back();
                      },
                      btnText: 'Try Again',
                      btnBgClr: Colors.green,
                      btnSize: Size(120.w, 40.h),
                    )
                  ],
                );
              }
            }
          }),
          radius: 10.0);
    } else {
      _myPetController.addNewPet(addPetModel, choosenImg!, choosenMedicalImg!);
      Get.defaultDialog(
          title: 'Processing..',
          content: Obx(() {
            if (_myPetController.addPetLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_myPetController.addPetObj != null) {
                Future.delayed(const Duration(seconds: 1), () async {
                  Get.back();
                  Get.back();
                  _myPetController.getPetList();
                });
                return const Text('Successfully Added');
              } else {
                return Column(
                  children: [
                    const Text('Loading... failed'),
                    addH(20.h),
                    CustomBtn(
                      btnFn: () {
                        Get.back();
                      },
                      btnText: 'Try Again',
                      btnBgClr: Colors.green,
                      btnSize: Size(120.w, 40.h),
                    )
                  ],
                );
              }
            }
          }),
          radius: 10.0);
    }
  }
  // _selectImage() {
  //   Get.bottomSheet(
  //     Container(
  //       decoration: const BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(16.0),
  //             topRight: Radius.circular(16.0)),
  //       ),
  //       child: Wrap(
  //         alignment: WrapAlignment.end,
  //         crossAxisAlignment: WrapCrossAlignment.end,
  //         children: [
  //           ListTile(
  //             leading: const Icon(Icons.camera),
  //             title: const Text('Camera'),
  //             onTap: () {
  //               Get.back();
  //               // _profileController
  //               //     .uploadImage(ImageSource.camera);
  //             },
  //           ),
  //           ListTile(
  //             leading: const Icon(Icons.image),
  //             title: const Text('Gallery'),
  //             onTap: () {
  //               Get.back();
  //               // _profileController
  //               //     .uploadImage(ImageSource.gallery);
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
