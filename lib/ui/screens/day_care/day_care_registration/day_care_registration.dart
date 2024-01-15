import 'package:country_code_picker/country_code.dart';
import 'package:dogventurehq/states/controllers/day_care_controller.dart';
import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:dogventurehq/states/controllers/termsConditions_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/states/models/boarding_item.dart';
import 'package:dogventurehq/states/models/order_model.dart';
import 'package:dogventurehq/states/models/registration_model.dart';
import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/ui/screens/add_pet/add_pet.dart';
import 'package:dogventurehq/ui/screens/create_account/cc_picker.dart';
import 'package:dogventurehq/ui/screens/registration/payment_dialog.dart';
import 'package:dogventurehq/ui/screens/registration/pet_item_list.dart';
import 'package:dogventurehq/ui/screens/registration/pet_item_selection.dart';
import 'package:dogventurehq/ui/screens/registration/terms_condition.dart';
import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
import 'package:dogventurehq/ui/widgets/checkout_select_date.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_dd.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/custom_select_date.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class DayCareRegistrationScreen extends StatefulWidget {
  static String routeName = '/daycareRegistration';

  const DayCareRegistrationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DayCareRegistrationScreen> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<DayCareRegistrationScreen> {
  String countryCode = '+971';
  bool _agreeFlag = false;
  bool _agreeWaiverFlag = false;
  int screenNumValue = 0;

  int numOfTicket = 0;

  double servicePrice = 0;
  double totalPrice = 0;
  List<InvoiceRequestModel> invoiceList = List.empty(growable: true);
  List<RegistrationModel> regModels = List.empty(growable: true);
  List<TextEditingController> nameTextController = List.empty(growable: true);
  List<TextEditingController> mobileTextController = List.empty(growable: true);
  List<TextEditingController> emailTextController = List.empty(growable: true);

  List<int> selectPetController = List.empty(growable: true);

  List<int> petIdList = List.empty(growable: true);
  List<String> petNameList = List.empty(growable: true);
  ServicesListModel? _selectedGroomingServiceList;

  final RegistrationController _regCon = Get.put(RegistrationController());

  final DayCareController _dayCareCon = Get.find<DayCareController>();

  final TermsConditionsController _termsConditionsController =
      Get.put(TermsConditionsController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final List<BoardingItem> _boardingItems = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _dayCareCon.getGroomingServicesList();
    if (Get.arguments != null) {
      screenNumValue = Get.arguments[0];
      numOfTicket = Get.arguments[1];
      servicePrice = Get.arguments[2];
    }

    for (int i = 0; i < numOfTicket; i++) {
      nameTextController.add(TextEditingController());
      mobileTextController.add(TextEditingController());
      emailTextController.add(TextEditingController());
      petNameList.add('SELECT-PET');
    }
    petNameList.add('SELECT-PET');
    nameTextController[0].text = Preference.getNameFlag();
    mobileTextController[0].text = Preference.getPhoneFlag();
    emailTextController[0].text = Preference.getEmailFlag();

    _boardingItems.add(
      BoardingItem(
        pets: [],
        checkInDate: DateTime.now(),
        checkOutDate: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:
              HexColor(AllMethods.getStatusBarColor(screenNumValue)),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: CustomTitlebar(
            title: AllMethods.getAppbarTxt(screenNumValue),
            img_bg: AllMethods.changeAppbarImage(screenNumValue)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              addH(25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < numOfTicket; i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addH(20.h),
                          if (screenNumValue == 2)
                            Column(
                              children: [
                                Text(
                                  i == 0
                                      ? 'My information'
                                      : 'Tricket ${i + 1}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                addH(10),
                              ],
                            ),
                          Text(i == 0 ? 'Holder name' : 'Enter Name'),
                          addH(10),
                          CustomField(
                            h: 50.h,
                            w: double.infinity,
                            hintTxt: i == 0
                                ? Preference.getNameFlag()
                                : 'Enter Name',
                            textEditingController: nameTextController[i],
                            inputType: TextInputType.name,
                            validator: (value) {
                              return value!.isEmpty ? 'Enter your name' : null;
                            },
                          ),
                          addH(20.h),
                          const Text('Mobile Number:'),
                          addH(10.h),
                          // mobile number
                          Container(
                            width: double.infinity,
                            height: 50.h,
                            padding: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 115.w,
                                  child:
                                      CCPicker(onChangedFn: changeCountryCode),
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                  indent: 18.h,
                                  endIndent: 18.h,
                                  color: Colors.grey.shade600,
                                ),
                                CustomField(
                                  hintTxt: i == 0
                                      ? Preference.getPhoneFlag()
                                      : 'enter phone number',
                                  w: 178.w,
                                  borderClr: Colors.transparent,
                                  inputType: TextInputType.emailAddress,
                                  textEditingController:
                                      mobileTextController[i],
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Can\'t be empty';
                                    }
                                    if (text.length < 4) {
                                      return 'Too short';
                                    }
                                    return null;
                                  },
                                  // update the state variable when the text changes
                                ),
                              ],
                            ),
                          ),
                          addH(20.h),
                          const Text('Email:'),
                          addH(10.h),
                          CustomField(
                            h: 50.h,
                            w: double.infinity,
                            hintTxt: 'Enter Email',
                            inputType: TextInputType.emailAddress,
                            textEditingController: emailTextController[i],
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'enter your email'
                                  : _regCon.validateEmail(value);
                            },
                          ),

                          //for grooming select services
                          if (_dayCareCon.dayCareDetails!.productMasterId ==
                              21533)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                addH(10.h),
                                // if (screenNumValue == 2)
                                const Text('Select Service'),
                                addH(10.h),
                                Obx(() {
                                  if (_dayCareCon
                                      .groomingServicesLoadingFlag.value) {
                                    return SizedBox(
                                      height: 50.h,
                                      width: 300.w,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    if (_dayCareCon
                                        .groomingServicesList.isNotEmpty) {
                                      //for default select
                                      /* if (widget.petModel != null) {
                                  for (PetTypeModel item
                                  in _myPetController.petTypeList) {
                                    if (item.petTypeId == widget.petModel!.petTypeId) {
                                      _selectedPetType = item;
                                      break;
                                    }
                                  }
                                }*/
                                      return CustomDD(
                                        givenValue:
                                            _selectedGroomingServiceList,
                                        hintTxt: 'Select Service',
                                        items: _dayCareCon.groomingServicesList
                                            .map((e) {
                                          return AllMethods.getDDMenuItem(
                                            item: e,
                                            txt: e.productName,
                                          );
                                        }).toList(),
                                        onChangedFn: (value) => setState(() {
                                          _selectedGroomingServiceList = value!;
                                          if (_selectedGroomingServiceList !=
                                              null) {
                                            totalPrice = 0;
                                            totalPrice =
                                                _selectedGroomingServiceList!
                                                        .productSubSkuRequestModels[
                                                            0]
                                                        .price *
                                                    petNameList.length;
                                          }
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
                              ],
                            ),

                          addH(10.h),
                          if (_dayCareCon.dayCareDetails!.productMasterId ==
                              21511)
                            Column(
                              children: [
                                ListView.builder(
                                  itemCount: _boardingItems.length,
                                  shrinkWrap: true,
                                  primary: false,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.grey.shade200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Book Room:'),
                                            addH(10.h),
                                            Obx(() {
                                              if (_regCon.roomsLoading.value) {
                                                return SizedBox(
                                                  height: 50.h,
                                                  width: 300.w,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                );
                                              } else {
                                                if (_regCon.roomList.isEmpty) {
                                                  return const Text(
                                                    'No Room Found!',
                                                  );
                                                } else {
                                                  return CustomDD(
                                                    givenValue:
                                                        _boardingItems[index]
                                                            .room,
                                                    hintTxt: 'Select Room',
                                                    items: _regCon.roomList
                                                        .map((element) {
                                                      return AllMethods
                                                          .getDDMenuItem(
                                                        item: element,
                                                        txt: element.roomName,
                                                      );
                                                    }).toList(),
                                                    onChangedFn: (value) =>
                                                        setState(
                                                      () =>
                                                          _boardingItems[index]
                                                              .room = value,
                                                    ),
                                                  );
                                                }
                                              }
                                            }),
                                            addH(10.h),
                                            // pet selection
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: 70.h,
                                                  width: 300.w,
                                                  child: PetItemSelection(
                                                    getPetModels: (petList) {
                                                      setState(
                                                        () {
                                                          _boardingItems[index]
                                                              .pets = petList;
                                                          totalPrice = 0;
                                                          for (var item
                                                              in _boardingItems) {
                                                            totalPrice += item
                                                                    .pets
                                                                    .length *
                                                                servicePrice;
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                      AddPet.routeName,
                                                      arguments: 2,
                                                    );
                                                  },
                                                  child: Container(
                                                    color: Colors.green,
                                                    height: 50.h,
                                                    width: 50.w,
                                                    child: Center(
                                                      child: Text(
                                                        '+',
                                                        style: TextStyle(
                                                          fontSize: 25.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            addH(10.h),
                                            CheckInOutSelectDate(
                                              titleText: 'Check In:',
                                              getSelectedDate: (value) =>
                                                  setState(
                                                () => _boardingItems[index]
                                                    .checkInDate = value,
                                              ),
                                            ),
                                            addH(10.h),
                                            CheckInOutSelectDate(
                                              titleText: 'Check Out:',
                                              getSelectedDate: (value) =>
                                                  setState(
                                                () => _boardingItems[index]
                                                    .checkOutDate = value,
                                              ),
                                            ),
                                            addH(10.h),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                              ),
                                              child: Center(
                                                child: CustomBtn(
                                                  btnFn: () {
                                                    if (_boardingItems.length ==
                                                        1) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                            'You must have one room to book.',
                                                          ),
                                                        ),
                                                      );
                                                      return;
                                                    }
                                                    setState(
                                                      () => _boardingItems
                                                          .removeAt(
                                                        index,
                                                      ),
                                                    );
                                                  },
                                                  btnText: 'Remove',
                                                  btnBgClr: Colors.redAccent,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Center(
                                    child: CustomBtn(
                                      btnFn: () {
                                        if (_boardingItems[
                                                        _boardingItems.length -
                                                            1]
                                                    .room ==
                                                null ||
                                            _boardingItems[
                                                    _boardingItems.length - 1]
                                                .pets
                                                .isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Please fill all the fields first.',
                                              ),
                                            ),
                                          );
                                          return;
                                        }
                                        setState(
                                          () => _boardingItems.add(
                                            BoardingItem(
                                              pets: [],
                                              checkInDate: DateTime.now(),
                                              checkOutDate: DateTime.now(),
                                            ),
                                          ),
                                        );
                                      },
                                      btnText: 'Add',
                                      btnBgClr: Colors.green,
                                    ),
                                  ),
                                ),
                                // Column(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     const Text('Price'),
                                //     addH(10.h),
                                //     Container(
                                //       width: double.infinity,
                                //       height: 50.h,
                                //       padding: EdgeInsets.only(left: 10.w),
                                //       decoration: BoxDecoration(
                                //         border: Border.all(
                                //           color: Colors.grey.shade300,
                                //         ),
                                //       ),
                                //       child: Column(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Text(
                                //             totalPrice.toString(),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          //select pet
                          if (_dayCareCon.dayCareDetails!.productMasterId !=
                              21511)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 70.h,
                                  width: 320.w,
                                  child: CustomCardItem(
                                    setPetsIdFn: (petIdlist) {
                                      setState(() {
                                        petIdList = petIdlist;
                                      });
                                    },
                                    setPetsNameFn: (petNameLis) => setState(
                                      () {
                                        petNameList = petNameLis;
                                        if (_dayCareCon.dayCareDetails!
                                                    .productMasterId ==
                                                21533 &&
                                            _selectedGroomingServiceList !=
                                                null) {
                                          totalPrice = 0;

                                          totalPrice =
                                              _selectedGroomingServiceList!
                                                      .productSubSkuRequestModels[
                                                          0]
                                                      .price *
                                                  petNameList.length;
                                        } else {
                                          // only for day care
                                          totalPrice =
                                              servicePrice * petNameLis.length;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AddPet.routeName, arguments: 2);
                                  },
                                  child: Container(
                                    color: Colors.green,
                                    height: 50.h,
                                    width: 50.w,
                                    child: Center(
                                        child: Text(
                                      '+',
                                      style: TextStyle(
                                          fontSize: 25.sp, color: Colors.white),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          addH(10.h),
                          //for date time bar
                          if (_dayCareCon.dayCareDetails!.productMasterId !=
                              21511)
                            const CustomSelectDate(),
                          addH(10.h),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Price'),
                              addH(10.h),
                              // mobile number
                              Container(
                                width: double.infinity,
                                height: 50.h,
                                padding: EdgeInsets.only(left: 10.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(totalPrice.toString()),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    //for terms condition
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeFlag,
                          splashRadius: 0,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          side: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                          activeColor: Colors.amber.shade900,
                          onChanged: (bool? value) => setState(
                            () => _agreeFlag = value!,
                          ),
                        ),
                        CustomRichText(
                          textRich: ' Terms and Conditions',
                          text: 'I Agree the',
                          textRichColor: '#F98C10',
                          onPressed: () {
                            _termsConditionsController
                                .getTermsConditionsList('TermsConditions');
                            Get.bottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: SizedBox(
                                  height: 800.h,
                                  width: 500.w,
                                  child: const SingleChildScrollView(
                                      child: TermsCondition()),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    //for activity waiver
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeWaiverFlag,
                          splashRadius: 0,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          side: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                          activeColor: Colors.amber.shade900,
                          onChanged: (bool? value) => setState(
                            () => _agreeWaiverFlag = value!,
                          ),
                        ),
                        CustomRichText(
                          textRich: 'View Waiver form',
                          textRichSize: 16.sp,
                          textRichColor: '#F98C10',
                          onPressed: () {
                            // Get.bottomSheet(
                            //   isScrollControlled: true,
                            //   backgroundColor: Colors.white,
                            //   Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 20.0),
                            //     child: SizedBox(
                            //       height: 800.h,
                            //       width: 500.w,
                            //       child: const SingleChildScrollView(
                            //           child: ActivityWaiver()),
                            //     ),
                            //   ),
                            // );
                            _launchWhatsapp();
                          },
                        ),
                      ],
                    ),
                    addH(10.h),
                    // continue btn
                    CustomBtn(
                      btnSize: Size(388.w, 52.h),
                      btnFn: _agreeFlag && _agreeWaiverFlag
                          ? () {
                              if (_dayCareCon.dayCareDetails!.productMasterId ==
                                      21533 &&
                                  _selectedGroomingServiceList == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'You must select a grooming service first.',
                                    ),
                                  ),
                                );
                                return;
                              }
                              if (_dayCareCon.dayCareDetails!.productMasterId ==
                                  21511) {
                                for (var item in _boardingItems) {
                                  if (item.room == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'You must select a room for each boarding',
                                        ),
                                      ),
                                    );
                                    return;
                                  }
                                }
                              }
                              Get.dialog(
                                PaymentDialog(
                                  screenNumValue: screenNumValue,
                                  totalPrice: totalPrice,
                                  fromPage: _dayCareCon.dayCareDetails!
                                              .productMasterId ==
                                          21511
                                      ? "Boarding"
                                      : _dayCareCon.dayCareDetails!
                                                  .productMasterId ==
                                              21533
                                          ? 'Grooming'
                                          : 'DayCare',
                                  orderPlaceFn: () => _placeDayCare(),
                                ),
                              );
                            }
                          : () {},
                      btnText: AllMethods.getRegisterBtnTxt(screenNumValue),
                      btnBgClr: _agreeFlag && _agreeWaiverFlag
                          ? Colors.green.shade600
                          : Colors.grey,
                    ),
                    addH(20.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeCountryCode(CountryCode code) {
    countryCode = code.dialCode ?? '+880';
    _regCon.countryCode.value = countryCode;
  }

  void onTimeTap(String value) {
    _regCon.selectTime.value = value;
  }

  _launchWhatsapp() async {
    //const url = "https://wa.me/?text=YourTextHere"
    const url =
        "http://dogventure.okommerce.com//Content/ActivityWavier/event/DHQEvent.pdf";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _placeDayCare() async {
    regModels.clear();
    for (int i = 0; i < numOfTicket; i++) {
      // print(
      //     nameTextController[i].text,
      //     nameTextController[i].selection(TextSelection.fromPosition(
      //       TextPosition(offset: _newValue.length),
      //     )));
      //

      RegistrationModel registrationModel = RegistrationModel(
        customerId: 0,
        userName: nameTextController[i].text,
        firstName: nameTextController[i].text,
        email: emailTextController[i].text,
        phoneNo: mobileTextController[i].text,
        password: Preference.getPasswordFlag(),
      );
      regModels.add(registrationModel);
      // _registrationController.userRegistration();
    }
    // print('reg models');
    // print(regModels.length);

    _regCon.userRegistration(
      rModels: regModels,
      isFirstTime: true,
    );

    invoiceList.clear();
    // invoiceList.add(
    //   InvoiceRequestModel(
    //     serviceDate: _regCon.selectDate.value,
    //     invoiceId: 0,
    //     totalAmount: totalPrice,
    //     receivedAmt: 0,
    //     paymentMethod: 1,
    //     carryingCost: 0,
    //     courierCharge: 0,
    //     storeId: _dayCareCon.dayCareDetails!.storeId,
    //     supplierId: _dayCareCon.dayCareDetails!.supplierRequestModel.supplierId,
    //     invoiceStatusId: 0,
    //     isService: true,
    //     ticketBuyForCustomerId: 0,
    //     invoiceDetailsRequestModels: [
    //       InvoiceDetailsRequestModel(
    //         invoiceDetailsId: 0,
    //         invoiceId: 0,
    //         productMasterId: _dayCareCon
    //             .dayCareDetails!.productDetailsRequestModel.productMasterId,
    //         quantity: 1,
    //         price: _dayCareCon.dayCareDetails!.productDecimal,
    //         productSubSkuId: 0,
    //       )
    //     ],
    //     invoiceDetailsViewModels: [],
    //     eventPetDetailsRequestModels: [],
    //   ),
    // );

    _dayCareCon.eventBookingLoadingFlag.value = true;
    int numOfTickets = 1;
    // 21511 is boarding id
    if (_dayCareCon.dayCareDetails!.productMasterId == 21511) {
      numOfTickets = _boardingItems.length;
    }

    Get.defaultDialog(
      title: 'Processing..',
      content: Obx(
        () {
          if (_dayCareCon.eventBookingLoadingFlag.value) {
            if (_regCon.registrationLoadingFlag.isFalse) {
              for (int i = 0; i < numOfTickets; i++) {
                List<EventPetDetailsRequestModel> petDetailsList = [];
                if (_dayCareCon.dayCareDetails!.productMasterId == 21511) {
                  for (var item in _boardingItems[i].pets) {
                    petDetailsList.add(
                      EventPetDetailsRequestModel(
                        profileId: item.profileId,
                      ),
                    );
                  }
                } else {
                  for (int item in petIdList) {
                    petDetailsList.add(
                      EventPetDetailsRequestModel(
                        profileId: item,
                      ),
                    );
                  }
                }
                invoiceList.add(
                  InvoiceRequestModel(
                    serviceDate: _regCon.selectDate.value,
                    invoiceId: 0,
                    totalAmount: totalPrice,
                    receivedAmt: totalPrice,
                    paymentMethod: 1,
                    carryingCost: 0,
                    courierCharge: 0,
                    storeId: _dayCareCon.dayCareDetails!.storeId,
                    supplierId: _dayCareCon
                        .dayCareDetails!.supplierRequestModel.supplierId,
                    invoiceStatusId: 0,
                    isService: true,
                    ticketBuyForCustomerId: _regCon.customerIds[i],
                    checkIn:
                        _dayCareCon.dayCareDetails!.productMasterId == 21511
                            ? _boardingItems[i].checkInDate
                            : null,
                    checkOut:
                        _dayCareCon.dayCareDetails!.productMasterId == 21511
                            ? _boardingItems[i].checkOutDate
                            : null,
                    invoiceDetailsRequestModels: [
                      InvoiceDetailsRequestModel(
                        invoiceDetailsId: 0,
                        invoiceId: 0,
                        productMasterId: _dayCareCon.dayCareDetails!
                            .productDetailsRequestModel.productMasterId,
                        quantity:
                            _dayCareCon.dayCareDetails!.productMasterId == 21511
                                ? _boardingItems.length
                                : 1,
                        price: _dayCareCon.dayCareDetails!.productDecimal,
                        productSubSkuId: 0,
                      )
                    ],
                    invoiceDetailsViewModels:
                        _dayCareCon.dayCareDetails!.productMasterId == 21511
                            ? [
                                InvoiceDetailsViewModel(
                                  productMasterId:
                                      _boardingItems[i].room!.productMasterId,
                                  storeId: _boardingItems[i].room!.storeId,
                                  supplierId:
                                      _boardingItems[i].room!.supplierId,
                                ),
                              ]
                            : [],
                    eventPetDetailsRequestModels: petDetailsList,
                  ),
                );
              }

              OrderModel orderModel = OrderModel(
                invoiceMasterId: 0,
                customerId: Preference.getUserId(),
                totalAmount: totalPrice,
                receivedAmt: totalPrice,
                courierCharge: 0,
                carryingCost: 0,
                invoiceStatusId: 0,
                eventId: 0,
                invoiceRequestModels: invoiceList,
                inputFieldValueRequestModels: [],
                billingShippingAddressRequestModels: [],
                paymentRequestModels: [
                  PaymentRequestModel(
                    paymentId: 0,
                    currencyId: 1,
                    amount: _dayCareCon.dayCareDetails!.productDecimal,
                    courierCharge: 0,
                    carryingCost: 0,
                    paymentMethod: 1,
                  ),
                ],
                orderFrom: 'App',
                orderSource:
                    _dayCareCon.dayCareDetails!.productMasterId == 21511
                        ? "Boarding"
                        : _dayCareCon.dayCareDetails!.productMasterId == 21533
                            ? 'Grooming'
                            : 'DayCare',
              );
              _dayCareCon.postEventBooking(orderModel);
            }
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_dayCareCon.getOderList != null) {
              print(_dayCareCon.getOderList);
              Future.delayed(
                const Duration(seconds: 0),
                () async {
                  Get.back();
                  Get.offAndToNamed(
                    ThankYou.routeName,
                    arguments: [
                      screenNumValue,
                      _dayCareCon.getOderList!.order.refNumber,
                      _dayCareCon.getOderList!.order.invoiceDate
                    ],
                  );
                },
              );
              return const Text('success');
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
        },
      ),
      radius: 10.0,
    );
  }
}
