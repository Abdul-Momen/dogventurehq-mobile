import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/termsConditions_controller.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/html_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final TermsConditionsController _termsConditionsController=Get.put(TermsConditionsController());

  @override
  void initState() {
    // TODO: implement initState
    _termsConditionsController.getTermsConditionsList(ConstantStrings.kPrivacyAndPolicy);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: "Privacy Policy",
            img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addH(20.h),
              Obx(() {
                if (_termsConditionsController.termsConditionsLoadingFlag.value) {
                  print(_termsConditionsController.termsConditionsList.toString());
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (_termsConditionsController.termsConditionsList.isEmpty) {
                    return Text('No data found');
                  } else {
                    return CustomHtmlText(text: _termsConditionsController.termsConditionsList[0].html,);
                  }
                }
              } )

            ],
          ),
        ),
      ),
    );
  }
}
