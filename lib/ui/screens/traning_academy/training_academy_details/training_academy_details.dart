import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/perent_category_controller.dart';
import 'package:dogventurehq/states/controllers/training_academy_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/payment/payment.dart';
import 'package:dogventurehq/ui/screens/registration/registration.dart';
import 'package:dogventurehq/ui/screens/traning_academy/training_academy_details/traning_dhq_item.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/html_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_clinic_item.dart';

class TrainingDetailsPage extends StatefulWidget {
  static String routeName = '/training_details';

  const TrainingDetailsPage({Key? key}) : super(key: key);

  @override
  State<TrainingDetailsPage> createState() => _TrainingDetailsPageState();
}

class _TrainingDetailsPageState extends State<TrainingDetailsPage> {
  final ParentCategoryController _parentCategoryController =
      Get.put(ParentCategoryController());
  final TrainingAcademyController _trainingAcademyController =
      Get.put(TrainingAcademyController());

  int? productMasterId;
  final List<String> _TraningImage = [
    '01.png',
    '02.png',
    '03.png',
    '04.png',
    '05.png',
    '06.png',
    '07.png',
    '08.png',
  ];
  final List<String> _TraningName = [
    'DELUXE service',
    'OUR EMPLOYEES CARE',
    'HAPPY ENVIRONMENT',
    'WE ARE HERE TO STAY',
    'Basic Obedience',
    '06.png',
    '07.png',
    '08.png',
  ];
  final List<String> _TraningSubTitle = [
    'Mauris tempor hendrerit sapien, eget dapibus leo interdum aliquaulla...',
    'Mauris tempor hendrerit sapien, eget dapibus leo interdum aliquaulla...',
    'Mauris tempor hendrerit sapien, eget dapibus leo interdum aliquaulla...',
    'Mauris tempor hendrerit sapien, eget dapibus leo interdum aliquaulla...',
    'Mauris tempor hendrerit sapien, eget dapibus leo interdum aliquaulla...',
    'Mauris tempor hendrerit sapien, eget dapibus leo interdum aliquaulla...',
    'Mauris tempor hendrerit sapien, eget dapibus leo interdum aliquaulla...',
    'Mauris tempor hendrerit sapien, eget dapibus leo interdum aliquaulla...',
  ];

  List<String> imageList = [
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/01.png',
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/07.png',
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/02.png',
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/06.png',
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/09.png',
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/03.png',
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/08.png',
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/04.png',
    'https://dogventurehq.com/Areas/Website/Content/src/images/portfolio/05.png',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _parentCategoryController.getParentCategory();
    productMasterId = Get.arguments ?? 0;
    _trainingAcademyController.getTrainingDetails(productMasterId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const CustomTitlebar(
            title: "Training Academy",
            img_bg: 'assets/images/traning_academy_bg.png',
          ),
          Obx(() {
            if (_trainingAcademyController.trainingDetailsLoadingFlag.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_trainingAcademyController.trainingDetails == null) {
                return const Text('No data found');
              } else {
                return SizedBox(
                  height: 700.h,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 300.h,
                          child: CustomImageNetwork(
                            imageUrl: _trainingAcademyController
                                .trainingDetails!
                                .productMasterMediaViewModels[0]
                                .mediumImage,
                          ),
                        ),
                        addH(15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _trainingAcademyController
                                    .trainingDetails!.productName,
                                style: TextStyle(
                                  fontFamily: ConstantStrings.kAppFont,
                                  fontSize: 30.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              /*Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting",
                                style: TextStyle(
                                    color: HexColor("#B9B9B9"),
                                    fontFamily:
                                        ConstantStrings.kAppFontPoppins,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),*/
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
                                      text: _trainingAcademyController
                                          .trainingDetails!.productDecimal
                                          .toString(),
                                      style: TextStyle(
                                        color: HexColor("#F98C10"),
                                        fontFamily: ConstantStrings.kAppFont,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
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
                                    "Training Details",
                                    style: TextStyle(
                                      fontFamily:
                                          ConstantStrings.kAppFontPoppins,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CustomHtmlText(
                                    text: _trainingAcademyController
                                        .trainingDetails!.description,
                                  )
                                ],
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
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                          Center(
                                              child: Text(
                                            ' Why Dogventure HQ',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                color: Colors.black,
                                                fontSize: 35.sp),
                                          )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              addH(10.h),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 3,
                                    shrinkWrap: true,
                                    children: List.generate(8, (index) {
                                      return SizedBox(
                                        height: 150.h,
                                        child: TrainingDHQItem(
                                          title: _TraningName[index],
                                          image: _TraningImage[index],
                                          subTitle: _TraningSubTitle[index],
                                        ),
                                      ); //robohash.org api provide you different images for any number you are giving
                                    }),
                                  ),
                                ],
                              ),
                              addH(20.h),
                              //for photo gallery
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
                                            'photo gallary',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                fontSize: 13.sp),
                                          ),
                                          Center(
                                              child: Text(
                                            'Happy Moments',
                                            style: TextStyle(
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                                color: Colors.black,
                                                fontSize: 35.sp),
                                          )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              StaggeredGrid.count(
                                crossAxisCount: 4,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                children: [
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 2,
                                    mainAxisCellCount: 2,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[0],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 2,
                                    mainAxisCellCount: 1,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[1],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 1,
                                    mainAxisCellCount: 1,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[2],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 1,
                                    mainAxisCellCount: 1,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[3],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 1,
                                    mainAxisCellCount: 1,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[4],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 1,
                                    mainAxisCellCount: 1,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[5],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 2,
                                    mainAxisCellCount: 3,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[6],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 2,
                                    mainAxisCellCount: 2,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[7],
                                    ),
                                  ),
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 4,
                                    mainAxisCellCount: 2,
                                    child: CustomImageNetwork(
                                      imageUrl: imageList[8],
                                    ),
                                  ),
                                ],
                              ),

                              addH(50.h),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 100),
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: 300.h,
                        //     child:  CustomImageNetwork(
                        //       imageUrl: _parentCategoryController.parentCategoryList[1].largeImage,
                        //     ),
                        //   ),
                        // ),
                        // addH(15.h),
                        // SizedBox(
                        //   height: 80.h,
                        //   width: double.infinity,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 20.0),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "Save Animal  ·  Animal Show",
                        //           style: TextStyle(
                        //               fontFamily:
                        //               ConstantStrings.kAppFontPoppins,
                        //               fontSize: 12.0.sp,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         Text(
                        //           _parentCategoryController.parentCategoryList[1].name,
                        //           style: TextStyle(
                        //             color: HexColor("#419625"),
                        //             fontFamily: ConstantStrings.kAppFont,
                        //             fontSize: 35.0.sp,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20.0, right: 20),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       // Text(
                        //       //   "About Event",
                        //       //   style: TextStyle(
                        //       //     fontFamily: ConstantStrings.kAppFont_Poppins,
                        //       //     fontSize: 15.0,
                        //       //     fontWeight: FontWeight.bold,
                        //       //   ),
                        //       // ),
                        //       Text(
                        //         _parentCategoryController.parentCategoryList[1].subTitle,
                        //         style: TextStyle(
                        //           fontFamily: ConstantStrings.kAppFontPoppins,
                        //           fontSize: 15.0.sp,
                        //         ),
                        //       ),
                        //       // Container(
                        //       //   width: double.infinity,
                        //       //   height: 40.h,
                        //       //   child: Padding(
                        //       //     padding: const EdgeInsets.all(8.0),
                        //       //     child: Text("Show more",
                        //       //         style: TextStyle(
                        //       //           color: HexColor("#F98C10"),
                        //       //           fontFamily:
                        //       //               ConstantStrings.kAppFont_Poppins,
                        //       //           fontWeight: FontWeight.bold,
                        //       //           fontSize: 10.0,
                        //       //         )),
                        //       //   ),
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20.0, right: 20),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Photos",
                        //         style: TextStyle(
                        //           fontFamily: ConstantStrings.kAppFont_Poppins,
                        //           fontSize: 18.0.sp,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       addH(10.h),
                        //       Container(
                        //         width: double.infinity,
                        //         height: 300.h,
                        //         child: GridView.count(
                        //           scrollDirection: Axis.horizontal,
                        //           crossAxisCount: 2,
                        //           children: List.generate(12, (index) {
                        //             return Card(
                        //               child: Image.network(
                        //                 "https://thumbs.dreamstime.com/b/golden-retriever-dog-21668976.jpg",
                        //                 fit: BoxFit.fill,
                        //               ),
                        //             ); //robohash.org api provide you different images for any number you are giving
                        //           }),
                        //         ),
                        //       ),
                        //       addH(10.h),
                        //       Text("Show more",
                        //           style: TextStyle(
                        //             color: HexColor("#F98C10"),
                        //             fontFamily:
                        //                 ConstantStrings.kAppFont_Poppins,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 10.0,
                        //           )),
                        //       addH(20.h),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.only(left: 20.0, bottom: 20),
                        //   child: CustomBtn(
                        //     btnSize: Size(380.w, 35.h),
                        //     btnFn: () =>
                        //         Get.toNamed(TrainingDetailsPage.routeName),
                        //     btnText: 'Go to Packages',
                        //     btnBgClr: Colors.indigo,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20.0),
                        //   child: CustomBtn(
                        //     btnSize: Size(380.w, 62.h),
                        //     btnFn: () =>
                        //
                        //     btnText: 'Book Consultation',
                        //     btnBgClr: Colors.green,
                        //   ),
                        // ),
                        addH(30.h)
                      ],
                    ),
                  ),
                );
              }
            }
          }),
        ],
      ),
      bottomSheet: Obx(() {
        if (_trainingAcademyController.trainingDetailsLoadingFlag.value) {
          return const SizedBox.shrink();
        } else {
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
                        Get.toNamed(
                          RegistrationPage.routeName,
                          arguments: [
                            1,
                            1,
                            _trainingAcademyController
                                .trainingDetails!.productDecimal
                          ],
                        );
                      } else {
                        Get.toNamed(
                          LoginScreen.routeName,
                          arguments: 2,
                        );
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
        }
      }),
    );
  }
}
