import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/price_guide/day_care_price.dart';
import 'package:dogventurehq/ui/screens/price_guide/event_page.dart';
import 'package:dogventurehq/ui/screens/price_guide/grooming_page.dart';
import 'package:dogventurehq/ui/screens/price_guide/price_item.dart';
import 'package:dogventurehq/ui/screens/price_guide/traning_page.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dogventurehq/constants/strings.dart';

class PriceGuideScreen extends StatefulWidget {
  static String routeName = '/priceguide';

  const PriceGuideScreen({Key? key}) : super(key: key);

  @override
  State<PriceGuideScreen> createState() => _PriceGuideScreenState();
}

class _PriceGuideScreenState extends State<PriceGuideScreen> {
  final List<String> _priceTypes = [
    'DAY CARE',
    'EVENTS',
    'GROOMING',
    'TRAINING',
  ];

  String _selectedPriceType = 'DAY CARE';

  int _selectedpage = 0; //initial value

  //bottom navigation pages
  final _pageOptions = [
    DayCarePage(),
    EventPage(),
    GroomingPage(),
    TrainingPage(),
  ]; // listing of all 3 pages index wise

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#F98C10"),
        ),
        toolbarHeight: 129.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
          title: 'Price Guide',
          img_bg: 'assets/images/store_bg.png',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addH(10.h),
          SizedBox(
              width: 400.w,
              height: 44.h,
              child: ListView.builder(
                itemCount: _priceTypes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        _selectedPriceType = _priceTypes[index];
                        setState(() {
                          _selectedpage = index;
                        });
                      },
                      child: Container(
                        height: 44.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          color: _priceTypes[index] == _selectedPriceType
                              ? HexColor("#F98C10")
                              : Colors.white,
                          border: Border.all(color: HexColor("#F98C10")),
                        ),
                        child: Text(
                          _priceTypes[index],
                          style: TextStyle(
                              color: _priceTypes[index] == _selectedPriceType
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: ConstantStrings.kAppFont),
                        ),
                      ));
                },
              )),
          addH(10.h),
          SizedBox(
            height: 690.h,
            width: double.infinity,
            child: SingleChildScrollView(
              child: _pageOptions[_selectedpage],
            ),
          ),
        ],
      ),
    );
  }
}
