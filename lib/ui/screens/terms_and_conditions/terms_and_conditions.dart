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
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  final TermsConditionsController _termsConditionsController=Get.put(TermsConditionsController());

  @override
  void initState() {
    // TODO: implement initState
    _termsConditionsController.getTermsConditionsList(ConstantStrings.kTermsAndConditions);
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
            title: "Terms and Conditions",
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
