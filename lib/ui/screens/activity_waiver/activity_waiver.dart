import 'package:country_code_picker/country_code_picker.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/activity_waiver_model.dart';
import 'package:dogventurehq/ui/screens/create_account/cc_picker.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class ActivityWaiver extends StatefulWidget {
  static String routeName = '/activity_waiver';

  const ActivityWaiver({Key? key}) : super(key: key);

  @override
  State<ActivityWaiver> createState() => _ActivityWaiverState();
}

class _ActivityWaiverState extends State<ActivityWaiver> {
  bool _agreeFlag = false;
  String countryCode = '+971';
  int screenNumValue = 0;

  final EventController _eventController = Get.find<EventController>();

  ////get value form text filed
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _addressEditingController =
      TextEditingController();
  final TextEditingController _petNameEditingController =
      TextEditingController();
  final TextEditingController _colorEditingController = TextEditingController();
  final TextEditingController _breedEditingController = TextEditingController();
  final TextEditingController _microchipEditingController =
      TextEditingController();
  final TextEditingController _selectDateController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _nameEditingController.text = Preference.getNameFlag();
    _phoneEditingController.text = Preference.getPhoneFlag();
    _addressEditingController.text = Preference.getAddressFlag();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addH(20.h),
              Text(
                "Activity Waiver",
                style: TextStyle(
                    fontFamily: ConstantStrings.kAppFont,
                    fontSize: 20.sp,
                    color: HexColor('#0000')),
              ),
              addH(10.h),
              Text(
                "Lorem Ipsum is simply dummy",
                style: TextStyle(
                  fontFamily: ConstantStrings.kAppFont,
                  fontSize: 13.sp,
                ),
              ),
              addH(10.h),
              Text(
                "Nam vel arcu tellus. Nunc non pellentesque enim, non volutpat lorem.  Aliquam erat nunc, interdum a sodales a, consequat non erat. Nunc eu  lorem eu lectus ultricies ultricies. Aenean blandit, odio at rhoncus cursus,  orci lacus rhoncus enim, ut rutrum metus elit vitae sem. Class aptent  taciti sociosqu ad litora torquent per conubia nostra, per inceptos  himenaeos. Maecenas tempor felis a mi porta gravida. Duis ut ipsum  molestie nunc ultrices interdum ac sit amet elit. Aenean ut risus  consequat, eleifend massa in, finibus tellus. In quis venenatis ligula.  Nullam hendrerit porta sem id bibendum. Integer lobortis interdum odio  sed laoreet. Nulla facilisi.",
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
              addH(10.h),

              const Text(
                'Name:',
                style: TextStyle(fontSize: 12),
              ),
              addH(10),
              CustomField(
                h: 50.h,
                w: double.infinity,
                hintTxt: 'Enter  Name',
                textEditingController: _nameEditingController,
                inputType: TextInputType.name,
                validator: (value) {
                  return value!.isEmpty ? 'enter name' : null;
                },
              ),
              addH(10.h),
              const Text('Contact Number:', style: TextStyle(fontSize: 12)),
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
                      child: CCPicker(onChangedFn: changeCountryCode),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      indent: 18.h,
                      endIndent: 18.h,
                      color: Colors.grey.shade600,
                    ),
                    CustomField(
                      hintTxt: '554830683',
                      w: 158.w,
                      borderClr: Colors.transparent,
                      inputType: TextInputType.emailAddress,
                      textEditingController: _phoneEditingController,
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
              addH(10.h),
              const Text('Home Address:', style: TextStyle(fontSize: 12)),
              addH(10.h),
              CustomField(
                h: 50.h,
                w: double.infinity,
                hintTxt: 'Enter home address',
                inputType: TextInputType.text,
                textEditingController: _addressEditingController,
              ),
              const Text('Pet Name:', style: TextStyle(fontSize: 12)),
              addH(10.h),
              CustomField(
                h: 50.h,
                w: double.infinity,
                hintTxt: 'pet name',
                inputType: TextInputType.emailAddress,
                textEditingController: _petNameEditingController,
              ),
              const Text('Color:', style: TextStyle(fontSize: 12)),
              addH(10.h),
              CustomField(
                h: 50.h,
                w: double.infinity,
                hintTxt: 'color',
                inputType: TextInputType.text,
                textEditingController: _colorEditingController,
                validator: (value) {
                  return value!.isEmpty ? 'enter color' : null;
                },
              ),
              addH(10.h),
              const Text('Breed:', style: TextStyle(fontSize: 12)),
              addH(10.h),
              CustomField(
                h: 50.h,
                w: double.infinity,
                hintTxt: 'Breed',
                textEditingController: _breedEditingController,
                inputType: TextInputType.text,
              ),
              addH(10.h),
              const Text('Microchip No:', style: TextStyle(fontSize: 12)),
              addH(10.h),
              CustomField(
                h: 50.h,
                w: double.infinity,
                hintTxt: 'Microchip No',
                textEditingController: _microchipEditingController,
                inputType: TextInputType.number,
              ),
              addH(10.h),
              const Text('Date Of Birth:', style: TextStyle(fontSize: 12)),
              addH(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomField(
                    h: 50.h,
                    w: 250.w,
                    hintTxt: 'select Date',
                    inputType: TextInputType.emailAddress,
                    textEditingController: _selectDateController,
                    validator: (value) {
                      return value!.isEmpty ? 'select Date' : null;
                    },
                  ),
                  addW(20.w),
                  InkWell(
                      onTap: () {
                        _selectDate();
                      },
                      child: Icon(Icons.calendar_month)),
                ],
              ),
              addH(10.h),
              Row(
                children: [
                  Checkbox(
                    value: _agreeFlag,
                    splashRadius: 0,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                    textRichSize: 13.sp,
                    onPressed: () {},
                  ),
                ],
              ),

              CustomBtn(
                btnFn: _agreeFlag
                    ? () {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            _submitActivityWaiver();
                          });
                        } else {}
                      }
                    : () {},
                btnText: 'Submit',
                btnBgClr: _agreeFlag ? Colors.green.shade600 : Colors.grey,
                btnSize: Size(double.infinity.w, 50.h),
              ),
              addH(20.h),
            ],
          ),
        ),
      ),
    );
  }

  void changeCountryCode(CountryCode code) {
    countryCode = code.dialCode ?? '+880';
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        // dateInput.text = formattedDate; //set output date to TextField value.
        _selectDateController.text = formattedDate;
      });
    } else {}
  }

  void _submitActivityWaiver() {
    ActivityWaiverModel data = ActivityWaiverModel(
        activityWaiverId: 0,
        customerId: Preference.getUserId(),
        name: _nameEditingController.text,
        email: Preference.getEmailFlag(),
        phoneNo: _phoneEditingController.text,
        address: _addressEditingController.text,
        petName: _petNameEditingController.text,
        microchipNo: _microchipEditingController.text,
        color: _colorEditingController.text,
        breed: _breedEditingController.text,
        dateOfBirth: _selectDateController.text,
        createdAt: DateTime.now().toString());
    _eventController.postEventActivityWaiver(data);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_eventController.eventActivityWaiverLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_eventController.activityWaiverModelList != null) {
              Future.delayed(const Duration(seconds: 1), () async {
                Get.back();
              });
              Get.back();
              return const Text('Success');
            } else {
              return const Text('Failed');
            }
          }
        }),
        radius: 10.0);
    // Get.back();
  }
}
