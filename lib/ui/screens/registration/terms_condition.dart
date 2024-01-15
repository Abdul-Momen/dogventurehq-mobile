import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/termsConditions_controller.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {

  final TermsConditionsController _termsConditionsController=Get.put(TermsConditionsController());
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addH(20.h),
          Text(
            "Terms and Condition",
            style: TextStyle(
              fontFamily: ConstantStrings.kAppFont,
              fontSize: 50.sp,
            ),
          ),
          addH(10.h),

          Obx(() {
            if (_termsConditionsController.termsConditionsLoadingFlag.value) {
              print(_termsConditionsController.termsConditionsList.toString());
              return Center(child: CircularProgressIndicator());
            } else {
              if (_termsConditionsController.termsConditionsList.isEmpty) {
                return Text('No data found');
              } else {
                return buildText(_termsConditionsController.termsConditionsList[0].html);
              }
            }
          } )


        ],
      ),
    );
  }

  Widget buildText(String text) {
    // if read more is false then show only 3 lines from text
    // else show full text

    return HtmlWidget(
      // the first parameter (`html`) is required
      text,

      // all other parameters are optional, a few notable params:

      // specify custom styling for an element
      // see supported inline styling below
      customStylesBuilder: (element) {
        if (element.classes.contains('foo')) {
          return {'color': 'red'};
        }

        return null;
      },

      // // render a custom widget
      // customWidgetBuilder: (element) {
      //   if (element.attributes['foo'] == 'bar') {
      //     return FooBarWidget();
      //   }
      //
      //   return null;
      // },

      // turn on selectable if required (it's disabled by default)
      isSelectable: true,

      // these callbacks are called when a complicated element is loading
      // or failed to render allowing the app to render progress indicator
      // and fallback widget
      onErrorBuilder: (context, element, error) => Text('$element error: $error'),
      onLoadingBuilder: (context, element, loadingProgress) => CircularProgressIndicator(),

      // this callback will be triggered when user taps a link
      onTapUrl: (url)=>_openUrl(url),

      // select the render mode for HTML body
      // by default, a simple `Column` is rendered
      // consider using `ListView` or `SliverList` for better performance
      renderMode: RenderMode.column,

      // set the default styling for text
      textStyle: TextStyle(fontSize: 14),

      // turn on `webView` if you need IFRAME support (it's disabled by default)
      webView: true,
    );

  }

  _openUrl(String urls)async{
    print('Map');
    final url = Uri.parse(urls);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

}
