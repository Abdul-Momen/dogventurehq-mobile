import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/vet_clinic_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/events/event_item.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/meet_team_item.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_clinic_item.dart';
import 'package:dogventurehq/ui/widgets/custom_dropdown.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/custom_adress_text.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_image_network.dart';
import '../../widgets/html_text.dart';
import '../registration/registration.dart';

class VetClinic extends StatefulWidget {
  static String routeName = '/vet_clinic';

  const VetClinic({Key? key}) : super(key: key);

  @override
  State<VetClinic> createState() => _VetClinicState();
}

class _VetClinicState extends State<VetClinic> {
  final VetClinicController _vetClinicController =
      Get.put(VetClinicController());

  final List<String> _vetClinicImage = [
    '01.png',
    '02.png',
    '03.png',
    '04.png',
    '05.png',
    '06.png',
    '07.png',
    '08.png',
    '01.png',
    '02.png',
    '03.png',
    '04.png',
    '05.png',
    '06.png',
    '07.png',
    '08.png',
    '01.png',
    '02.png',
    '03.png',
  ];
  final List<String> _drImage = [
    'assets/images/drrokas.jpg',
    'assets/images/drmustafa.jpg',
    'assets/images/drjoana.jpg',
  ];
  final List<String> _drTitle = [
    'DR Rokas',
    'DR Mustafa',
    'Dr Joana',
  ];
  final List<String> _drSubTitle = [
    '''Born in 1988 in Kaunas, Lithuania. 2013 Graduated from Lithuanian University of Health Sciences, formerly known as Lithuanian Veterinary Academy. 2017 relocated to the UK to complete a 2-month intensive emergency and critical care course with VetsNow and worked as an emergency vet for multiple practices as a locum and worked 2 years at a 24/7 animal hospital with mixed day and night shifts. 2019 relocated to UAE where he worked at Modern Veterinary Clinic.

Dr. Rokas has a main interest in emergency and critical care medicine with an additional interest in soft tissue surgery and dentistry. Outside work Rokas is a passionate billiards player, learning to play Squash as his new hobby and cycling.''',
    '''Mustafa Aboud graduated in 2008, as a doctor of veterinary medicine from Cairo University in Egypt, working as a small animal veterinary surgeon for more than 10 years where he gained experience in the field of general and orthopedic surgery, he really loves surgery but prefers to go for the less invasive treatments first when possible and only proceed with surgery when medically recommended. He moved to Dubai in November 2021 to take another step in his professional career and joined us at Dogventure in November 2021.''',
    '''Dr Joana was born in Portugal and relocated to Dubai in 2014 along with her dog Jamie. Before that, she worked at a number of clinics and hospitals in Portugal and the UK.''',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _vetClinicController.getVetClinicServicesList();
    _vetClinicController.getConsultationDetails(21448.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#0088AC"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
            title: "Vet Clinic", img_bg: 'assets/images/vet_clinic_bg.png'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (_vetClinicController.consultationLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_vetClinicController.consultationDetails == null) {
              return Text('No data found');
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    addH(5.h),
                    Text(
                      'ABOUT US',
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                        fontSize: 30.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    addH(10.h),
                    Text(
                      'What Makes Us Different From Other Clinics In Dubai?',
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    addH(10.h),
                    Text(
                      '''We don’t mean to blow our own trumpet… but we’re pretty incredible! We offer an extensive range of services at reasonable prices by highly skilled staff. We treat every patient as if they’re our own, because every pet that walks, hops or flies through our door are automatically welcomed into the Dogventure family. We take pride in providing exceptional service, with highly skilled veterinarians with special interests in orthopedics, ultrasound, dentistry and exotic species (birds, rabbits and reptiles). We have the ability to offer on-site physiotherapy and hydrotherapy sessions with our qualified veterinary nurse in our dedicated rehabilitation room, giving your pet the attention and care they need to make a full recovery.

We have a fully equipped surgical unit, ultrasound, x-ray and endoscopy and a calm and relaxing hospital unit with dimmed lights and soothing music to help your pet relax during their stay with us. We have unique equipment including Intensive care unit, automatic ventilating system and laser wound healing machine. We have a fully equipped laboratory with Incubator, Microscope and a top of the range PCR machine which enables us to quantify certain tests instead of sending them away to external labs. We offer nursing consultations to monitor progress of long term patients. Nursing consultations range from weight clinics to diabetes checks and medication administration. Our highly motivated, friendly, knowledgeable staff across the whole facility, work dynamically together to ensure the best possible care for your pet.''',
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFontPoppins,
                        fontSize: 11.0.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    //meet team
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Stack(
                        children: [
                          Image.asset(
                            height: 120.h,
                            'assets/images/meet_the_team.png',
                          ),
                          Positioned(
                            bottom: 30.h,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                Text(
                                  'Meet The Team',
                                  style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontSize: 13.sp),
                                ),
                                Center(
                                    child: Text(
                                  'MEET THE TEAM',
                                  style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      color: Colors.black,
                                      fontSize: 35.sp),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //team list
                    // Categories
                    SizedBox(
                      width: double.infinity,
                      height: 310.h,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {},
                              child: MeetTeamItem(
                                title: _drTitle[index],
                                subTitle: _drSubTitle[index],
                                img: _drImage[index],
                              ));
                        },
                      ),
                    ),

                    //for why HQ
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Stack(
                        children: [
                          Image.asset(
                            height: 170.h,
                            'assets/images/services_bg.png',
                          ),
                          Positioned(
                            bottom: 50.h,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                Text(
                                  ' Consultation',
                                  style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontSize: 13.sp),
                                ),
                                Center(
                                    child: Text(
                                  ' Why Dogventure HQ',
                                  style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      color: HexColor('#33B1C4'),
                                      fontSize: 35.sp),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    addH(10.h),
                    Obx(() {
                      if (_vetClinicController
                          .vetClinicServicesLoadingFlag.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (_vetClinicController.servicesList.isEmpty) {
                          return const Center(child: Text('data not found'));
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                children: List.generate(
                                    _vetClinicController.servicesList.length,
                                    (index) {
                                  return SizedBox(
                                    height: 118.h,
                                    child: VetClinicItem(
                                      servicesListModel: _vetClinicController
                                          .servicesList[index],
                                      image: _vetClinicImage[index],
                                    ),
                                  ); //robohash.org api provide you different images for any number you are giving
                                }),
                              ),
                            ],
                          );
                        }
                      }
                    }),
                    addH(20.h),

                    //image
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300.h,
                      child: CustomImageNetwork(
                        imageUrl: _vetClinicController.consultationDetails!
                            .productMasterMediaViewModels[0].mediumImage,
                      ),
                    ),
                    addH(15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Live the best , with your pet',
                            style: TextStyle(
                              fontFamily: ConstantStrings.kAppFontPoppins,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _vetClinicController
                                .consultationDetails!.productName,
                            style: TextStyle(
                              fontFamily: ConstantStrings.kAppFont,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   "Lorem Ipsum is simply dummy text of the printing and typesetting",
                          //   style: TextStyle(
                          //       color: HexColor("#B9B9B9"),
                          //       fontFamily: ConstantStrings
                          //           .kAppFontPoppins,
                          //       fontSize: 12.0,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          const CustomIconWithText(
                              address:
                                  'DogventureHQ,25c street, AlQuoz 3 industrial, Dubai, UAE'),
                          addH(10.h),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'AED  ',
                                  style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 20.0,
                                  ),
                                ),
                                TextSpan(
                                  text: _vetClinicController
                                      .consultationDetails!.productDecimal
                                      .toString(),
                                  style: TextStyle(
                                    color: HexColor("#4675c7"),
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' (vet included) ',
                                  style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFontPoppins,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          addH(40.h),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Service Details",
                                style: TextStyle(
                                  fontFamily: ConstantStrings.kAppFontPoppins,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomHtmlText(
                                text: _vetClinicController
                                    .consultationDetails!.description,
                              )
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: CustomBtn(
                          //     btnFn: () =>
                          //         Get.toNamed(ConsultationPage.routeName),
                          //     btnText: 'Go to Packages',
                          //     btnBgClr: Colors.indigo,
                          //   ),
                          // ),

                          addH(90.h),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        }),
      ),
      bottomSheet: Obx(() {
        if (_vetClinicController.consultationLoadingFlag.value) {
          return Text('');
        } else {
          if (_vetClinicController.consultationDetails != null) {
            return SizedBox(
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CustomBtn(
                      btnFn: () {
                        if (Preference.getLoggedInFlag()) {
                          if (_vetClinicController.consultationDetails !=
                              null) {
                            Get.toNamed(
                              RegistrationPage.routeName,
                              arguments: [
                                0,
                                1,
                                _vetClinicController
                                    .consultationDetails!.productDecimal
                              ],
                            );
                          } else {
                            DialogHelper.showToast('Empty Details');
                          }
                        } else {
                          Get.toNamed(LoginScreen.routeName, arguments: 2);
                        }
                      },
                      btnText: "Book Consultation",
                      btnBgClr: Colors.green,
                    ),
                  ),
                  addH(10.h),
                ],
              ),
            );
          } else {
            return Text('');
          }
        }
      }),
    );
  }
}
