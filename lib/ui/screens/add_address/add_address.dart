import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/address_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/states/models/add_address_model.dart';
import 'package:dogventurehq/states/models/city_model.dart';
import 'package:dogventurehq/states/models/country_model.dart';
import 'package:dogventurehq/states/models/customer_address_model.dart';
import 'package:dogventurehq/states/models/pet_breed_model.dart';
import 'package:dogventurehq/states/models/pet_type_model.dart';
import 'package:dogventurehq/states/models/state_model.dart';
import 'package:dogventurehq/ui/screens/address_book/address_book.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_dd.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/map_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AddAddress extends StatefulWidget {
  static String routeName = '/add_address';

  final CustomerAddressModel? addAddressModel;
  const AddAddress({Key? key, this.addAddressModel}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final AddressController _addressController = Get.put(AddressController());

  CountryModel? _selectedCountry;
  StateModel? _selectedState;
  CityModel? _selectedCity;

  final TextEditingController _addressTypeTextEditingController =
      TextEditingController();
  final TextEditingController _addressLine1TextEditingController =
      TextEditingController();
  final TextEditingController _addressLine2TextEditingController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _addressController.getCountryList();
    _addressController.getStateList(13);
    _addressController.getCityList(2002);

    if (widget.addAddressModel != null) {
      _addressTypeTextEditingController.text =
          widget.addAddressModel!.addressType;
      _addressLine1TextEditingController.text = widget.addAddressModel!.address;
      _addressTypeTextEditingController.text =
          widget.addAddressModel!.addressLine2;

      _addressController.getStateList(widget.addAddressModel!.stateId);
      _addressController.getCityList(widget.addAddressModel!.cityId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#F98C10"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: CustomTitlebar(
            title: "Add new Address", img_bg: AllMethods.changeAppbarImage(3)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //     height: 400.h,
              //     width: double.infinity.w,
              //     child: MapPicker(),
              // ),

              addH(30.h),
              const Text('Address Type'),
              addH(10.h),
              CustomField(
                hintTxt: 'Enter address type',
                inputType: TextInputType.name,
                validator: (val) {
                  if (val!.isEmpty) return 'Enter address type';
                },
                textEditingController: _addressTypeTextEditingController,
              ),

              addH(10.h),
              const Text('Address Line 1'),
              addH(10.h),
              CustomField(
                hintTxt: 'Enter address Line 1',
                inputType: TextInputType.name,
                validator: (val) {
                  if (val!.isEmpty) return 'Address Line 1';
                },
                textEditingController: _addressLine1TextEditingController,
              ),

              addH(10.h),
              const Text('Address Line 2'),
              addH(10.h),
              CustomField(
                hintTxt: 'Enter address Line 2',
                inputType: TextInputType.name,
                validator: (val) {
                  if (val!.isEmpty) return 'Address Line 2';
                },
                textEditingController: _addressLine2TextEditingController,
              ),
              addH(10.h),
              const Text('Select Country'),
              addH(10.h),
              Obx(() {
                if (_addressController.countryListLoadingFlag.value) {
                  return SizedBox(
                    height: 50.h,
                    width: 300.w,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_addressController.countryList.isNotEmpty) {
                    // if (widget.petModel != null) {
                    //   for (PetBreedModel item
                    //   in _myPetController.petBreedList) {
                    //     if (item.profileBreedGroupId ==
                    //         widget.petModel!.profileBreedGroupId) {
                    //       _selectedBreed = item;
                    //       break;
                    //     }
                    //   }
                    // }
                    return CustomDD(
                      givenValue: _selectedCountry,
                      hintTxt: 'Select Country',
                      items: _addressController.countryList.map((e) {
                        return AllMethods.getDDMenuItem(
                          item: e,
                          txt: e.countryName,
                        );
                      }).toList(),
                      onChangedFn: (value) => setState(() {
                        _selectedCountry = value;
                        _addressController.stateList.clear();
                        _selectedState = null;
                        _addressController
                            .getStateList(_selectedCountry!.countryId);
                        _addressController.cityList.clear();
                        _selectedCity = null;
                        _addressController.getCityList(_selectedState!.stateId);
                      }),
                    );
                  } else {
                    return const Text('no data found');
                  }

                  ///  cheek if pettype list is empty or not

                }
              }),

              addH(10.h),

              const Text('Select State'),
              addH(10.h),
              Obx(() {
                if (_addressController.stateListLoadingFlag.value) {
                  return SizedBox(
                    height: 50.h,
                    width: 300.w,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_addressController.stateList.isNotEmpty) {
                    // if (widget.petModel != null) {
                    //   for (PetBreedModel item
                    //   in _myPetController.petBreedList) {
                    //     if (item.profileBreedGroupId ==
                    //         widget.petModel!.profileBreedGroupId) {
                    //       _selectedBreed = item;
                    //       break;
                    //     }
                    //   }
                    // }
                    return CustomDD(
                      givenValue: _selectedState,
                      hintTxt: 'Select State',
                      items: _addressController.stateList.map((e) {
                        return AllMethods.getDDMenuItem(
                          item: e,
                          txt: e.stateName,
                        );
                      }).toList(),
                      onChangedFn: (value) => setState(() {
                        _selectedState = value;
                        _addressController.cityList.clear();
                        _selectedCity = null;
                        _addressController.getCityList(_selectedState!.stateId);
                      }),
                    );
                  } else {
                    return const Text('no data found');
                  }

                  ///  cheek if pettype list is empty or not

                }
              }),

              addH(10.h),

              const Text('Select City'),
              addH(10.h),
              Obx(() {
                if (_addressController.cityListLoadingFlag.value) {
                  return SizedBox(
                    height: 50.h,
                    width: 300.w,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_addressController.cityList.isNotEmpty) {
                    // if (widget.petModel != null) {
                    //   for (PetBreedModel item
                    //   in _myPetController.petBreedList) {
                    //     if (item.profileBreedGroupId ==
                    //         widget.petModel!.profileBreedGroupId) {
                    //       _selectedBreed = item;
                    //       break;
                    //     }
                    //   }
                    // }
                    return CustomDD(
                      givenValue: _selectedCity,
                      hintTxt: 'Select City',
                      items: _addressController.cityList.map((e) {
                        return AllMethods.getDDMenuItem(
                          item: e,
                          txt: e.cityName,
                        );
                      }).toList(),
                      onChangedFn: (value) => setState(() {
                        _selectedCity = value;
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

              CustomBtn(
                btnSize: Size(388.w, 52.h),
                btnFn: () {
                  //Get.to(AddressBook());
                  _addAddress();
                },
                btnText: 'Save',
                btnBgClr: Colors.green.shade600,
              ),
              addH(20.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _addAddress() {
    // if (_selectedPetType == null) {
    //   return DialogHelper.showSnackBar('Select Pet Type');
    // }
    // if (_selectedBreed == null) {
    //   return DialogHelper.showSnackBar('Select Pet Breed');
    // }
    // if (_petNameTextEditingController.text.isEmpty) {
    //   return DialogHelper.showSnackBar('Enter Per Name');
    // }

    AddAddressModel addAddressModel = AddAddressModel(
      customerAddressId: 0,
      customerId: Preference.getUserId(),
      addressType: _addressTypeTextEditingController.text,
      countryId: _selectedCountry!.countryId,
      stateId: _selectedState!.stateId,
      cityId: _selectedCity!.cityId,
      address: _addressLine1TextEditingController.text,
      buildingName: null,
      flatNo: null,
      latitude: null,
      longitude: null,
      nearByLocation: null,
      isDefault: null,
      countryName: _selectedCountry!.countryName,
      stateName: _selectedState!.stateName,
      cityName: _selectedCity!.cityName,
      addressLine2: _addressLine2TextEditingController.text,
      zipCode: null,
      phoneNumber: null,
      editedCustomerAddressId: 0,
    );

    if (widget.addAddressModel == null) {
      _addressController.addAddress(addAddressModel);
      Get.defaultDialog(
          title: 'Processing..',
          content: Obx(() {
            if (_addressController.addAddressLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_addressController.addAddressObj != null) {
                Future.delayed(const Duration(seconds: 1), () async {
                  Get.back();
                  Get.back();
                  _addressController.getDeliveryAddressList();
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
      _addressController.updateAddress(addAddressModel);
      Get.defaultDialog(
          title: 'Processing..',
          content: Obx(() {
            if (_addressController.updateAddressLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_addressController.updateAddressObj != null) {
                Future.delayed(const Duration(seconds: 1), () async {
                  _addressController.getDeliveryAddressList();

                  Get.back();
                  Get.back();
                });
                return const Text('Update Successfully');
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

    // if (widget.petModel != null) {
    //   _myPetController.updatePet(addPetModel);
    //   Get.defaultDialog(
    //       title: 'Processing..',
    //       content: Obx(() {
    //         if (_myPetController.updatePetLoadingFlag.value) {
    //           return const Center(child: CircularProgressIndicator());
    //         } else {
    //           if (_myPetController.updatePetObj != null) {
    //             Future.delayed(const Duration(seconds: 1), () async {
    //               Get.back();
    //               Get.back();
    //               _myPetController.getPetList();
    //             });
    //             return const Text('Successfully Added');
    //           } else {
    //             return Column(
    //               children: [
    //                 const Text('Loading... failed'),
    //                 addH(20.h),
    //                 CustomBtn(
    //                   btnFn: () {
    //                     Get.back();
    //                   },
    //                   btnText: 'Try Again',
    //                   btnBgClr: Colors.green,
    //                   btnSize: Size(120.w, 40.h),
    //                 )
    //               ],
    //             );
    //           }
    //         }
    //       }),
    //       radius: 10.0);
    // } else {
    //   ///gen
    // }
  }
}
