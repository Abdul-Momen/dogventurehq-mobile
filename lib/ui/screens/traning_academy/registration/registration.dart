import 'package:country_code_picker/country_code.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/day_care_controller.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:dogventurehq/states/controllers/termsConditions_controller.dart';
import 'package:dogventurehq/states/controllers/training_academy_controller.dart';
import 'package:dogventurehq/states/controllers/vet_clinic_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/states/models/order_model.dart';
import 'package:dogventurehq/states/models/registration_model.dart';
import 'package:dogventurehq/states/models/services_list_model.dart';
import 'package:dogventurehq/ui/screens/activity_waiver/activity_waiver.dart';
import 'package:dogventurehq/ui/screens/add_pet/add_pet.dart';
import 'package:dogventurehq/ui/screens/add_pet/custom_checkbox.dart';
import 'package:dogventurehq/ui/screens/create_account/cc_picker.dart';
import 'package:dogventurehq/ui/screens/registration/date_item.dart';
import 'package:dogventurehq/ui/screens/registration/pet_item_list.dart';
import 'package:dogventurehq/ui/screens/registration/terms_condition.dart';
import 'package:dogventurehq/ui/screens/terms_and_conditions/terms_and_conditions.dart';
import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
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

class TrainingRegiScreen extends StatefulWidget {
  static String routeName = '/registration';

  const TrainingRegiScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainingRegiScreen> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<TrainingRegiScreen> {
  String countryCode = '+971';
  bool _agreeFlag = false;
  bool _agreeWaiverFlag = false;
  int screenNumValue = 0;

  int numOfTicket = 0;

  double totalPrice = 0;
  List<InvoiceRequestModel> invoiceList = List.empty(growable: true);
  List<RegistrationModel> regModels = List.empty(growable: true);
  List<TextEditingController> nameTextController = List.empty(growable: true);
  List<TextEditingController> mobileTextController = List.empty(growable: true);
  List<TextEditingController> emailTextController = List.empty(growable: true);
  List<int> selectPetController = List.empty(growable: true);

  List<String> petNameList = List.empty(growable: true);
  ServicesListModel? _selectedGroomingServiceList;

  final RegistrationController _registrationController =
      Get.put(RegistrationController());
  final EventController _eventController = Get.put(EventController());
  final VetClinicController _vetClinicController =
      Get.put(VetClinicController());
  final TrainingAcademyController _trainingAcademyController =
      Get.put(TrainingAcademyController());
  final DayCareController _dayCareController = Get.put(DayCareController());
  final TermsConditionsController _termsConditionsController =
      Get.put(TermsConditionsController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (Get.arguments != null) {
      screenNumValue = Get.arguments[0];
      numOfTicket = Get.arguments[1];
    }

    for (int i = 0; i < numOfTicket; i++) {
      nameTextController.add(TextEditingController());
      mobileTextController.add(TextEditingController());
      emailTextController.add(TextEditingController());
      petNameList.add('SELECT-PET');
    }

    nameTextController[0].text = Preference.getNameFlag();
    mobileTextController[0].text = Preference.getPhoneFlag();
    emailTextController[0].text = Preference.getEmailFlag();

    if (screenNumValue == 3 || screenNumValue == 1) {
      _agreeWaiverFlag = true;
    }
    //  print(screenNumValue);
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
                                  : _registrationController
                                      .validateEmail(value);
                            },
                          ),

                          addH(10.h),

                          //select pet
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 70.h,
                                width: 300.w,
                                child: CustomCardItem(
                                  setPetsIdFn: (List<int> petIdlist) {
                                    print("Test id list=> $petIdlist");
                                  },
                                  setPetsNameFn: (List<String> petNameLis) {
                                    print("Test name list=> $petNameLis");
                                    setState(() {
                                      petNameList = petNameLis;
                                      totalPrice = 0;
                                      totalPrice = _selectedGroomingServiceList!
                                              .productSubSkuRequestModels[0]
                                              .price *
                                          petNameList.length.toInt();
                                      print("Test save list=> $petNameList");
                                    });
                                  },
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

                          if (screenNumValue == 0 ||
                              screenNumValue == 1 && screenNumValue != 2)
                            Column(
                              children: [
                                CustomSelectDate(),
                                // password
                                addH(10.h),

                                const Text('Select Time:'),
                                addH(10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DateItem(
                                      time: "07 AM - 08 AM",
                                      onTimeTap: onTimeTap,
                                    ),
                                    DateItem(
                                      time: "08 AM - 09 AM",
                                      onTimeTap: onTimeTap,
                                    ),
                                    DateItem(
                                      time: "07 AM - 10 AM",
                                      onTimeTap: onTimeTap,
                                    ),
                                  ],
                                ),
                                addH(10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DateItem(
                                      time: "10 AM - 08 AM",
                                      onTimeTap: onTimeTap,
                                    ),
                                    DateItem(
                                      time: "06 AM - 11 AM",
                                      onTimeTap: onTimeTap,
                                    ),
                                    DateItem(
                                      time: "03 AM - 08 AM",
                                      onTimeTap: onTimeTap,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          addH(10.h),
                        ],
                      ),
                    if (screenNumValue != 0 &&
                        screenNumValue != 1 &&
                        screenNumValue != 2 &&
                        screenNumValue != 3)
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: CustomCheckbox(
                          initialValue: _agreeFlag,
                          onChangedFn: (value) => setState(
                            () => _agreeFlag = value!,
                          ),
                          title: ConstantStrings.kAgreeTermsTxt,
                          numOfLine: 2,
                        ),
                      ),
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
                    if (screenNumValue == 2 ||
                        screenNumValue == 3 ||
                        screenNumValue == 0)
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
                            textRichSize: 17.sp,
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
                    CustomBtn(
                      btnSize: Size(388.w, 52.h),
                      btnFn: _agreeFlag && _agreeWaiverFlag
                          ? _getRegisterBtnTxtClick(screenNumValue)
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

  VoidCallback _getRegisterBtnTxtClick(int value) {
    switch (value) {
      case 0:
        return () {
          //TODO: add login for fisrt registration process.
          //TODO: add login for second registration process.
          if (_key.currentState!.validate()) {
          } else {}
        };
      case 1:
        return () {
          //TODO: add login for second registration process.
          if (_key.currentState!.validate()) {
            setState(() {
              _placeTraining();
            });
          } else {}
          //TODO: add login for second registration process.
        };
      case 2:
        return () {
          if (_key.currentState!.validate()) {
          } else {}
          //TODO: add login for second registration process.
        };

      default:
        return () {
          //TODO: show a popup
        };
    }
  }

  void changeCountryCode(CountryCode code) {
    countryCode = code.dialCode ?? '+880';
    _registrationController.countryCode.value = countryCode;
  }

  void onTimeTap(String value) {
    _registrationController.selectTime.value = value;
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

  void _placeTraining() async {
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
          password: Preference.getPasswordFlag());

      regModels.add(registrationModel);
      // _registrationController.userRegistration();

    }
    // print('reg models');
    // print(regModels.length);

    _registrationController.userRegistration(
      rModels: regModels,
      isFirstTime: true,
    );
    invoiceList.clear();
    // invoiceList.add(
    //   InvoiceRequestModel(
    //     invoiceId: 0,
    //     totalAmount: _trainingAcademyController.trainingDetails!.productDecimal,
    //     receivedAmt: 0,
    //     paymentMethod: 1,
    //     carryingCost: 0,
    //     courierCharge: 0,
    //     storeId: _trainingAcademyController.trainingDetails!.storeId,
    //     supplierId: _trainingAcademyController
    //         .trainingDetails!.supplierRequestModel.supplierId,
    //     invoiceStatusId: 0,
    //     isService: true,
    //     ticketBuyForCustomerId: 0,
    //     invoiceDetailsRequestModels: [
    //       InvoiceDetailsRequestModel(
    //         invoiceDetailsId: 0,
    //         invoiceId: 0,
    //         productMasterId: _trainingAcademyController
    //             .trainingDetails!.productDetailsRequestModel.productMasterId,
    //         quantity: 1,
    //         price: _trainingAcademyController.trainingDetails!.productDecimal,
    //         productSubSkuId: 0,
    //       )
    //     ],
    //     invoiceDetailsViewModels: [],
    //     eventPetDetailsRequestModels: [],
    //   ),
    // );

    _eventController.eventBookingLoadingFlag.value = true;

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_eventController.eventBookingLoadingFlag.value) {
            if (_registrationController.registrationLoadingFlag.isFalse) {
              for (int i = 1; i < numOfTicket; i++) {
                // invoiceList.add(
                //   InvoiceRequestModel(
                //     invoiceId: 0,
                //     totalAmount: 85,
                //     receivedAmt: 85,
                //     paymentMethod: 1,
                //     carryingCost: 0,
                //     courierCharge: 0,
                //     storeId: 40230,
                //     supplierId: 10185,
                //     invoiceStatusId: 0,
                //     isService: true,
                //     ticketBuyForCustomerId:
                //         _registrationController.customerIds[i],
                //     invoiceDetailsRequestModels: [
                //       InvoiceDetailsRequestModel(
                //         invoiceDetailsId: 0,
                //         invoiceId: 0,
                //         productMasterId: _eventController
                //             .eventDetails!
                //             .eventTicketsProductMasterViewModels![0]
                //             .productMasterId,
                //         quantity: 1,
                //         price: 85,
                //         productSubSkuId: 0,
                //       )
                //     ],
                //     invoiceDetailsViewModels: [],
                //     eventPetDetailsRequestModels: [],
                //   ),
                // );
              }
              OrderModel orderModel = OrderModel(
                invoiceMasterId: 0,
                customerId: Preference.getUserId(),
                totalAmount:
                    _trainingAcademyController.trainingDetails!.productDecimal,
                receivedAmt: 0,
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
                    amount: _trainingAcademyController
                        .trainingDetails!.productDecimal,
                    courierCharge: 0,
                    carryingCost: 0,
                    paymentMethod: 1,
                  ),
                ],
                orderFrom: 'App',
                orderSource: 'Training Academy',
              );
              print('calling vet consultation method:');
              _eventController.postEventBooking(orderModel);
            }
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_eventController.getOderList != null) {
              print(_eventController.getOderList);
              Future.delayed(const Duration(seconds: 0), () async {
                Get.back();
                Get.offAndToNamed(ThankYou.routeName, arguments: [
                  screenNumValue,
                  _eventController.getOderList!.order.refNumber,
                  _eventController.getOderList!.order.invoiceDate
                ]);
              });
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
        }),
        radius: 10.0);
  }
}
