import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/vet_clinic_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/payment/payment.dart';
import 'package:dogventurehq/ui/screens/registration/registration.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/html_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ConsultationPage extends StatefulWidget {
  static String routeName = '/vet_consultation';
  const ConsultationPage({Key? key}) : super(key: key);

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {

  final VetClinicController _vetClinicController=Get.put(VetClinicController());

  int? productMasterId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productMasterId = Get.arguments ?? 0;

    _vetClinicController.getConsultationDetails(productMasterId.toString());
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
        title: CustomTitlebar(
          title: "Consultation",
          img_bg: 'assets/images/vet_clinic_bg.png',
        ),
      ),
      body: SingleChildScrollView(
        child: Obx((){
          if(_vetClinicController.consultationLoadingFlag.value){
            return Center(child: CircularProgressIndicator());
          }else{
            if(_vetClinicController.consultationDetails==null){
              return Text('No data found');
            }else{
              return  Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300.h,
                    child:  CustomImageNetwork(
                      imageUrl: _vetClinicController
                          .consultationDetails!.productMasterMediaViewModels[0].mediumImage,
                    ),
                  ),
                  addH(15.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _vetClinicController
                              .consultationDetails!.productName,
                          style: TextStyle(
                            fontFamily: ConstantStrings.kAppFont,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting",
                          style: TextStyle(
                              color: HexColor("#B9B9B9"),
                              fontFamily: ConstantStrings
                                  .kAppFontPoppins,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                        CustomIconWithText(address: '56 3 B St - Al QuozAl Quoz 1 - Dubai 26 km.'),
                        addH(10.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'AED  ',  style: TextStyle(
                                fontFamily: ConstantStrings.kAppFont,
                                fontSize: 20.0,
                              ),),

                              TextSpan(
                                text: _vetClinicController.consultationDetails!.productDecimal.toString(),
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
                              "Service Details",
                              style: TextStyle(
                                fontFamily:
                                ConstantStrings.kAppFontPoppins,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            CustomHtmlText(text:  _vetClinicController.consultationDetails!.description,)

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

                        addH(30.h),

                      ],
                    ),
                  ),


                ],
              );
            }
          }
        }
        ),
      ),
      bottomSheet:SizedBox(
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomBtn(
                btnFn: () {
                  if (Preference.getLoggedInFlag()) {
                    if (_vetClinicController.consultationDetails != null) {
                      Get.toNamed(RegistrationPage.routeName,
                          arguments: [0, 1]);
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
      ),

    );
  }
}
